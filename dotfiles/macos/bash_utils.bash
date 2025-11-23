beautify_prompt(){
    # colors:
    green="\[\033[0;32m\]"
    blue="\[\033[0;34m\]"
    purple="\[\033[0;35m\]"
    reset="\[\033[0m\]"
    BRed='\033[1;31m'       # Bold Red
    Yellow='\033[0;33m' # Yellow
    Orange='\033[38;5;214m'
    BOrange='\e[1;33m'


    host=$(whoami)
    # host=
    if [ $host = "am" ]; then
        host_color=$BRed
    elif [ $host = "a.momin" ]; then
        host_color=$Orange
    else
        host_color=$BOrange
    fi
    arrow_color=$purple

    # Prompt String
    export PS1="$host_color${host}-$arrow_color =>|$green\$(__git_ps1)$blue\W$arrow_color|\n$ $reset"
    # export PS1="$purple\u =>> |$green\$(__git_ps1)$blue\W$purple|\n$ $reset"

    # Meaning of
        #	\h     ->> the host name
        #	\n     ->> the new line
        #	\s     ->> the name of the shell
        #	\t     ->> the current time in 24-hour format
        #	\u     ->> the user name of current user
        #	\w     ->> the current working directory
        #	\W     ->> the basename of the current working directory
}

base_dotfile_symlinks(){
    ln -sf $NTHUB/dotfiles/macos/bash_profile_mos01 $HOME/.bash_profile
    ln -sf $NTHUB/dotfiles/macos/git-aliases.bash $HOME/.git-aliases.bash
    ln -sf $NTHUB/dotfiles/macos/git-completion.bash $HOME/.git-completion.bash
    ln -sf $NTHUB/dotfiles/macos/git-prompt.sh $HOME/.git-prompt.sh
    ln -sf $NTHUB/dotfiles/macos/aliases $HOME/.aliases
    ln -sf $NTHUB/dotfiles/macos/bash_utils.bash $HOME/.bash_utils.bash
}

pvt_symbolic_links(){
    # Source: $NTHUB
    ln -sf $NTHUB/dotfiles/macos/aws_config.ini \
        $HOME/.aws/config
    ln -sf $NTHUB/dotfiles/macos/aws_credentials.ini \
        $HOME/.aws/credentials
    ln -sf $NTHUB/nts/notes_cicd.md \
        $SD/Web_Development/cicd/notes_cicd.md
    ln -sf $NTHUB/iqs/query_questions_answers.sql \
        $SD/Databases/RDBMS/sql/query_questions_answers.sql
        
    ln -sf $NTHUB/nts/notes_django.md \
        $HOME/mydocs/Software_Development/Web_Development/django-courses/notes_django.md
    ln -sf $NTHUB/nts/notes_docker.md \
        $HOME/mydocs/Software_Development/Web_Development/cicd/dockers/notes_docker.md
    ln -sf $NTHUB/nts/notes_fastapi.md \
        $HOME/mydocs/Software_Development/Web_Development/fast_API/notes_fastapi.md
    ln -sf $NTHUB/nts/notes_flask.md \
        $HOME/mydocs/Software_Development/Web_Development/flask-course/notes_flask.md
    ln -sf $NTHUB/nts/notes_terraform.md \
        $HOME/mydocs/Software_Development/DEDS/terraform_aws/notes_terraform.md
    ln -sf $NTHUB/nts/notes_ansible.md \
        $HOME/mydocs/Software_Development/Web_Development/cicd/ansible/notes_ansible.md
    ln -sf $NTHUB/nts/notes_networking.md \
        $HOME/mydocs/Software_Development/networking/notes_networking.md

    ln -sf $NTHUB/nts/notes_db.md \
        $HOME/mydocs/Software_Development/Databases/RDBMS/sql/notes_db.md
        
    ln -sf $NTHUB/nts/query_questions_answers.md \
        $HOME/mydocs/Software_Development/Databases/RDBMS/sql/query_questions_answers.md

    ############ VSCode User Settings.json ############################
    ln -sf $NTHUB/dotfiles/vscode/settings.json \
        ~/Library/Application\ Support/Code/User/settings.json
    ln -sf $NTHUB/dotfiles/vscode/custom_keybindings.json \
        $HOME/Library/Application\ Support/Code/User/keybindings.json
    ln -sf $NTHUB/dotfiles/vscode/style.less \
        $HOME/.local/state/crossnote/style.less
    ###################################################################
    
    ln -sf $NTHUB/dotfiles/macos/config \
        $HOME/.ssh/config

    if [ ! -f $HOME/notes_rough.md ]; then
        touch $HOME/notes_rough.md;
    fi

}

