In this lesson, we'll cover the fundamental commands for navigating your file system using the terminal. These commands are essential for any work you'll do in the command line.

## PWD (Print Working Directory)

The `pwd` command shows you the current directory you're in. This is particularly useful when you're not sure where you are in the file system.

Try it:
```bash
pwd
```

You'll see something like:
```
/Users/yourusername
```

## LS (List)

The `ls` command lists the contents of the current directory.

Basic usage:
```bash
ls
```

Useful options:
- `ls -l`: List in long format, showing permissions, owner, size, and modification date
- `ls -a`: Show all files, including hidden ones (those starting with a dot)
- `ls -lh`: List in long format with human-readable file sizes

Try these variations and observe the differences.

## CD (Change Directory)

The `cd` command is used to change your current directory.

Basic usage:
```bash
cd directory_name
```

Special directories:
- `cd ~`: Go to your home directory
- `cd ..`: Go up one directory
- `cd -`: Go to the previous directory you were in

Try navigating to different directories:
```bash
cd Documents
pwd
cd ..
pwd
```

## Absolute vs. Relative Paths

When using `cd`, you can use absolute or relative paths:

- Absolute path: Starts from the root directory (/)
  Example: `cd /Users/yourusername/Documents`

- Relative path: Starts from your current directory
  Example: If you're in your home directory, `cd Documents` is the same as `cd /Users/yourusername/Documents`

## Practice Exercises

1. Find out your current directory using `pwd`.
2. List the contents of your current directory with `ls`.
3. Navigate to your Documents folder using `cd`.
4. List the contents of the Documents folder.
5. Go back to your home directory.
6. Try using `ls` with different options (`-l`, `-a`, `-lh`).

## Tips

- Use the Tab key for auto-completion of directory and file names.
- Use the up and down arrow keys to scroll through your command history.

Remember, practice is key to becoming comfortable with these commands. Don't hesitate to experiment!