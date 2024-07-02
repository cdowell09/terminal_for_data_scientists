import typer

app = typer.Typer()


@app.command()
def hello(name: str):
    typer.echo(f"Hello {name}!")


if __name__ == "__main__":
    app()


def main(
    name: str,
    age: int = typer.Option(18, "--age", "-a"),
    is_student: bool = typer.Option(False, "--student/--not-student"),
):
    typer.echo(f"Name: {name}, Age: {age}, Student: {is_student}")


if __name__ == "__main__":
    typer.run(main)