c1_symbolic_links(){
    ############ VSCode User Settings.json ############################
    ln -sf $NTHUB/dotfiles/vscode/settings.json \
        ~/Library/Application\ Support/Code/User/settings.json
    ln -sf $NTHUB/dotfiles/vscode/custom_keybindings.json \
        $HOME/Library/Application\ Support/Code/User/keybindings.json
    ln -sf $NTHUB/dotfiles/vscode/style.less \
        $HOME/.local/state/crossnote/style.less
    ###################################################################
    
    ln -sf $NTHUB/dotfiles/macos/config \
        $HOME/.ssh/config

    if [ ! -f $HOME/notes_rough.md ]; then
        touch $HOME/notes_rough.md;
    fi
}

tmxnew(){
    if [[ -n $1 ]]; then tmux new -s $1 
    else tmux new -s main
    fi
}


tmxkill(){
    if [[ -n $1 ]]; then tmux kill-ses -t $1 
    else tmux kill-ses -t main
    fi
}

# # Function to rsync the document folder to a flash drive based on the target value
sync_to_volume() {
    : '
    Args:
        $1 (mendatory): the name of the volume attached to the mac.
    
    Example:
        `$ sync_to_volume mypassport`
    '

    # local target="$1"
    rsync -avz \
        --delete \
        --exclude '.venv' \
        --exclude 'venv*' \
        --exclude 'node_modules' \
        --exclude '.ipynb_checkpoints' \
        --exclude '.egg-info' \
        --exclude '*.egg-info' \
        --exclude '*.pyc' \
        --exclude '*.class' \
        --exclude '*.terraform' \
        --exclude '*.git' \
        --exclude '.tmp.drivedownload' \
        --exclude '.tmp.driveupload' \
        --exclude '*.DS_Store' \
        --exclude '.pytest_cache' \
        --exclude '__pycache__' \
        $HOME/mydocs/ /Volumes/$1/MYDOCS_BACKUP/

    # case "$target" in
    #     "mypassport")
    #         echo "Syncing $HOME/mydocs/ to /Volumes/mypassport/MYDOCS_BACKUP/"
    #         rsync -avz --exclude '.venv' --exclude 'venv*' --exclude 'node_modules' --exclude '.ipynb_checkpoints' --exclude '.egg-info' --exclude '*.egg-info' --exclude '*.class' --exclude '*.DS_Store' --exclude '.pytest_cache' --exclude '__pycache__' $HOME/mydocs/ /Volumes/mypassport/MYDOCS_BACKUP/
    #         ;;
    #     "FD01")
    #         echo "Syncing $HOME/mydocs/ to /Volumes/Momin-MC01/MYDOCS_BACKUP/"
    #         rsync -avz --exclude '.venv' --exclude 'venv*' --exclude 'node_modules' --exclude '.ipynb_checkpoints' --exclude '.egg-info' --exclude '*.egg-info' --exclude '*.class' --exclude '*.DS_Store' --exclude '.pytest_cache' --exclude '__pycache__' $HOME/mydocs/ /Volumes/Momin-MC01/MYDOCS_BACKUP/
    #         ;;
    #     *)
    #         echo "Invalid target. Please choose one of: mypassport, mc01, target3."
    #         ;;
    # esac
}

sync_to_c1() {
    : '
    Args:
        $1 (mendatory): the name of the volume attached to the mac.
    
    Example:
        `$ sync_to_c1 mypassport`
    '

    # local target="$1"
    rsync -avz \
        --delete \
        --exclude '*secrets.bash' \
        --exclude '*interviewprep' \
        --exclude '.git' \
        --exclude '.gitignore' \
        --exclude '.venv' \
        --exclude 'venv*' \
        --exclude 'node_modules' \
        --exclude '.teraform' \
        --exclude '.ipynb_checkpoints' \
        --exclude '.egg-info' \
        --exclude '*.egg-info' \
        --exclude '*.pyc' \
        --exclude '*.class' \
        --exclude '.tmp.drivedownload' \
        --exclude '.tmp.driveupload' \
        --exclude '*.DS_Store' \
        --exclude '.pytest_cache' \
        --exclude '__pycache__' \
        /Volumes/$1/MYDOCS_BACKUP/Software_Development/noteshub $HOME/
}

