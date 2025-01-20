<details><summary style="font-size:25px;color:Orange;text-align:left">Git Terminology</summary>

🔥 GIT TUTORIALS:

-   [Git MERGE vs REBASE: Everything You Need to Know](https://www.youtube.com/watch?v=0chZFIZLR_0)
-   [Learn Git with Bitbucket Cloud](https://www.atlassian.com/git/tutorials/learn-git-with-bitbucket-cloud)
-   [Udacity: How to Use Git and GitHub](https://www.youtube.com/playlist?list=PLAwxTw4SYaPk8_-6IGxJtD3i2QAu5_s_p)
-   https://git-scm.com/docs

🔥 KEY WORDS:

-   Checkout
    -   Checkout: Switching between different commit, branches or tags.
    -   Checkout a Branch means changing Head Pointer from current branch to the branch to be checkedout.
-   Initial Commit
-   Untracked File
-   HEAD:
    -   `HEAD`: Git’s way of referring to the current snapshot. Internally, the ‘git checkout’ command simply updates the HEAD to point to either the specified branch or commit. When it points to a branch, Git doesn’t complain, but when you check out a commit, it switches into a “detached HEAD” state.
    -   Head Pointer always points to the Active Branch. When it points to a branch, Git doesn’t complain, but when you check out a commit, it switches into a “detached HEAD” state.
    -   Detached Head
-   TAG:

    -   Tag is an extra lebel for a commit in the commit chain that can indicate usefull informations. A tag is not updated by the commit command.
    -   Annoted Tag
    -   Lightwaight Tag

-   `Remote`:

    -   In Git, a `remote` typically refers to a repository that is hosted on a separate server or location from your local repository. `Remote`s allow you to connect and interact with repositories that may be located on the internet or on another machine.
    -   `Remote`s can be repositories you contribute to, collaborate with, or simply synchronize your local repository with to stay up-to-date. Examples of popular `remote` hosting services include GitHub, GitLab, and Bitbucket.

    -   When you add a `remote` repository to your local Git configuration, you give it a name. Common names include "origin," "upstream," "fork," or any other descriptive name you choose.

-   `Origin`:

    -   `Origin` is a specific name that is commonly used as the default `remote` repository name when you clone a repository or when you push to a repository. It's a convention, not a Git keyword.
    -   When you clone a repository from a `remote` location, Git sets up a `remote` called `origin` by default to point to the repository you cloned from. So, when you push changes, it knows where to send them.

-   `Master`

    -   The default branch name in Git is master. For both `remote` and local repository.

-   `Repository (Repo)`:

    -   A Git repository is a collection of files and directories along with the version history of those files.
    -   There are two types of repositories: local (on your computer) and `remote` (typically hosted on a server).

-   `Working Directory`:

    -   The working directory is the directory on your local machine where you edit, create, delete, and organize files.
    -   It contains the current state of your project.

-   `Staging Area (Index)`:

    -   The staging area, also known as the index or cache, is an intermediate area where you prepare changes for the next commit.
    -   Files are added to the staging area using the git add command before they are committed to the repository.

-   `Commit`:

    -   A commit is a snapshot of the project's state at a particular point in time.
    -   Each commit has a unique identifier (a hash) and includes changes made to files since the last commit.
    -   Commits create a chronological history of your project.

-   `Branch`:

    -   A branch is a separate line of development within a Git repository.
    -   Branches allow multiple users to work on different features or fixes simultaneously without affecting each other's work.
    -   The default branch is usually called master or main.

-   `HEAD`:

    -   HEAD is a reference to the latest commit in the currently checked-out branch.
    -   It represents the snapshot of your project that is currently being worked on.

-   `Remote Repository`:

    -   A `remote` repository is a copy of your project hosted on a server or another machine.
    -   It allows multiple developers to collaborate on the same project.
    -   Common `remote` repository hosting services include GitHub, GitLab, and Bitbucket.

-   `Clone`:

    -   Cloning is the process of creating a copy of a `remote` repository on your local machine.
    -   It sets up a connection between your local repository and the `remote` repository, enabling you to fetch and push changes.

-   `Pull`:

    -   Pulling refers to fetching changes from a `remote` repository and integrating them into your local branch.
    -   It combines the git fetch and git merge commands into a single operation.

-   `Push`:

    -   Pushing is the process of uploading your local commits to a `remote` repository.
    -   It makes your changes available to others and updates the `remote` repository's history.

-   `Merge`:

    -   Merging is the process of combining changes from one branch into another.
    -   It is often used to integrate features or bug fixes from one branch into the main branch.

-   `Conflict`:

    -   A conflict occurs when Git cannot automatically merge changes because there are conflicting changes in the same part of a file.
    -   Conflicts must be manually resolved by the user before proceeding with the merge or commit.

-   `Pull Request (PR)`:

    -   A pull request is a feature commonly found on platforms like GitHub and GitLab.
    -   It allows developers to propose changes to a project and request that those changes be reviewed and merged into the main branch.

-   `Fork`:

    -   Forking is the process of creating a personal copy of a repository in which you can make changes without affecting the original repository.
    -   It's commonly used for contributing to open-source projects.

-   `Tag`:

    -   A tag is a reference to a specific commit.
    -   It is often used to mark significant milestones or releases in a project's history.

🔥 NOTES:

-   There generally are at least three copies of a project on your workstation:

    -   One copy is your own repository with your own commit history (the already saved one, so to say).
    -   The second copy is your working copy where you are editing and building (not committed yet to your repo).
    -   The third copy is your local “cached” copy of a `remote` repository (probably the original from where you cloned yours).

-   You cannot delete the branch you are on.
-   If you checkout a branch and then commits, the branch’s label autometically updates to the new commits.
-   ![Git Push/Pull Cycle](/assets/git/git_cycle.png)
-   ![Git Workflow](/assets/git/git_workflow.gif)

</details>

---

<details open><summary style="font-size:25px;color:Orange;text-align:left">Git Commands</summary>

🔥 HELP:

-   `$ git --help`
-   `$ git help -a`
-   `$ git help -g`
-   `$ git help <command> -->> Ex: git help add, git help reset, git help rm`
-   `$ git help <concept>`
-   `$ git help git`
-   `$ git [options] commands [<args>]`

## Initialize/Clone Git Repository

-   There are two methods to start a git projects:

    1. Cloning an Existing Repository from www.github.com using git command, (`$ git clone`)
    2. Initializing a Git Repository skeleton in the local machin using git command, (`$ git init`) then push it into a remote location such as `www.github.com` after establishing a link to the remote repository ,

-   `$ git clone https://github.com/repoName` → It creates a repository named “repoName”, initializes a .git directory inside it, pulls down all the data from that repository, and checks out a working copy of the latest version.
-   `$ git init` → It creates a new subdirectory named .git that contains all of your necessary repository files – a Git repository skeleton.
-   `$ git init <folder_name>` → It creates a new directory named folder_name in current directory and initialize a git repository – a Git Repository Skeleton - in it.
-   `$ git remote add origin <URL>` → Add the repository, named ‘origin’, from the remote (GitHub) to the local machin through given ‘url’. Conventionaly the word ‘origin’ is used as the name of remote repository, but the link between the locally initialized git repository and the remote(GitHub) get established through the provided URL, not through the name of remote repository, ‘origin’
    `$ git remote add origin git@github.com:Aminul-Momin/TestingProj.git`
-   `$ git config --global user.name 'Aminul Momin'`
-   `$ git config --global user.email A.Momin.NYC@gmail.com`
-   `$ git config --global init.defaultBranch <master_branch>` → setup the initial branch name to create in all new repositories.
-   `$ 🔥 git remote set-url origin git@github.com:Aminul-Momin/<repository_name>.git` → Updates the URL of the existing origin remote to a new repository address.
-   `$ git remote set-url origin git@gh2:Aminul-Momin/project_name.git`
-   `$ git remote` → List out all the remote this git repo has been added to
-   `$ git remote -v` → Listout all the remote’s URL this git repo has been added to

## CONFIGURATIONS

-   `$ Which git` → Print the full path to the git command
-   `.git/config` → Git's local configuration file.
-   `/usr/local/git/etc/gitconfig` → Git's Default configuration
-   `~/.gitconfig` → Git's user configuration file
-   `$ git config --local| --global --list` → List out the local or global configuration
-   `$ git config --local| --global| --system --edit` → Edit local or global or system config file
-   🔥 <bold style="color:orange">NOTES</bold>: When reading, the values are read from the system, global and repository local configuration files by default, and options `--system`, `--global`, `--local`, `--worktree` and `--file <filename>` can be used to tell the command to read from only that location (see FILES).
-   `$ git config --get user.name` → Returns name of the current git user.
-   `$ git config --get user.email` → Returns the email address of current git user.
-   `$ git config --global core.editor code –wait [“subl –n -w”, emacs, “atom-wait”]`
    -   → Set globaly VisualStudioCode (`code`) as your code editor.
-   `$ git config --global color.ui auto`
-   `$ git config --local user.name 'Aminul Momin'` → Set localy user name configuration parameter. (`--local` can only be used inside a git repository)
-   `$ git config --local user.email "A.Momin.NYC@gmail.com"`
-   [Git and Vimdiff](https://medium.com/usevim/git-and-vimdiff-a762d72ced86)
    <!-- To tell Git to always use Vimdiff, issue the following commands: -->

-   `$ git config --global diff.tool vimdiff`
-   `$ git config --global merge.tool vimdiff`
-   `$ git config --local [user.email | author.name | author.email | committer.name | committer.email]`
-   `$ git config user.name [author.name | author.email | committer.name | committer.email]`
    -   Returns a specific key’s value ( here, key = user.name).

<details open><summary style="font-size:20px;color:red;text-align:left">Troubleshoot Github Authenticatios</summary>

-   `$ eval $(ssh-agent)` → Make sure 'ssh-agent' is running
-   `$ 🔥 alias runsshagent='eval $(ssh-agent)'` → mske sure ssh-agent is running.
-   `$ ssh-add -l` → list out all the keys added to the ssh agent.
-   `$ ssh-add -d ~/.ssh/github_bbcredcap3` → Delete a key from SSH Agent
-   `$ ssh-add ~/.ssh/github_bbcredcap3` → Add a key to SSH Agent

-   `$ git remote show origin` → get the remote origin URL
-   `$ git config --get remote.origin.url` → get the remote origin URL
-   `$ ssh -T git@github.com` → Test your Authentication/Connection into remote.
-   `$ ssh -T git@gh1` → Test your Authentication/Connection into remote.
-   `$ ssh -T git@gh2` → Test your Authentication/Connection into remote.
-   `$ ssh-add ~/.ssh/your_private_key` → Add your private key to ssh agent.
-   `$ git clone git@gh1:A-Momin/project_name.git` → Clone from perticular github account
-   `$ git remote set-url origin git@gh1:A-Momin/drf.git`
-   `$ git remote set-url origin git@gh2:Aminul-Momin/noteshub.git`
-   `$ git remote set-url origin git@github.com:Aminul-Momin/noteshub.git`

</details>

## RECORD & EXAMIN CHANGES

-   `$ git status` → Check the current status.
-   `$ git diff` → Difference between Working Directory and Staging Area
-   `$ git diff --cached` → Show the difference between the index and the last commit.
-   `$ git diff branch` → Show a diff between the current working directory and the named branch.
-   `$ git diff --staged` → Difference between Staging Area and Repository.
-   `$ git diff <commit_id1 commit_id2>` → Difference between two commits.
-   `$ git diff --stat` → Shows an overview of changes.
-   `$ git log --pretty=format:"[%h] %ae, %ar: %s" --stat` → Shows commit history with the files that were changed.
-   `$ git show <commit_id>` → Show the changes in commits compared to it’s parrents
-   `$ git log <command>`
-   `$ git log --help`
-   `$ git log --statq`
-   `$ git log --oneline`
-   `$ git log --oneline --decorate`
-   `$ git log --graph --oneline --decorate --all`
-   `$ git add .` → Add changes of all files in the current & subdirectory to the Staging Area.
-   `$ git commit` → Commit into the Repository.
-   `$ git commit -m “Commit_Message”` → Commint into the Repository with Commit Message.

##### [git stash](https://www.youtube.com/watch?v=fXGug4itlTk)

-   git stash temporarily shelves (or stashes) changes you've made to your working copy so you can work on something else, and then come back and re-apply them later on. Stashing is handy if you need to quickly switch context and work on something else, but you're mid-way through a code change and aren't quite ready to commit.

-   `$ git stash show` → show the content of your most recent stash.
-   `$ git stash list` → List out all your repository's stashes.
    -   `git stash show stash@{index}`
-   `$ git stash` → stash uncommited local changes
-   `$ git stash push -m stashname` → name and retrieve a Git stash by the name?
-   `$ git stash save "my_stash_name"` → name and retrieve a Git stash by the name? (deprecated since v2.16)
-   `$ git stash pop` → Popping your stash removes the changes from your stash and reapplies them to your working copy.
-   `$ git stash drop stash@{n}` → drop specific stash - see `git stash list` (`n` is a integer)
-   `$ git stash pop stash@{n}` → pop specific stash - see `git stash list` (`n` is a integer)
-

##### [Resetting, Reverting, and Checking Out](https://www.atlassian.com/git/tutorials/resetting-checking-out-and-reverting)

-   [Undoing Commits & Changes](https://www.atlassian.com/git/tutorials/undoing-changes)
-   🔥 [git checkout]()

    -   `$ git checkout <commit_id>`
    -   `$ git checkout master`
    -   `$ git checkout <file_name>` → Discard the specified file from Working Area.
    -   `$ git checkout .` → Discard all the changes to the Working Area.
    -   `$ git checkout <commit_id>`
    -   `$ git checkout -- <file> ...` → to discard changes in working directory

-   🔥 [git reset]()

    -   <span style="color:orange">How to discard committed files? Extra care should be given using the reset command?</span>

    -   `$ git reset` → Removes all files from the staging area, but keeps the changes in your working directory. It effectively "unstages" all changes.
    -   `$ git reset HEAD <file_name>` → Unstage the specified file from Staging Area.
    -   `$ git reset HEAD */.` → Unstage all the file from Staging Area
    -   `$ git reset HEAD~1` → Discard the LAST commit from Local Repository (Committing Area). Discarted file kept in Working Area
    -   `$ git reset HEAD~3` → Discard the LAST THREE commit from Local Repository (Committing Area). Discarted file kept in Working Area
    -   `$ git reset --soft HEAD~3` → Discard the first three commit from Local Repository (Committing Area). Discarted file kept in Staging Area
    -   **$ git reset --hard** → It is used to reset the current commit or branch and the staging area to it's initial state or to a given commit. It moves the HEAD and the current branch pointer to the specified commit if given any.
    -   `$ git reset --hard HEAD~2`
    -   <font color="orange">How do I unstage changes?</font>
    -   `$ git restore .`
        -   It can be used to undo the effects of `git add` and unstage changes you have previously added to the Staging Area.
        -   It can also be used to discard local changes in a file, thereby restoring its last committed state.
    -   `$ git restore path/to/file/to/revert` → Unstage the given file from Staging Area into Working Directory.
    -   `$ git clean -f` → Remove untracked files from the working tree.
    -   `$ git rm --cached <file_name>` → Unstage the specified file (`file_name`) from Staging Area.
    -   `$ git rm --cached *_initial.py` → Unstage all the files name ended with `_initial.py` from Staging Area.
    -   `$ git rm -r --cached */migrations/` → Unstage all (`migrations/*`) files recursively from Staging Area.
        -   NOTE: `--cached` option tells Git to only remove the folder from the Git repository's index (staging area) and not from the file system. The files in the folder will no longer be tracked by Git, but they will remain on your local disk.
    -   `$ git revert` → it's better to use `git revert` to create a new commit that undoes the changes made in the previous commit.
    -   <span style="color:orange">How to remove a commit from remote repository:</span>
        1. git reset <commit_id>
        2. git push origin master -f

## GIT BRANCHING & MEARGING FILES

-   🔥 [git branch](https://www.atlassian.com/git/tutorials/using-branches)

    -   `$ git branch -h`
    -   `$ git checkout -h`
    -   `$ git branch –a` → Show all the name of branches that has been created so far.
    -   `$ git checkout -b <new_branch_name>` → Create & checkout the specified new_branch_name.
    -   `$ git branch <new_branch_name>` → Creates a brnch with the specified branch_name.
    -   `$ git branch –d <branch_name>` → Deleting a branch won’t delete the commits. It only deletes the label.
    -   `$ git branch <branch_name> <commit_id>`
    -   `$ git checkout <branch_name>` → Checkout the specified branch_name.
    -   `$ git log –graph –onetime <branch_name1 branch_name2 … >` → Visulize the branches Structure

-   🔥 TAG:

    -   `$ git tag` → List out all tags created fo far.
    -   `$ git tag BASELINE` → Create the 'BASELINE' tag.
    -   `$ git tag -a <lebel_of_tag>` → Creates a Annoted Tag, extra informations.
    -   `$ git tag -d <name_of_tag_to_be_deleted>` → Deletes the specified tag.
    -   `$ git tag -a <lebel_of_tag> <commit_id>` → Tags a older commit.
    -   `$ git tag < -l | --list >` → List all tags created so far.
    -   `$ git push --tags` → Push all the tags into remote (github.com)

-   🔥 [MERGING](https://www.atlassian.com/git/tutorials/using-branches/git-merge):

    -   `$ git merge <origin_branch_name> < local_branch_name>` → Merge a local branch into a origin branch.
    -   `$ git merge <local_branch_name1> < local_branch_name2>` → Merges two branches in local repository.
    -   `$ git merge —abort` → Abort merge if it is not possible to merge for any reason.

-   🔥 PUSH/PULL/FETCH:
    -   `$ git remote set-url origin git@github.com:Aminul-Momin/Algorithms_and_Data_Structures.git` → to set remote origin url
    -   `$ git remote show origin` → get the remote origin URL
    -   `$ git remote add upstream <URL>`
    -   `$ git push origin master`
        -   `origin` is master branch of remote repository
        -   `master` is master branch of local repository
        -   Pushes the master branch of local repository to master branch of remote repository.
    -   `$ git push -u origin master` → Push the commits from my local master branch to the master branch on the remote repository named origin, and set up tracking information for the master branch on the remote repository.
    -   `$ git push origin` → push all the branches to origin
    -   `$ git fetch` is the command that tells your local git to retrieve the latest meta-data info from the original (yet doesn’t do any file transferring. It’s more like just checking to see if there are any changes available).
    -   `$ git pull` on the other hand does that AND brings (copy) those changes from the remote repository.
    -   `$ git pull origin master`
        -   `origin` is master branch of remote repository
        -   `master` is master branch of local repository
        -   pulls the master branch of remote repository into master branch of local repository.
        -   It's equivalent to `$ git fetch origin && git merge origin master`
    -   `$ git pull upstream Master`
    -   `$ git fetch`
    -   `$ git fetch origin`
    -   `$ git fetch origin/master master`

</details>

---

<details><summary style="font-size:25px;color:Orange;text-align:left">Github CLI Commands</summary>

[DOC](https://cli.github.com/manual/gh_api)

### Authentication and Configuration

-   `$ gh auth status`
-   `$ gh config get --list`
-   `$ gh auth login`
-   `$ gh ssh-key list`
-   `$ gh ssh-key add ~/.ssh/id_rsa.pub --title "Your SSH Key Title"`
-   `$ `
-   `$ `
-   `$ `

### Repository Management

-   `$ gh repo -h`
-   `$ gh repo list`
-   `$ gh repo clone owner/repo`
-   `$ gh repo create [repo_name]`
-   `$ gh repo view [owner/repo]`
-   `$ gh repo list --fork`
-   `$ gh repo list --source`

### Issue Management

-   `$ gh issue create`
-   `$ gh issue view [number]`
-   `$ gh issue list`
-   `$ gh issue list --state closed`
-   `$ gh issue list --assignee [username]`

### Pull Request Management

-   `$ gh pr create`
-   `$ gh pr view [number]`
-   `$ gh pr list`
-   `$ gh pr list --state closed`
-   `$ gh pr list --assignee [username]`

### Workflow and Actions

-   `$ gh workflow view`
-   `$ gh workflow run [workflow_name]`
-   `$ gh run view [run_number]`

### Collaborator and Team Management

-   `$ gh repo collaborator add [username]`
-   `$ gh repo collaborator remove [username]`
-   `$ gh team list`
-   `$ gh team list-members [team_slug]`

### Git Operations

-   `$ gh repo create branch-name`
-   `$ gh repo view --json default_branch`
-   `$ gh pr create --draft`
-   `$ gh pr view --draft`

### MISC

-   `$ gh repo delete <repository>`
-   `$ `
-   `$ `

### Usefull Bash function on 'gh'

```sh

git_info(){
    echo "List of remote URLs:"
    git remote -v
    git config --get user.name
    git config --get user.email
    git log --graph --oneline --decorate --all
    echo "List of branches created so far:"
    git branch --list
}


add_github_secrets(){
    : ' Adds secrets to the Github
    '
    gh secret set DOCKERHUB_USERNAME --body ${DOCKERHUB_USERNAME}
    gh secret set DOCKERHUB_PASSWORD --body ${DOCKERHUB_PASSWORD}
    gh secret set DOCKER_REGISTRY --body ${DOCKER_REGISTRY}
    gh secret set DOCKER_REPOSITORY --body ${DOCKER_REPOSITORY}
    gh secret set STRIPE_SECRET_KEY --body ${STRIPE_SECRET_KEY}
    gh secret set STRIPE_PUBLISHABLE_KEY --body ${STRIPE_PUBLISHABLE_KEY}
}

remove_github_secrets(){
    : ' Removes secrets to the Github
    '
    gh secret remove DOCKERHUB_USERNAME
    gh secret remove DOCKERHUB_PASSWORD
    gh secret remove DOCKER_REGISTRY
    gh secret remove DOCKER_REPOSITORY
    gh secret remove STRIPE_SECRET_KEY
    gh secret remove STRIPE_PUBLISHABLE_KEY
}
```

-   `$ gh extension install cli/gh-webhook`

-   How to set up a webhook on GitHub using the 'gh' CLI tool?

    -   `$ gh repo create repo-name --webhook-url=https://your-webhook-url`
        -   `repo-name` with the name of your repository.
        -   `https://your-webhook-url` with the actual `payload URL` of your webhook.
        -   This command will create a new GitHub repository and set up a webhook with the specified payload URL. Make sure that you have the necessary permissions to create webhooks in the repository.

-   How to update a webhook on GitHub using the 'gh' CLI tool?
    -   `$ gh repo view -w owner/repo-name --json webhook.url | gh api -X PATCH repos/owner/repo-name/hooks/12345 --input - -F config.url=https://your-new-webhook-url`
        -   `owner` with the GitHub username or organization.
        -   `repo-name` with the name of your repository.
        -   `12345` with the actual webhook ID (you can obtain it from the output of the gh repo view command).
        -   `https://your-new-webhook-url` with the updated payload URL.
    -   This command retrieves the existing webhook information, and then uses the `gh` api command to update the webhook configuration with the new payload URL.

```sh

add_gh_wh(){
    # Replace the following placeholders with your values
    OWNER=A-Momin
    REPO=bookstore
    # SECRET=your_webhook_secret
    URL=https://54.210.9.192/github-webhook/

    # Use gh api to create a webhook
    # gh api repos/$OWNER/$REPO/hooks -w -X POST -F name=web -F active=true -F events=push -F config.url=$URL
    # gh api repos/A-Momin/bookstore/hooks -X POST -F name=web -F active=true -F events=push -F config.url=https://54.210.9.192/github-webhook/
    # gh api https://github.com/A-Momin/bookstore/settings/hooks/new -W -X POST -F config.url=https://54.210.9.192/github-webhook/
    gh webhook forward --repo=/A-Momin/bookstore --events=push --url=https://54.210.9.192/webhooks/
}
```

-   <details><summary style="font-size:18px;color:#C71585">How to create Github Token for personal Use</summary>

    -   --> `https://github.com/A-Momin/bookstore` --> `Root Level Settings` --> `Developer Settings` --> `Personnel Access Token` --> `Token (classic)`

    </details>

-   <details><summary style="font-size:18px;color:#C71585">How to configure the GitHub CLI (gh) tool with multiple GitHub accounts</summary>

    -   `NOT TESTED`

    To configure the GitHub CLI (`gh`) tool with multiple GitHub accounts, you can set up different authentication contexts for each account. Here's how to achieve this:

    ##### Log in to Each GitHub Account

    You need to authenticate each account with `gh` and create separate profiles.

    1. **Switch to Account 1 (Personal):**

        - `$ gh auth login`

        - Choose GitHub.com.
        - Select your preferred authentication method (browser or token).
        - Authenticate with your **personal** account.

    2. **Create a Profile for Account 1:**

        - `$ gh config set -h github.com profile personal` - After logging in, name the profile (e.g., `personal`)

    3. **Switch to Account 2 (Work):**

        - `$ gh auth login`
        - Repeat the authentication steps for your **work** account.

    4. **Create a Profile for Account 2:**

        - `$ gh config set -h github.com profile work` -> Name the profile (e.g., `work`)

    ##### Switch Between Profiles

    -   Use the **personal account**:

        -   `gh auth status --profile personal`

    -   Use the **work account**:

        -   `$ gh auth status --profile work`

    ##### Use Profiles with Commands

    When using `gh`, specify the profile explicitly if needed:

    ```bash
    gh repo clone username/repo-name --profile personal
    gh issue create --repo username/repo-name --profile work
    ```

    ##### Set Environment Variables for Automation

    To avoid specifying profiles manually, you can automate this by using environment variables for scripts or specific directories.

    In `.bashrc` or `.zshrc`:

    ```bash
    alias gh-personal='gh --profile personal'
    alias gh-work='gh --profile work'
    ```

    Use these aliases when working with `gh`.

    </details>

-   <details><summary style="font-size:18px;color:#C71585">Github Webhook</summary>

    A **GitHub webhook** is a mechanism that allows external services to be notified of events happening in a GitHub repository. When a specific event occurs in a repository (e.g., a push, pull request, or issue creation), GitHub sends an HTTP POST request to a pre-configured URL (the webhook URL) with details about the event.

    Webhooks enable automation by triggering actions in external systems whenever changes occur in a repository.

    -   **Key Components of a GitHub Webhook**

        1. **Webhook URL**:

        -   The endpoint where GitHub will send the event payload.
        -   Typically, this is an API endpoint or a server that processes the webhook.

        1. **Events**:

        -   You can specify which events will trigger the webhook. Examples include:
            -   `push`: Triggered when commits are pushed to the repository.
            -   `pull_request`: Triggered when a pull request is opened, updated, or merged.
            -   `issues`: Triggered when an issue is created or updated.

        1. **Payload**:

        -   GitHub sends a JSON payload containing details about the event.
        -   For example, a `push` event payload includes commit details, branch information, and the repository URL.

        1. **Secret** (Optional but Recommended):

        -   A secret key that GitHub includes in the payload as a header (e.g., `X-Hub-Signature-256`).
        -   Helps validate that the request is genuinely from GitHub.

    -   **How Webhooks Work**

    1. **Configure a Webhook**:

        - Add a webhook to a repository via the GitHub UI or API.
        - Specify the webhook URL, secret, and event types.

    2. **Trigger an Event**:

        - Perform an action in the repository, like pushing a commit.

    3. **GitHub Sends a POST Request**:

        - GitHub sends a payload to the configured webhook URL.

    4. **Process the Payload**:
        - Your server receives the payload and processes the data, performing any necessary actions (e.g., updating a CI/CD pipeline, notifying a Slack channel).

    -   **Use Cases for GitHub Webhooks**

        1. **Continuous Integration/Continuous Deployment (CI/CD)**:

        -   Trigger build pipelines when code is pushed to specific branches.

        1. **Notification Systems**:

        -   Send notifications to Slack, Microsoft Teams, or other platforms when issues or pull requests are created.

        1. **Automated Testing**:

        -   Run tests automatically after a pull request is opened or updated.

        1. **Custom Workflows**:

        -   Automate tasks like syncing repositories, updating databases, or triggering serverless functions.

    -   **How to Set Up a Webhook**

        -   Using the GitHub UI:

        1. Navigate to the repository’s **Settings** > **Webhooks**.
        2. Click **Add webhook**.
        3. Fill in:
            - **Payload URL**: Your server's URL.
            - **Content type**: Choose `application/json` (recommended).
            - **Secret**: A string for validating requests.
            - **Events**: Select specific events or "Let me select individual events."
        4. Save the webhook.

    -   **Validating Webhook Payloads**

        1. GitHub sends the `X-Hub-Signature-256` header with a hashed signature of the payload.
        2. Use the secret to verify the request:

        -   Compare the hash in the header with one you compute using HMAC SHA-256.

        Example (Python):

        ```python
        import hmac
        import hashlib

        def verify_signature(payload, secret, signature):
            computed_hash = hmac.new(secret.encode(), payload, hashlib.sha256).hexdigest()
            return hmac.compare_digest(f"sha256={computed_hash}", signature)
        ```

    </details>

-   <details><summary style="font-size:18px;color:#C71585">How to create Web Hook on a Github repository using `gh` cli</summary>

    You can create a webhook on a GitHub repository using the `gh` CLI tool by using the `gh api` command to interact with the GitHub REST API. Here’s a step-by-step guide:

    1. **Understand the API Endpoint for Webhooks**

        - The GitHub REST API for creating a webhook is:

            ```
            POST /repos/{owner}/{repo}/hooks
            ```

        - The request requires a JSON payload with the webhook configuration.

    2. **Prepare the Webhook Data**

        - Before running the `gh api` command, decide on:
        - The webhook's **URL** (e.g., your server URL).
        - The type of events the webhook should listen to (e.g., `push`, `pull_request`).
        - Any additional configuration, such as a secret for security.

        - Example JSON payload:
            ```json
            {
                "name": "web",
                "active": true,
                "events": ["push", "pull_request"],
                "config": {
                    "url": "https://example.com/webhook",
                    "content_type": "json",
                    "insecure_ssl": "0",
                    "secret": "your-secret-key"
                }
            }
            ```

    3. **Use the `gh` CLI to Create the Webhook**

        - Run the following command, replacing placeholders with your repository details:

        ```bash
        gh api --method POST \
        -H "Accept: application/vnd.github+json" \
        /repos/{owner}/{repo}/hooks \
        -f name="web" \
        -F active=true \
        -F events='["push", "pull_request"]' \
        -F config='{"url":"https://example.com/webhook","content_type":"json","insecure_ssl":"0","secret":"your-secret-key"}'
        ```

        - Replace:
            - `{owner}`: Your GitHub username or organization name.
            - `{repo}`: The name of the repository.
            - `https://example.com/webhook`: The actual URL of your webhook.
            - `your-secret-key`: A secret string for securing the webhook.

    -   4. **Verify the Webhook**
        -   After creating the webhook, list all webhooks for the repository to verify it:
        -   `$ gh api /repos/{owner}/{repo}/hooks`
        -   Look for your webhook in the output and confirm the configuration.

    1. **Example Walkthrough**

        - Assume you have a repository called `my-repo` owned by `my-user`, and your webhook URL is `https://my-webhook-url.com`. Use the following commands:

        - Create the Webhook:

            ```bash
            gh api --method POST \
            -H "Accept: application/vnd.github+json" \
            /repos/my-user/my-repo/hooks \
            -f name="web" \
            -F active=true \
            -F events='["push"]' \
            -F config='{"url":"https://my-webhook-url.com","content_type":"json","insecure_ssl":"0","secret":"super-secret"}'
            ```

        - List and Verify Webhooks:

            ```bash
            gh api /repos/my-user/my-repo/hooks
            ```

        - This will successfully create and verify a webhook on your GitHub repository. Let me know if you encounter any issues!

    </details>

</details>
