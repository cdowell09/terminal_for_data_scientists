# Lesson 14: Automating Tasks with Shell Scripts

Shell scripts are powerful tools for automating repetitive tasks, combining multiple commands, and creating custom utilities. For data scientists, shell scripts can be incredibly useful for data preprocessing, batch processing, and automating workflows.

## Basic Shell Script Structure

A shell script is a text file containing a series of commands. Here's a basic structure:

```bash
#!/bin/bash

# This is a comment
echo "Hello, World!"
```

The `#!/bin/bash` is called a shebang and specifies which interpreter should run the script.

## Creating and Running a Shell Script

1. Create a new file with a `.sh` extension:
   ```bash
   touch myscript.sh
   ```

2. Open the file in a text editor and add your commands.

3. Make the script executable:
   ```bash
   chmod +x myscript.sh
   ```

4. Run the script:
   ```bash
   ./myscript.sh
   ```

## Variables in Shell Scripts

You can use variables to store and manipulate data:

```bash
#!/bin/bash

NAME="Alice"
echo "Hello, $NAME!"

# Command substitution
CURRENT_DATE=$(date +%Y-%m-%d)
echo "Today is $CURRENT_DATE"
```

## Control Structures

### If-Else Statements

```bash
#!/bin/bash

FILE="data.csv"
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else
    echo "$FILE does not exist."
fi
```

### Loops

For loop:
```bash
#!/bin/bash

for i in {1..5}
do
   echo "Number: $i"
done
```

While loop:
```bash
#!/bin/bash

counter=1
while [ $counter -le 5 ]
do
    echo "Counter: $counter"
    ((counter++))
done
```

## Functions

You can define and use functions in shell scripts:

```bash
#!/bin/bash

greet() {
    echo "Hello, $1!"
}

greet "Alice"
greet "Bob"
```

## Practical Example: Data Processing Script

Let's create a script that processes our `data.csv` file:

```bash
#!/bin/bash

# data_processor.sh

# Check if file exists
if [ ! -f "data.csv" ]; then
    echo "Error: data.csv not found!"
    exit 1
fi

# Count total entries
total_entries=$(wc -l < data.csv)
echo "Total entries: $((total_entries - 1))"  # Subtract 1 for header

# Calculate total revenue
total_revenue=$(cut -d',' -f6 data.csv | tail -n +2 | paste -sd+ | bc)
echo "Total revenue: $total_revenue"

# Find most expensive product
most_expensive=$(sort -t',' -k5 -nr data.csv | head -n 2 | tail -n 1 | cut -d',' -f2,5)
echo "Most expensive product: $most_expensive"

# Count sales by category
echo "Sales by category:"
cut -d',' -f3 data.csv | tail -n +2 | sort | uniq -c
```

To use this script:
1. Save it as `data_processor.sh`
2. Make it executable: `chmod +x data_processor.sh`
3. Run it: `./data_processor.sh`

## Scheduling Tasks with cron

Cron is a time-based job scheduler in Unix-like operating systems. It allows users to schedule jobs (commands or shell scripts) to run periodically at fixed times, dates, or intervals. This is particularly useful for automating system maintenance or administration tasks, but it's also valuable for data scientists who need to run regular data updates, backups, or periodic analyses.

### Cron Syntax

A cron job is specified using a crontab (cron table) file. Each line in a crontab represents a job and follows this format:

```
* * * * * command_to_execute
```

The five asterisks represent:

1. Minute (0 - 59)
2. Hour (0 - 23)
3. Day of the month (1 - 31)
4. Month (1 - 12)
5. Day of the week (0 - 7, where both 0 and 7 represent Sunday)

### Common cron Schedule Examples

- Every day at 2:30 AM:
  ```
  30 2 * * * /path/to/script.sh
  ```

- Every 15 minutes:
  ```
  */15 * * * * /path/to/script.sh
  ```

- Every Monday at 9 AM:
  ```
  0 9 * * 1 /path/to/script.sh
  ```

