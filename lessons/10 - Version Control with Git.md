# Lesson 10: Version Control with Git

Git is a distributed version control system that's essential for tracking changes in your code, collaborating with others, and managing projects. As a data scientist, Git will help you maintain different versions of your analysis, collaborate on code, and keep your work organized.

## Installing Git

If Git isn't already installed on your MacBook, you can install it using Homebrew:

```bash
brew install git
```

## Configuring Git

Set up your identity:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Basic Git Commands

1. Initialize a new Git repository:
   ```bash
   git init
   ```

2. Check the status of your repository:
   ```bash
   git status
   ```

3. Add files to the staging area:
   ```bash
   git add filename
   ```
   Or to add all changes:
   ```bash
   git add .
   ```

4. Commit your changes:
   ```bash
   git commit -m "Your commit message"
   ```

5. View commit history:
   ```bash
   git log
   ```

6. Create a new branch:
   ```bash
   git branch branch_name
   ```

7. Switch to a branch:
   ```bash
   git checkout branch_name
   ```

8. Merge branches:
   ```bash
   git merge branch_name
   ```

9. Pull changes from a remote repository:
   ```bash
   git pull origin main
   ```

10. Push changes to a remote repository:
    ```bash
    git push origin main
    ```

## Working with Remote Repositories

1. Clone a repository:
   ```bash
   git clone https://github.com/username/repository.git
   ```

2. Add a remote repository:
   ```bash
   git remote add origin https://github.com/username/repository.git
   ```

3. View remote repositories:
   ```bash
   git remote -v
   ```

## Practice Exercise: Setting Up a Data Science Project with Git

1. Create a new directory for your project:
   ```bash
   mkdir my_data_project
   cd my_data_project
   ```

2. Initialize a Git repository:
   ```bash
   git init
   ```

3. Create a README file:
   ```bash
   echo "# My Data Science Project" > README.md
   ```

4. Add and commit the README:
   ```bash
   git add README.md
   git commit -m "Initial commit: Add README"
   ```

5. Create a new branch for data exploration:
   ```bash
   git branch data_exploration
   git checkout data_exploration
   ```

6. Create a Python script for data exploration:
   ```bash
   echo "import pandas as pd" > explore_data.py
   git add explore_data.py
   git commit -m "Add initial data exploration script"
   ```

7. Switch back to the main branch and merge changes:
   ```bash
   git checkout main
   git merge data_exploration
   ```

## Tips for Data Scientists

- Use meaningful commit messages to document changes in your analysis or models.
- Create branches for different experiments or features in your projects.
- Use `.gitignore` to exclude large data files, sensitive information, and temporary files.
- Consider using Git LFS (Large File Storage) for managing large datasets.
- Familiarize yourself with GitHub or GitLab for collaborative projects and sharing your work.

Remember, Git has a learning curve, but it's an invaluable tool for managing your data science projects and collaborating with others.