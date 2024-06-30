In this lesson, we'll cover commands that allow you to view and edit file contents directly from the terminal. These skills are crucial for quickly inspecting data files, making small edits to scripts, and understanding file contents without opening a separate application.

## CAT (Concatenate and print file contents)

The `cat` command is used to display the contents of a file directly in the terminal.

Basic usage:
```bash
cat filename.txt
```

You can also use it to display multiple files:
```bash
cat file1.txt file2.txt
```

## LESS (View file contents page by page)

The `less` command is more versatile than `cat` for viewing large files, as it allows you to scroll through the file.

Basic usage:
```bash
less filename.txt
```

Navigation in `less`:
- Use arrow keys to scroll up and down
- Press 'q' to quit
- Press '/' to search for a pattern
- Press 'n' to go to the next search result

## HEAD and TAIL

These commands are useful for viewing the beginning or end of a file.

To view the first 10 lines of a file:
```bash
head filename.txt
```

To view the last 10 lines of a file:
```bash
tail filename.txt
```

You can specify the number of lines:
```bash
head -n 20 filename.txt  # View first 20 lines
tail -n 5 filename.txt   # View last 5 lines
```

## NANO (Simple text editor)

Nano is a user-friendly text editor that runs directly in the terminal.

To open a file in nano (or create a new file if it doesn't exist):
```bash
nano filename.txt
```

Basic nano commands:
- Ctrl + O: Save the file
- Ctrl + X: Exit nano
- Ctrl + K: Cut the current line
- Ctrl + U: Paste the cut text

## Practice Exercises

1. Create a new file called "sample.txt" using `nano` and add a few lines of text to it.
2. Use `cat` to display the contents of "sample.txt".
3. Use `less` to view "sample.txt" and practice scrolling and searching.
4. Use `head` to view the first 5 lines of "sample.txt".
5. Use `tail` to view the last 3 lines of "sample.txt".
6. Open "sample.txt" in `nano` again, make some changes, and save them.
7. Use `cat` to verify your changes.

## Tips

- For very large files, `less` is more efficient than `cat` as it loads the file gradually.
- `head` and `tail` are particularly useful for quickly inspecting large data files.
- While `nano` is user-friendly, many experienced users prefer more powerful editors like `vim` or `emacs`. However, these have steeper learning curves.
- For data scientists, these commands are invaluable for quick data inspection and small edits to scripts or configuration files.

Remember, practice is key to becoming comfortable with these commands. Don't hesitate to experiment!