sync_aws_to_c1(){
    : '
    Args:
        $1 (mendatory): the name of the volume attached to the mac.
    
    Example:
        `$ sync_aws_to_c1 mypassport`
    '

    # local target="$1"
    rsync -avz \
        --delete \
        --exclude '.git' \
        --exclude '.venv' \
        --exclude 'venv*' \
        --exclude '.teraform' \
        --exclude 'node_modules' \
        --exclude '.ipynb_checkpoints' \
        --exclude '.egg-info' \
        --exclude '*.egg-info' \
        --exclude '*.pyc' \
        --exclude '*.class' \
        --exclude '.tmp.drivedownload' \
        --exclude '.tmp.driveupload' \
        --exclude '*.DS_Store' \
        --exclude '.pytest_cache' \
        --exclude '__pycache__' \
        /Volumes/$1/MYDOCS_BACKUP/Software_Development/Web_Development/aws $CODEBASE/
}

remove_pattern(){
    find $1 -type d -name "__pycache__*" -exec rm -rf {} \;
    find $1 -type f -name "*.class" -delete
}

launch_ec2(){
    : '
    USAGES: 
        $ launch_ec2 ami-0c7217cdde317cfec t2.micro
    '
    # AMI_ID=$1
    AMI_ID="ami-0c7217cdde317cfec"
    # INSTANCE_TYPE=$2
    INSTANCE_TYPE="t2.micro"
    REGION="${AWS_DEFAULT_REGION}"
    KEY_PAIR_NAME="${AWS_DEFAULT_KEY_PAIR_NAME}"
    SECURITY_GROUP_ID="${AWS_DEFAULT_SG_ID}"
    SUBNET_ID="${AWS_DEFAULT_SUBNET_ID}"

    # Launch the EC2 instance
    INSTANCE_ID=$(aws ec2 run-instances \
        --region "$REGION" \
        --image-id "$AMI_ID" \
        --instance-type "$INSTANCE_TYPE" \
        --key-name "$KEY_PAIR_NAME" \
        --security-group-ids "$SECURITY_GROUP_ID" \
        --subnet-id "$SUBNET_ID" \
        --query 'Instances[0].InstanceId' \
        --output text)

    sleep 20
    # Check if the instance was launched successfully
    if [ -n "$INSTANCE_ID" ]; then
        echo "EC2 instance with ID $INSTANCE_ID is now launching."
    else
        echo "Failed to launch the EC2 instance."
    fi
}


## NOT TESTED YET !!
create_ami(){
    aws ec2 create-image --instance-id $1 --name "Your-AMI-Name" --description "Your-AMI-Description" --no-reboot
}

instance_id_from_nickname(){
    local INSTANCE_NICK_NAME=$1  # Assign the value of the first argument to INSTANCE_NICK_NAME

    # Transform INSTANCE_NICK_NAME to uppercase using 'tr' command
    local INSTANCE_NAME=$(echo "$INSTANCE_NICK_NAME" | tr '[:lower:]' '[:upper:]')

    local INSTANCE=AWS_INSTANCE_ID_$INSTANCE_NAME
    
    local INSTANCE_ID=$(eval "echo \$$INSTANCE")

    echo $INSTANCE_ID
}

up_ec2(){
    : ' Given the AWS EC2 inastance Name, it will launch the instance. Its assumed that the given instance is already created.
    Args:
        ($1): AWS EC2 inastance Name (Host) in your `~/.ssh/config` file.
    Usage:
        $ launch_ec2 ubun
    '

    local INSTANCE_NICK_NAME=$1  # Assign the value of the first argument to INSTANCE_NICK_NAME

    # Transform INSTANCE_NICK_NAME to uppercase using 'tr' command
    local INSTANCE_NAME=$(echo "$INSTANCE_NICK_NAME" | tr '[:lower:]' '[:upper:]')

    local INSTANCE=AWS_INSTANCE_ID_$INSTANCE_NAME
    
    local INSTANCE_ID=$(eval "echo \$$INSTANCE")

    echo "Starting instance with ID: $INSTANCE_ID"
    # Start the EC2 instance
    aws ec2 start-instances --instance-ids "$INSTANCE_ID"
    sleep 30

    local matching="Host $INSTANCE_NICK_NAME"
    local public_ip=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[].Instances[].PublicIpAddress' --output text)
    local replacement="HostName $public_ip"


    if [ $public_ip ]; then
        echo "Your $INSTANCE_NICK_NAME is Started (public IP address: $public_ip)"
        echo "Your Jenkins server is running at: $public_ip:8080/"

        if [ ! -d "$HOME/tmp" ]; then
            mkdir $HOME/tmp
            # echo "A temporary folder has been created in $HOME directory by the name 'tmp'"
        fi

        # Backing up your current `~/.ssh/config` file into a '$HOME/tmp' folder.
        cp ~/.ssh/config $HOME/tmp/config.bak
        
        # This will find the line containing $matching, skip to the next line using n, and then delete that line using d.
        sed "/$matching/{n; d;}" ~/.ssh/config > $HOME/tmp/config
        # sed -i .bak "/Host ubuntu_server/a $replacement" ~/.ssh/config # On Linux
        sed -e "/$matching/a\\"$'\n'"$replacement" $HOME/tmp/config > ~/.ssh/config # on mac Only
        
        mv $HOME/tmp/config.bak ~/.ssh/
        rm -fr $HOME/tmp
    fi
}

