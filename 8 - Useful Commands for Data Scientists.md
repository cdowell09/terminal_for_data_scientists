As a data scientist, you'll often need to manipulate, search, and analyze text files directly in the terminal. This lesson covers some powerful commands that can help you work more efficiently with data files.

Remember, while these commands are powerful, for more complex data manipulation tasks, you might want to use programming languages like Python or R. However, for quick checks and very simple transformations, these terminal commands can be incredibly efficient.
## GREP (Global Regular Expression Print)

`grep` searches for patterns in files and prints matching lines.

Basic usage:
```bash
grep "pattern" filename
```

Useful options:
- `-i`: Case-insensitive search
- `-r`: Recursive search in directories
- `-n`: Show line numbers
- `-v`: Invert match (show non-matching lines)

Example:
```bash
grep -in "error" log_file.txt
```

## SED (Stream Editor)

`sed` is used for parsing and transforming text.

Basic substitution:
```bash
sed 's/old_text/new_text/' filename
```

To edit the file in-place, use `-i`:
```bash
sed -i 's/old_text/new_text/' filename
```

Example (replace commas with tabs):
```bash
sed 's/,/\t/g' csv_file.csv > tsv_file.tsv
```

## AWK (Aho, Weinberger, and Kernighan)

`awk` is a powerful tool for processing and analyzing text files.

Basic usage:
```bash
awk '{action}' filename
```

Example (print specific columns):
```bash
awk '{print $1, $3}' data_file.txt
```

Example (sum values in a column):
```bash
awk '{sum += $3} END {print sum}' data_file.txt
```

## CUT

`cut` extracts sections from each line of input.

Example (extract specific columns from CSV):
```bash
cut -d',' -f1,3 data_file.csv
```

## SORT and UNIQ

`sort` sorts lines in text files. `uniq` removes duplicate lines (usually used after `sort`).

Example (sort data and count unique values):
```bash
sort data_file.txt | uniq -c
```

## WC (Word Count)

`wc` counts lines, words, and characters in a file.

Example:
```bash
wc -l data_file.txt  # Count lines
```

## Practice Exercises

1. Create a sample CSV file:
   ```bash
   echo -e "Name,Age,City\nAlice,28,New York\nBob,35,San Francisco\nCharlie,42,Chicago" > people.csv
   ```

2. Use `grep` to find lines containing "San Francisco":
   ```bash
   grep "San Francisco" people.csv
   ```

3. Use `sed` to replace "New York" with "NYC":
   ```bash
   sed 's/New York/NYC/' people.csv
   ```

4. Use `awk` to print names and ages:
   ```bash
   awk -F',' '{print $1, $2}' people.csv
   ```

5. Use `cut` to extract just the names:
   ```bash
   cut -d',' -f1 people.csv
   ```

6. Count the number of lines in the file:
   ```bash
   wc -l people.csv
   ```

## Tips for Data Scientists

- Use `grep` for quick searches in large log files or datasets.
- Combine `sed` and `awk` for complex data transformations and cleaning tasks.
- Use `sort` and `uniq` for quick frequency analysis of categorical data.
- Chain these commands together using pipes to create powerful data processing pipelines.
- For very large files, consider using these commands instead of loading entire datasets into memory.