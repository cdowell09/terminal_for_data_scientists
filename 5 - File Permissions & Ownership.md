Understanding file permissions and ownership is crucial for managing access to your files and directories, especially when working in shared environments or with sensitive data.

## Viewing Permissions

To view file permissions, use the `ls -l` command. You'll see something like this:

```
-rw-r--r--  1 username  group  4096 Jun 1 12:00 filename.txt
```

The first ten characters represent the file permissions:
- First character: File type (- for regular file, d for directory)
- Next three characters: Owner permissions
- Next three characters: Group permissions
- Last three characters: Others permissions

Each set of three characters represents read (r), write (w), and execute (x) permissions.

## CHMOD (Change Mode)

The `chmod` command changes the permissions of a file or directory.

### Symbolic Method

Using symbols:
```bash
chmod u+x filename  # Add execute permission for the user
chmod g-w filename  # Remove write permission for the group
chmod o=r filename  # Set read-only permission for others
```

- `u`: user (owner)
- `g`: group
- `o`: others
- `a`: all

- `+`: add permission
- `-`: remove permission
- `=`: set permission

### Numeric Method

Using numbers:
```bash
chmod 755 filename
```

Each digit represents permissions for user, group, and others:
- 4: read
- 2: write
- 1: execute

So, 755 means:
- User: read (4) + write (2) + execute (1) = 7
- Group: read (4) + execute (1) = 5
- Others: read (4) + execute (1) = 5

## CHOWN (Change Owner)

The `chown` command changes the owner of a file or directory.

Basic usage:
```bash
chown newowner filename
```

To change both owner and group:
```bash
chown newowner:newgroup filename
```

Note: Changing ownership typically requires superuser (root) privileges.

## Practice Exercises

1. Create a new file called "test_permissions.txt".
2. View its current permissions using `ls -l`.
3. Add execute permission for the user: `chmod u+x test_permissions.txt`.
4. Remove write permission for others: `chmod o-w test_permissions.txt`.
5. Set the permissions to 644 (rw-r--r--) using the numeric method.
6. Try to change the owner of the file (this may fail without superuser privileges).

## Tips for Data Scientists

- When working with sensitive data, ensure that file permissions are set appropriately to protect confidentiality.
- Scripts that you want to execute directly should have the execute (x) permission.
- In collaborative environments, use group permissions to manage shared access to files and directories.
- Be cautious when changing permissions, especially when using recursive options on directories.

Remember, understanding and managing file permissions is crucial for data security and proper system administration.