show_ec2_ip(){
    local INSTANCE_NICK_NAME=$1  # Assign the value of the first argument to INSTANCE_NICK_NAME

    # Transform INSTANCE_NICK_NAME to uppercase using 'tr' command
    local INSTANCE_NAME=$(echo "$INSTANCE_NICK_NAME" | tr '[:lower:]' '[:upper:]')

    local INSTANCE=AWS_INSTANCE_ID_$INSTANCE_NAME
    
    local INSTANCE_ID=$(eval "echo \$$INSTANCE")

    local public_ip=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[].Instances[].PublicIpAddress' --output text)

    echo "PUBLIC IP ADDRESS: $public_ip"
    echo "Your Jenkins server is running at: http://$public_ip:8080/"
}

down_ec2(){
    : ' Given the AWS EC2 inastance Name, it will stop the running instance.
    Args:
        ($1): AWS EC2 inastance Name (Host) in your `~/.ssh/config` file
    '
    local INSTANCE_NICK_NAME=$1  # Assign the value of the first argument to INSTANCE_NICK_NAME

    # Transform INSTANCE_NICK_NAME to uppercase using 'tr' command
    local INSTANCE_NAME=$(echo "$INSTANCE_NICK_NAME" | tr '[:lower:]' '[:upper:]')

    local INSTANCE=AWS_INSTANCE_ID_$INSTANCE_NAME
    
    local INSTANCE_ID=$(eval "echo \$$INSTANCE")

    # Start the EC2 instance
    aws ec2 stop-instances --instance-ids "$INSTANCE_ID"
}

capturescreen() {
    # Get the current date and time
    current_datetime=$(date +'%m-%d-%Y:%I-%M-%S')
    
    # Specify the full path for screencapture
    # local screencapture_cmd="/usr/sbin/screencapture"
    
    # Set the target folder
    local folder_name="$HOME/mydocs/Software_Development/networking/NetworkingFundamentals/sshot"
    
    # Ensure the target folder exists
    mkdir -p "$folder_name"
    
    # Capture the screenshot
    # screencapture -R 100,100,300,200 -T 1 "$folder_name/screenshot-$current_datetime.png"
    screencapture -T 1 "$folder_name/screenshot-$current_datetime.png"
}

setscpath(){

    defaults write com.apple.screencapture "name" -string "screenshot"
    defaults write com.apple.screencapture include-date -bool false
    # defaults write com.apple.screencapture "include-date" -string "$(date +'%H:%M:%S')"

    defaults write com.apple.screencapture location ${1:-~/Desktop/ss}

    echo "Screenshots will be saved in '$(defaults read com.apple.screencapture location)'"
}

showscpath(){
    echo "Screenshots will be saved in '$(defaults read com.apple.screencapture location)'"
}

create_old_jnb_pyenv(){
    pyenv virtualenv ${1:-oldjnb}
    pyenv activate ${1:-oldjnb}
    pip install -r $SD/requirements_jnb_ds_bash_mysql_2.txt
    pip uninstall jinja2 nbconvert -y
    pip install jinja2 nbconvert
}


