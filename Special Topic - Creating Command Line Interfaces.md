# Special Topic: Creating Command-Line Interfaces with Typer

## Introduction to Typer

Typer is a library for building CLIs with Python 3.6+ based on Python type hints. It's built on top of Click and is designed to be intuitive and easy to use while still being powerful.

## Installation

Install Typer using pip:

```bash
pip install typer
```

For autocompletion and other optional features, install with extras:

```bash
pip install "typer[all]"
```

## Basic Usage

Here's a simple example to get started:

```python
import typer

app = typer.Typer()

@app.command()
def hello(name: str):
    typer.echo(f"Hello {name}!")

if __name__ == "__main__":
    app()
```

Run this script:

```bash
python script.py hello World
```

Output:
```
Hello World!
```

## Command Groups

Typer allows you to create command groups easily:

```python
import typer

app = typer.Typer()
db_app = typer.Typer()
app.add_typer(db_app, name="db")

@app.command()
def hello(name: str):
    typer.echo(f"Hello {name}!")

@db_app.command("create")
def db_create():
    typer.echo("Creating DB")

@db_app.command("delete")
def db_delete():
    typer.echo("Deleting DB")

if __name__ == "__main__":
    app()
```

## Options and Arguments

Typer uses type hints to define options and arguments:

```python
import typer

def main(
    name: str,
    age: int = typer.Option(18, "--age", "-a"),
    is_student: bool = typer.Option(False, "--student/--not-student")
):
    typer.echo(f"Name: {name}, Age: {age}, Student: {is_student}")

if __name__ == "__main__":
    typer.run(main)
```

Run it:

```bash
python script.py John --age 25 --student
```

## File Handling

Typer can handle file input/output:

```python
import typer
from typing import Optional
from pathlib import Path

def process_file(
    input_file: Path = typer.Argument(..., exists=True, readable=True),
    output_file: Optional[Path] = typer.Option(None, writable=True)
):
    text = input_file.read_text()
    processed = text.upper()
    if output_file:
        output_file.write_text(processed)
    else:
        typer.echo(processed)

if __name__ == "__main__":
    typer.run(process_file)
```

## Rich Output

Typer integrates well with Rich for beautiful console output:

```python
import typer
from rich.console import Console
from rich.table import Table

console = Console()

def main():
    table = Table("Name", "Age")
    table.add_row("Alice", "30")
    table.add_row("Bob", "22")
    console.print(table)

if __name__ == "__main__":
    typer.run(main)
```

## Progress Bars

You can use Rich's progress bars with Typer:

```python
import typer
from rich.progress import track
import time

def process_data():
    total = 1000
    for value in track(range(total), description="Processing..."):
        # Simulate some work
        time.sleep(0.01)

if __name__ == "__main__":
    typer.run(process_data)
```

## Handling Errors

Typer provides ways to handle errors gracefully:

```python
import typer

def main(value: int):
    if value < 0:
        typer.secho("Error: Value must be non-negative", fg=typer.colors.RED)
        raise typer.Exit(code=1)
    typer.echo(f"The value is: {value}")

if __name__ == "__main__":
    typer.run(main)
```

## Prompts and Confirmations

Typer can handle user input and confirmations:

```python
import typer

def main():
    name = typer.prompt("What's your name?")
    if typer.confirm(f"Is your name {name}?"):
        typer.echo(f"Hello {name}!")
    else:
        typer.echo("I'm sorry for the confusion.")

if __name__ == "__main__":
    typer.run(main)
```

## Practical Example: Data Processing CLI

Let's create a more comprehensive example for a data processing CLI:

```python
import typer
import pandas as pd
from pathlib import Path
from rich.console import Console
from rich.table import Table

app = typer.Typer()
console = Console()

@app.command()
def process(
    input_file: Path = typer.Argument(..., exists=True, readable=True),
    output_file: Path = typer.Option(None, "--output", "-o", writable=True),
    operation: str = typer.Option("mean", "--operation", "-op", help="Operation to perform: mean, sum, or median")
):
    """Process a CSV file and perform a specified operation."""
    try:
        df = pd.read_csv(input_file)
        if operation == "mean":
            result = df.mean()
        elif operation == "sum":
            result = df.sum()
        elif operation == "median":
            result = df.median()
        else:
            typer.secho(f"Error: Unknown operation '{operation}'", fg=typer.colors.RED)
            raise typer.Exit(code=1)
        
        if output_file:
            result.to_csv(output_file)
            typer.secho(f"Results saved to {output_file}", fg=typer.colors.GREEN)
        else:
            table = Table("Column", "Result")
            for col, val in result.items():
                table.add_row(str(col), f"{val:.2f}")
            console.print(table)
    
    except Exception as e:
        typer.secho(f"Error: {str(e)}", fg=typer.colors.RED)
        raise typer.Exit(code=1)

@app.command()
def info(input_file: Path = typer.Argument(..., exists=True, readable=True)):
    """Display information about a CSV file."""
    try:
        df = pd.read_csv(input_file)
        typer.echo(f"File: {input_file}")
        typer.echo(f"Shape: {df.shape}")
        typer.echo("\nColumn Info:")
        for col in df.columns:
            typer.echo(f"  - {col}: {df[col].dtype}")
    except Exception as e:
        typer.secho(f"Error: {str(e)}", fg=typer.colors.RED)
        raise typer.Exit(code=1)

if __name__ == "__main__":
    app()
```

This script provides two commands:
1. `process`: Reads a CSV file, performs an operation (mean, sum, or median), and outputs the result.
2. `info`: Displays information about a CSV file.

Usage:
```bash
python script.py process data.csv --operation mean
python script.py info data.csv
```

## Best Practices

1. Use type hints consistently for clear parameter definitions.
2. Provide helpful error messages and use appropriate exit codes.
3. Use Rich for complex output formatting.
4. Implement `--help` documentation for each command and option.
5. Use command groups to organize related functionality.
6. Consider using `typer.Argument` for required inputs and `typer.Option` for optional parameters.
7. Implement progress bars for long-running operations.
8. Use confirmations for destructive operations.

## Conclusion

Typer provides a powerful and intuitive way to create command-line interfaces for your Python scripts. It's particularly useful for data scientists who want to create user-friendly tools for data processing, analysis, and model training. By combining Typer with libraries like Pandas and Rich, you can create sophisticated CLIs that enhance your data science workflow.