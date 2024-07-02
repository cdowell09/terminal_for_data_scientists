# Lesson 15: Advanced Topics

In this final lesson, we'll explore some advanced topics and tools that can significantly boost your productivity and capabilities in the terminal. These topics are particularly relevant for data scientists working with remote servers, large datasets, or complex workflows.

## 1. SSH (Secure Shell) for Remote Connections

SSH allows you to securely connect to remote servers, which is crucial for working with cloud-based data processing systems.

Basic usage:
```bash
ssh username@remote_host
```

Key-based authentication (more secure):
1. Generate a key pair:
   ```bash
   ssh-keygen -t rsa -b 4096
   ```
2. Copy your public key to the server:
   ```bash
   ssh-copy-id username@remote_host
   ```

SSH config file (`~/.ssh/config`) for easier connections:
```
Host myserver
    HostName 123.45.67.89
    User myusername
    IdentityFile ~/.ssh/id_rsa
```
Now you can simply use: `ssh myserver`

## 2. tmux for Terminal Multiplexing

tmux allows you to run multiple terminal sessions within a single window, which is great for managing long-running processes.

Basic usage:
- Start a new session: `tmux`
- Create a new window: `Ctrl-b c`
- Switch between windows: `Ctrl-b n` (next) or `Ctrl-b p` (previous)
- Split pane horizontally: `Ctrl-b "`
- Split pane vertically: `Ctrl-b %`
- Detach from session: `Ctrl-b d`
- Reattach to session: `tmux attach`

## 3. rsync for Efficient File Transfer

rsync is a powerful tool for efficiently transferring and synchronizing files.

Basic usage:
```bash
rsync -avz source_dir/ username@remote_host:destination_dir/
```

This command will synchronize the contents of `source_dir` to `destination_dir` on the remote host, only transferring the differences.

## 4. screen for Background Processes

screen is useful for running processes that need to continue even if your connection drops.

Basic usage:
- Start a new screen session: `screen`
- Detach from the session: `Ctrl-a d`
- Reattach to a session: `screen -r`
- List sessions: `screen -ls`

## 5. jq for JSON Processing

jq is a lightweight command-line JSON processor, which is very useful for working with API responses or JSON-formatted data.

Basic usage:
```bash
echo '{"name": "John", "age": 30}' | jq '.name'
```

This will output: "John"

## 6. awk for Advanced Text Processing

While we've touched on awk before, it's worth exploring some more advanced uses:

Calculating average from a CSV:
```bash
awk -F',' '{sum+=$3; count++} END {print "Average:", sum/count}' data.csv
```

## 7. Customizing Your Shell

Customize your shell for increased productivity:

1. Use a powerful shell like zsh with Oh My Zsh:
   ```bash
   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

2. Customize your prompt in `~/.zshrc` or `~/.bashrc`:
   ```bash
   export PS1="\u@\h \W \$ "
   ```

3. Create aliases for common commands in `~/.zshrc` or `~/.bashrc`:
   ```bash
   alias update='sudo apt update && sudo apt upgrade -y'
   ```

## 8. Using Environment Variables

Environment variables can be used to store configuration information:

Set a variable:
```bash
export API_KEY="your_api_key_here"
```

Use it in a script:
```bash
#!/bin/bash
curl -H "Authorization: Bearer $API_KEY" https://api.example.com/data
```

## 9. Process Monitoring with htop

htop is an interactive process viewer, an advanced alternative to top:

```bash
brew install htop
htop  # Run htop
```

## 10. Version Control Beyond Basics

Advanced Git techniques:
- Interactive rebase: `git rebase -i HEAD~3`
- Cherry-picking: `git cherry-pick commit_hash`
- Git hooks for automating tasks

## Practice Exercise: Remote Data Processing Workflow

Let's put some of these advanced concepts together:

1. Set up an SSH config for a remote server.
2. Use rsync to synchronize a local dataset with the remote server.
3. SSH into the server and start a tmux session.
4. In one tmux window, run a long data processing Python script.
5. In another tmux window, use watch and jq to monitor the output of an API that your script is updating.
6. Set up a cron job on the remote server to run this workflow daily.
7. Use rsync to retrieve the processed results back to your local machine.

This exercise simulates a real-world data science workflow involving remote processing, monitoring, and automation.

Remember, mastering these advanced tools and techniques can significantly enhance your efficiency and capabilities as a data scientist, especially when working with large-scale data processing and analysis tasks.