# PASSED
run_python_func() {
    : '
    Runs a specified function from a given Python script with mandatory arguments.

    Usage:
        run_python_func </path/to/script.py> <function_name> <arg1> <arg2> <arg3> [...]

    Parameters:
        script_path   - The full or relative path to the Python script (with .py extension).
        function_name - The name of the function inside the Python script.
        args          - Optional arguments to pass to the function (at least 1 required).

    Example:
        run_python_func /Users/am/mydocs/Software_Development/noteshub/utils/misc.py rename_images /Users/am/Desktop/ss screenshot sshot
    '

    # Ensure at least three arguments (script, function, and one function argument)
    if [ $# -lt 3 ]; then
        echo "Usage: run_python_func </path/to/script.py> <function_name> <arg1> <arg2> <arg3> [...]"
        return 1
    fi

    local script_path=$1
    local function_name=$2
    shift 2  # Remove script path and function name, leaving only function arguments

    # Extract directory and script name
    local script_dir
    script_dir=$(dirname "$script_path")
    local script_name
    script_name=$(basename "$script_path" .py)

    # Convert remaining arguments to a Python function call format
    local args=""
    for arg in "$@"; do
        args+="\"$arg\", "
    done
    args=${args%, }  # Remove trailing comma and space

    # Change to the script directory and execute the function with arguments
    (cd "$script_dir" && python3 -c "from ${script_name} import ${function_name}; ${function_name}(${args})")
}

# NOT PASSED
rename_images() {
    # Check if the correct number of arguments is provided
    if [ $# -lt 1 ]; then
        echo "Usage: rename_images <directory> [old_prefix] [new_prefix]"
        return 1
    fi

    # Assign arguments to variables
    local directory=$1
    local old_prefix="${2:-screenshot }"  # Default to "screenshot " if not provided
    local new_prefix="${3:-screenshot }"  # Default to "screenshot " if not provided

    # Ensure the directory exists
    if [ ! -d "$directory" ]; then
        echo "Directory does not exist: $directory"
        return 1
    fi

    # Find all files matching the old prefix and with valid image extensions
    local files=($(find "$directory" -maxdepth 1 -type f -iname "${old_prefix}*.{jpg,jpeg,png,gif,bmp}" | sort))

    # Ensure there are files to rename
    if [ ${#files[@]} -eq 0 ]; then
        echo "No files with the prefix '$old_prefix' found in $directory."
        return 1
    fi

    # Rename files sequentially
    local index=0
    for file in "${files[@]}"; do
        # Extract the file extension
        local extension="${file##*.}"
        local new_filename="${new_prefix}${index}.${extension}"
        local new_path="$directory/$new_filename"

        # Rename the file
        mv "$file" "$new_path"
        echo "Renamed: $(basename "$file") → $new_filename"

        # Increment the index
        ((index++))
    done
}


function findsz() {
    : '
    Finds and displays the sizes of directories in a given path.

    Parameters:
      $1 (optional) - Directory path to search (default: current directory).
      $2 (optional) - Max depth level for search (default: 1).

    Example Usage:
      findsz /var/log 2
      # Lists directory sizes in /var/log up to depth 2, sorted by size.
    '

    find ${1:-.} -maxdepth ${2:-1} -type d -exec du -sh {} + | sort -h
}

function cleandir() {
    : '
    Deletes directories matching a given name pattern within the current directory.

    Parameters:
      $1 (optional) - Directory name pattern to match (default: "*.venv").

    Example Usage:
      cleandir node_modules
      # Removes all directories named "node_modules" in the current directory.

      cleandir
      # Removes all directories named "*.venv" in the current directory.
    '

    find . -type d -name "${1:-*.venv}" -exec rm -rf {} +
}

setup_noteshub_on_c1(){
    : '
    This function sets up the my noteshub environment on a macOS system of Capital One.
    '
    if [ -d "$HOME/noteshub" ]; then
        cp -fr $HOME/noteshub $HOME/noteshub.bak # Forcefully and recursively
    fi

    export NTHUB="$HOME/noteshub"
    export DOTFILES="$NTHUB/dotfiles/macos"
    ln -fs $DOTFILES/bash_profile_capone $HOME/.bash_profile
    source $HOME/.bash_profile

    echo "Previous 'noteshub' folder has been backed up to $HOME/noteshub.bak"
    echo "Remove the backup folder if you don't need it anymore by running the following command:"
    echo -e "\trm -rf $HOME/noteshub.bak" # -e flag enables interpretation of escape sequences like \t for a tab.
}

proxyon(){

    cofproxy on
}

git_add_comit_push(){
    git add .
    git commit -m "regular update"
    git push origin $1
}