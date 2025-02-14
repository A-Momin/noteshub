

# Add `GNU grep` to the path so that it can be used instead of the Apple version (BSD grep).
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

# Set `VSCode` as Crontab's editor.
# export VISUAL=code

# Added Web Drivers for Automation Testing
export PATH="$HOME/mydocs/Software_Development/Web_Development/qa_automation/robot_framework/chromedriver:$PATH"
export PATH="$HOME/mydocs/Software_Development/Web_Development/qa_automation/robot_framework/geckodriver:$PATH"


export ADS="$HOME/mydocs/Software_Development/Algorithms_and_Data_Structures"
export SD="$HOME/mydocs/Software_Development"
export GD="$HOME/mydocs/gd"
export ML="$HOME/mydocs/Software_Development/Machine_Learning/ml_courses"
export NLTK_DATA='$HOME/nltk_data'
export UTILS="$HOME/mydocs/Software_Development/noteshub/utils"
export DATA="$HOME/DATA"

# Flask Environment Variables
export FLASK_APP=run.py
export FLASK_DEBUG=1
export FLASK_ENV=dev


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


create_alias(){
    alias python=python3
    alias pip=pip3
    alias vim=nvim
    # alias tmux="tmux 2"
}


establish_symlinks(){
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
    ln -sf $NTHUB/nts/notes_aws.md \
        $HOME/mydocs/Software_Development/Web_Development/aws/notes_aws.md
    ln -sf $NTHUB/nts/notes_docker.md \
        $HOME/mydocs/Software_Development/Web_Development/cicd/dockers/notes_docker.md
    ln -sf $NTHUB/nts/notes_fastapi.md \
        $HOME/mydocs/Software_Development/Web_Development/fast_API/notes_fastapi.md
    ln -sf $NTHUB/nts/notes_flask.md \
        $HOME/mydocs/Software_Development/Web_Development/flask-course/notes_flask.md
    ln -sf $NTHUB/nts/notes_terraform.md \
        $HOME/mydocs/Software_Development/Web_Development/cicd/terraforms/notes_terraform.md
    ln -sf $NTHUB/nts/notes_ansible.md \
        $HOME/mydocs/Software_Development/Web_Development/cicd/ansible/notes_ansible.md
    ln -sf $NTHUB/nts/notes_networking.md \
        $HOME/mydocs/Software_Development/networking/notes_networking.md
    
    # VSCode User Settings.json
    ln -sf $NTHUB/dotfiles/vscode/settings.json \
        ~/Library/Application\ Support/Code/User/settings.json
    ln -sf $NTHUB/dotfiles/vscode/style.less \
        $HOME/.local/state/crossnote/style.less
    
    ln -sf $NTHUB/dotfiles/macos/config \
        $HOME/.ssh/config

    ln -sf $NTHUB/nts/notes_db.md \
        $HOME/mydocs/Software_Development/Databases/RDBMS/sql/notes_db.md
        
    ln -sf $NTHUB/nts/query_questions_answers.md \
        $HOME/mydocs/Software_Development/Databases/RDBMS/sql/query_questions_answers.md
        

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

    defaults write com.apple.screencapture location ${1:-~/Desktop/screenshots}

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