- Twice a day (at 9 AM and 9 PM):
  ```
  0 9,21 * * * /path/to/script.sh
  ```

- Every hour during working hours (9 AM - 5 PM) on weekdays:
  ```
  0 9-17 * * 1-5 /path/to/script.sh
  ```

### Managing crontabs

1. Edit your crontab:
   ```bash
   crontab -e
   ```

2. List your current cron jobs:
   ```bash
   crontab -l
   ```

3. Remove all your cron jobs:
   ```bash
   crontab -r
   ```

### Best Practices for cron Jobs

1. **Use absolute paths**: In cron jobs, always use absolute paths for both the command and any files it accesses.

2. **Redirect output**: To keep track of your job's execution, redirect its output to a log file:
   ```
   0 2 * * * /path/to/script.sh >> /path/to/logfile.log 2>&1
   ```

3. **Set a correct PATH**: If your script relies on commands in specific locations, set the PATH at the beginning of your crontab:
   ```
   PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   ```

4. **Use a shebang**: Always include a shebang in your scripts to specify the interpreter.

5. **Test your jobs**: Before setting up a cron job, test your command or script manually to ensure it works as expected.

6. **Use comments**: Add comments in your crontab to describe what each job does:
   ```
   # Daily backup at 2 AM
   0 2 * * * /path/to/backup_script.sh
   ```

### Example: Data Science Workflow with cron

Let's say you have a data pipeline that needs to run daily. Here's how you might set it up:

1. Create a shell script `daily_data_pipeline.sh`:

```bash
#!/bin/bash

# Set up environment (if using virtual environments)
source /path/to/your/venv/bin/activate

# Run data collection script
python /path/to/collect_data.py

# Run data processing script
python /path/to/process_data.py

# Run analysis and generate report
python /path/to/analyze_and_report.py

# Send email with report
python /path/to/send_email_report.py

# Log completion
echo "Data pipeline completed successfully on $(date)" >> /path/to/pipeline_log.txt
```

2. Make the script executable:
```bash
chmod +x /path/to/daily_data_pipeline.sh
```

3. Add a cron job to run this script daily at 1 AM:
```bash
crontab -e
```

Add this line to your crontab:
```
0 1 * * * /path/to/daily_data_pipeline.sh >> /path/to/pipeline_output.log 2>&1
```

This setup will run your data pipeline every day at 1 AM, logging both the script's output and any errors to `pipeline_output.log`, and logging successful completions to `pipeline_log.txt`.

### Debugging cron Jobs

If your cron job isn't running as expected:

1. Check system logs: 
   ```bash
   grep CRON /var/log/syslog
   ```

2. Ensure the script is executable and has the correct permissions.

3. Try running the command manually to see if there are any errors.

4. Use full paths for all commands and files in your script.

5. Redirect output to a log file to capture any error messages.

Remember, cron runs jobs with a limited environment, so environment variables and paths that work in your interactive shell might not be available in cron. Always use full paths and set necessary environment variables within your script or at the top of your crontab.

## Best Practices for Shell Scripts

1. Always start with a shebang (`#!/bin/bash`).
2. Use descriptive variable names.
3. Comment your code for clarity.
4. Use exit codes to indicate success or failure (0 for success, non-zero for errors).
5. Use double quotes around variables to prevent word splitting.
6. Use functions for repeated code blocks.
7. Test your scripts thoroughly, especially when dealing with important data.

## Exercise: Create a Data Backup Script

Create a script that:
1. Checks if a backup directory exists, creates it if it doesn't.
2. Copies `data.csv` to the backup directory with a timestamp in the filename.
3. Compresses the backup file.
4. Prints a success message with the backup file location.

Here's a starter template:

```bash
#!/bin/bash

BACKUP_DIR="./backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Your code here

echo "Backup completed successfully!"
```

This exercise will help you practice file operations, command substitution, and conditional statements in shell scripting.

Remember, while shell scripts are powerful, for more complex data processing tasks, you might want to use Python or R. However, shell scripts are excellent for automating system tasks, simple data transformations, and creating workflows that combine multiple tools and languages.