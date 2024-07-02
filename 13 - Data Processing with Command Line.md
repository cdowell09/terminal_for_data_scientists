# Lesson 13: Data Processing with Command Line Tools

As a data scientist, being proficient with command-line tools for data processing can significantly speed up your workflow, especially when dealing with large datasets or when you need to quickly explore and manipulate data.

## Core Command-Line Tools for Data Processing

### 1. head and tail

These commands are useful for quickly peeking at the beginning or end of a file.

```bash
# View the first 10 lines of a file
head data.csv

# View the last 20 lines of a file
tail -n 20 data.csv

# View the first 5 lines, excluding the header
head -n 6 data.csv | tail -n 5
```

### 2. cut

`cut` is great for extracting specific columns from structured data.

```bash
# Extract the 2nd and 4th columns from a CSV file
cut -d',' -f2,4 data.csv

# Extract all columns from the 3rd onwards
cut -d',' -f3- data.csv
```

### 3. sort

`sort` is used to order data based on specific criteria.

```bash
# Sort a CSV file based on the 2nd column, numerically
sort -t',' -k2 -n data.csv

# Sort a file, removing duplicates
sort -u data.txt
```

### 4. uniq

`uniq` is often used in conjunction with `sort` to find unique values or count occurrences.

```bash
# Count occurrences of each unique line
sort data.txt | uniq -c

# Find unique values in the 2nd column of a CSV
cut -d',' -f2 data.csv | sort | uniq
```

### 5. grep

`grep` is powerful for searching and filtering text data.

```bash
# Find all lines containing "error" in a log file
grep "error" app.log

# Count the number of lines containing "success"
grep -c "success" app.log

# Find lines that don't match a pattern
grep -v "warning" app.log
```

### 6. sed

`sed` is a stream editor useful for text transformations.

```bash
# Replace all occurrences of 'old' with 'new'
sed 's/old/new/g' file.txt

# Delete lines containing a specific pattern
sed '/pattern/d' file.txt

# Add a header to a CSV file
sed '1iName,Age,City' data.csv
```

### 7. awk

`awk` is a powerful tool for processing structured data.

```bash
# Sum the values in the 3rd column of a CSV
awk -F',' '{sum += $3} END {print sum}' data.csv

# Print lines where the 2nd field is greater than 100
awk -F',' '$2 > 100' data.csv

# Calculate average of the 4th column
awk -F',' '{sum += $4; count++} END {print sum/count}' data.csv
```

## Combining Tools for Data Processing Pipelines

The real power of these tools comes from combining them using pipes (`|`).

### Example 1: Analyzing Log Data

Let's say you have a large log file and you want to find the top 5 most frequent error messages:

```bash
grep "ERROR" app.log | cut -d' ' -f5- | sort | uniq -c | sort -nr | head -n 5
```

This pipeline:
1. Filters for lines containing "ERROR"
2. Extracts the error message (assuming it starts from the 5th field)
3. Sorts the messages
4. Counts unique occurrences
5. Sorts numerically in reverse order
6. Shows the top 5 results

### Example 2: Processing CSV Data

Suppose you have a large CSV file of sales data and you want to find the top 3 selling products:

```bash
cut -d',' -f2,4 sales.csv | tail -n +2 | sort -t',' -k2 -nr | head -n 3
```

This pipeline:
1. Extracts the product name (2nd column) and sales amount (4th column)
2. Removes the header row
3. Sorts numerically by the sales amount in reverse order
4. Shows the top 3 results

## Practice Exercise: Analyzing Dataset Statistics

Create a file named `data.csv` with the following content:

```
Name,Age,Salary
Alice,28,75000
Bob,35,82000
Charlie,42,95000
David,31,68000
Eva,39,88000
```

Now, let's process this data:

1. Calculate the average salary:
   ```bash
   cut -d',' -f3 data.csv | tail -n +2 | awk '{sum += $1} END {print "Average Salary:", sum/NR}'
   ```

2. Find the name of the highest-paid employee:
   ```bash
   sort -t',' -k3 -nr data.csv | head -n 2 | tail -n 1 | cut -d',' -f1
   ```

3. Count employees older than 35:
   ```bash
   awk -F',' '$2 > 35 {count++} END {print "Employees over 35:", count}' data.csv
   ```

## Tips for Data Scientists

1. These tools are great for quick data exploration and preprocessing, especially for large datasets that might be slow to load into memory.
2. For complex operations, consider using these tools to preprocess data before loading it into Python or R.
3. When working with very large files, these tools can be more efficient than loading entire datasets into memory.
4. Always make backups before performing operations that modify your data files.
5. For reproducibility, consider saving your command pipelines in shell scripts.

Remember, while these command-line tools are powerful, they have limitations. For more complex data manipulations or statistical analyses, you'll likely want to use Python, R, or specialized data processing tools.