-   𝑳𝒊𝒔𝒕 𝒐𝒇 𝐔𝐬𝐞𝐟𝐮𝐥𝐥 𝑺𝒚𝒎𝒃𝒐𝒍𝒔: ⌘ ⌥ + ⌃ + ⤶ ⇧  ⤶ ⬋ ↩︎ ↲ ↵ ↫ ⭿ ♥ ★ 🎾 &

---

-   **site module**: The Python site module is part of the Python standard library and is used to configure the Python environment on startup. It plays a crucial role in setting up the Python environment, including configuring the module search path and handling user-specific site-packages directories.

-   **python3 -m site**: It is used to display information about the site module in Python, which includes paths to various site-packages directories and other configuration details about the Python environment

    ```ini
    sys.path = [
        '/home/user',
        '/usr/local/lib/python39.zip',
        '/usr/local/lib/python3.9',
        '/usr/local/lib/python3.9/lib-dynload',
        '/usr/local/lib/python3.9/site-packages',
    ]
    USER_BASE: '/home/user/.local' (exists)
    USER_SITE: '/home/user/.local/lib/python3.9/site-packages' (exists)
    ENABLE_USER_SITE: True
    ```

<details><summary style="font-size:25px;color:Orange"> PYTHON3 COMMANDS </summary>

-   [Corey: How to Set the Path and Switch Between Different Versions/Executables (Mac & Linux)](https://www.youtube.com/watch?v=PUIE7CPANfo&list=PL-osiE80TeTskrapNbzXhwoFUiLCjGgY7&index=14&t=1218s)

```python
>>> import sys
>>> sys.argv
>>> sys.executable
    '/Library/Frameworks/Python.framework/Versions/3.7/bin/python3'
```

-   MY PYTHON EXECUTABLES:

    -   `/usr/local/Cellar/python3/3.7.3/bin`
    -   `/Library/Frameworks/Python.framework/Versions`
    -   `/usr/local/Cellar` → paths of various python versions.
    -   `/usr/local/opt/` → These python executables are actually symlinks of python in `/usr/local/Cellar`
    -   `/usr/local/opt/python@3.9/bin/python3.9` → PATH of python3.9:

-   `$ type python`
-   `$ which python`
-   `$ which -a python3` → locate all (-a) python3 file in the user's path

-   `$ python3 -V` → Version of the current executalbe python3.
-   `$ whereis python3` → /usr/bin/python3
-   `$ echo $PATH` → show the path variable of my machine.
-   `$ type python3` → python3 is hashed (/usr/local/bin/python3)
-   `$ man python3`
-   `$ python3 module_name.py [arg1, ..., argn]` → Run python file from command line
-   🔥 `$ python3 -m pydoc <package_name>` → print out the documents of the given package.
-   🔥 `$ python3 -m site` → print the path of python3's site-packages
-   `$ python3 -m site --user-base`
-   `$ python3 setup.py install --prefix=~`
    -   'cd' into the module directory that contains `setup.py` and run the install command above.
    -   Instalation of dependencies through the `setup.py` file of the given project
-   `$ python3 setup.py -q deps` → show available dependency groups
-   `$ python3 setup.py -q deps --dep-groups=core,vision` → print dependency list for specified groups
-   `$ python3 setup.py -q deps --help` → see all options
-   `$ python3 setup.py sdist bdist_wheel`
-   🔥 `$ pip3 install -e .` → Install a custom package in editable mode.

-   Installing a Bash Kernel:

    -   `$ python -m venv .venv`
    -   `$ source .venv/bin/activate`
    -   `$ pip install bash_kernel`
    -   `$ pip install ipykernel`
    -   `$ python -m bash_kernel.install`
    -   `$ rm -fr bash_kernel`

-   Installing a MySQL Kernel:

    -   `$ pip install mysql_kernel`
    -   `$ python -m mysql_kernel.install`

-   Run Jupyter from Virtual Environment:

    -   `$ python -m venv .venv`
    -   `$ source .venv/bin/activate`
    -   `$ pip install ipykernel`
    -   `$ ipython kernel install --user --name=jnb_flaskapp_env`
    -   `$ jupyter notebook`
        -   select `jnb_flaskapp_env` from select manu of jupyter karnel.
    -   Installed kernelspec jnb_flaskapp_env in $HOME/Library/Jupyter/kernels/jnb_flaskapp_env

-   `$ jupyter kernelspec list`
-   `$ jupyter kernelspec remove kernel_name`

### python3 Virtual Environment: (python version ≥ 3.3)

-   [How to Use Virtual Environments with the Built-In venv Module](https://www.youtube.com/watch?v=Kg1Yvry_Ydk&list=PL-osiE80TeTskrapNbzXhwoFUiLCjGgY7&index=25&t=0s)

-   `$ python3 -m venv -h` →
-   `$ python3 -m venv project_env ` → Create an python3 virtual environment by the name `project_env` in current directory
-   `$ python3 -m venv .venv` → Create an python3 virtual environment by the name `.venv` in current directory
-   `$ source project_env/bin/activate ` → activate the environment
-   `$ source .venv/bin/activate ` → activate the virtual environment (`.venv`) defined in your current directory
-   `$ deactivate ` → deactivate the active environment
-   `$ python3 -m venv project_env/venv ` → to keep the environment seperate from the project itself.
-   `$ source project_env/venv/bin/activate`
-   `$ which python`
-   `$ pip3 freeze ` → to displey the list of dependencies that you'd used in a requirement.txt file
-   `$ pip3 freeze > requirement.txt ` → create the requirement.txt file with the list of dependencies recorded in the current env.
-   `$ rm -rf project_env ` → to delete the environment, project_env
-   `$ pip3 install -r requirement.txt ` → install the dependencies recorded in requirement.txt into the environment
-   `$ python3 -m venv project_name_env --system-site-packages` → Make global site packages available into to your virtual environment
-   `$ pip3 list --local`

-   How to create python environment from requirment.txt (Python >= 3.6.x):
    -   `cd my_project`
    -   `sudo pip install virtualenv` --> This may already be installed
    -   `virtualenv .env` --> Create a virtual environment
    -   `source .env/bin/activate` --> Activate the virtual environment
    -   `pip install -r requirements.txt` --> Install dependencies
    -   `deactivate` --> Exit the virtual environment

</details>

---

<details><summary style="font-size:25px;color:Orange"> PIP3 (PYTHON PACKAGE MENEGER) </summary>

-   `$ which pip` → run the command from the newly created env
-   `$ pip3 -V` → Version of the pip3
-   `$ type pip3` → pip3 is `/usr/local/bin/pip3`
-   `$ pip3 <command> [options]`
-   `$ sudo -H pip3 install --upgrade pip3`
-   `$ python3 -m pip install --upgrade pip`
-   `$ python3 -m pip uninstall pip`

-   **HELP**:
    -   `$ pip3 -h`
    -   `$ pip3 <command> -h` → EX: `$ pip3 install -h`
-   `$ pip3 help` → Prints out all the availabel commands can be used in conjunction with pip3.
-   `$ pip3 <comand_name> help | -h` → Apply help command to the specified pip command. Ex. pip3 install -h. NOTE: The vertical var, '|', indicate 'OR'
-   `$ pip3 help install` → Provide help with pip3 'install' command.

-   `$ pip3 show <package_name>`
-   `$ pip3 show numpy`
-   `$ pip3 search <package_name>` → Ex. pip3 search numpy
-   `$ pip3 list`
-   `$ pip3 list [--outdated | -o]`
-   `$ pip3 list --local`
-   `$ pip3 install selenium -U` NOTE: `-U` → Update
-   `$ pip3 install -r requirements.txt` → Install all the packages mentioned in the 'requirment.txt' file.
-   `$ pip install Django==3.1.4 -t django_libraries` → Install Django in the given targated directory.
-   🔥 `$ pip3 uninstall -r requirements.txt` → Uninstall all the packages listed in the given requirements file
-   `$ pip3 install numpy`
-   `$ pip3 show numpy`
-   `$ pip3 uninstall --user selenium`
-   `$ pip3 uninstall [options] <package> ...`
-   `$ pip3 uninstall [options] -r <requirements file> ...`
-   `$ pip3 freeze` → to displey the list of dependencies that you'd used in a requirements.txt file
-   `$ pip3 freeze > requirements.txt` → create the requirements.txt file with the list of dependencies recorded in the current env.
-   `$ pip3 install -r requirements.txt` → install the dependencies recorded in requirement.txt into the environment
-   🔥 `$ pip3 install -e .` → Install a custom package in editable mode.

</details>

---

<details><summary style="font-size:25px;color:Orange"> pyenv </summary>

-   [pyenv doc](https://github.com/pyenv/pyenv-installer)
-   [How to Install and Run Multiple Python Versions on macOS](https://www.youtube.com/watch?v=31WU0Dhw4sk)

pyenv is a popular tool for managing multiple versions of Python on a single system. It simplifies the process of switching between different Python versions and managing project-specific Python environments. Here are the key features and uses of pyenv in the context of Python programming:

-   **Multiple Python Versions**: pyenv allows you to install and use multiple versions of Python simultaneously. This is particularly useful for testing your code against different Python versions or using different versions for different projects.
-   **Version Switching**: You can easily switch between different Python versions using simple commands. This helps in maintaining compatibility with various projects that might require different Python versions.
-   **Local and Global Versions**: pyenv enables setting a global Python version that is used system-wide. Additionally, you can set local Python versions for specific projects, ensuring that each project uses the correct version of Python without interfering with others.
-   **Plugin Support**: pyenv can be extended with plugins, such as pyenv-virtualenv, which integrates virtual environment management. This further enhances its capabilities by allowing the creation and management of isolated Python environments for different projects.

-   `$ brew install pyenv`
-   `$ brew install pyenv-virtualenv` → [Install pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)

    -   `$ pyenv virtualenvs`
    -   `$ pyenv activate <virtualenv_name>`
    -   `$ pyenv deactivate`
    -   `$ pyenv virtualenv-delete virtualenv_name`

-   `$ pyenv` → list out all _pyenv_ commands.
-   `$ pyenv help <command>` → Provide information on the specified command.
-   `$ pyenv versions` → List out all the installed python versions in your machine.
-   `$ pyenv install -l` → List out all the python versions available to install.
-   `$ pyenv install 3.9.7` → Install python3.9.7 through pyenv.
-   `$ pyenv global 3.9.7` → Set the given python version as your global python.
-   `$ pyenv install 3.10.0rc2` → Install latest release candidate (rc) of your current python version.
-   `$ pyenv local 3.10.0rc2` → Install latest release candidate as dot python version for this project.
-   `$ python -m venv .venv` → Create python environment from the `..python` version.
-   `$ pyenv `

-   Some useful pyenv commands are:
    -   `$ pyenv --version` → Display the version of pyenv
    -   `$ pyenv commands` → List all available pyenv commands
    -   `$ pyenv exec` → Run an executable with the selected Python version
    -   `$ pyenv global` → Set or show the global Python version(s)
    -   `$ pyenv help` → Display help for a command
    -   `$ pyenv hooks` → List hook scripts for a given pyenv command
    -   `$ pyenv init` → Configure the shell environment for pyenv
    -   `$ pyenv install` → Install a Python version using python-build
    -   `$ pyenv latest` → Print the latest installed or known version with the given prefix
    -   `$ pyenv local` → Set or show the local application-specific Python version(s)
    -   `$ pyenv prefix` → Display prefixes for Python versions
    -   `$ pyenv rehash` → Rehash pyenv shims (run this after installing executables)
    -   `$ pyenv root` → Display the root directory where versions and shims are kept
    -   `$ pyenv shell` → Set or show the shell-specific Python version
    -   `$ pyenv shims` → List existing pyenv shims
    -   `$ pyenv uninstall` → Uninstall Python versions
    -   `$ pyenv version` → Show the current Python version(s) and its origin
    -   `$ pyenv version-file` → Detect the file that sets the current pyenv version
    -   `$ pyenv version-name` → Show the current Python version
    -   `$ pyenv version-origin` → Explain how the current Python version is set
    -   `$ pyenv versions` → List all Python versions available to pyenv
    -   `$ pyenv whence` → List all Python versions that contain the given executable
    -   `$ pyenv which` → Display the full path to an executable

#### Create and Mange Virtural Environment using 'pyenv'

-   `pyenv-virtualenv` is a plugin for `pyenv` that facilitates the creation and management of Python virtual environments. This integration allows you to create virtual environments that are associated with specific Python versions managed by `pyenv`

-   `$ pyenv install 3.9.5 ` --> Ensure Python 3.9.5 is installed
-   `$ pyenv virtualenv 3.9.5 myenv` --> create a virtual environment with a specific version of Python using the pyenv virtualenv command.
-   `$ pyenv virtualenvs ` --> To list all virtual environments managed by `pyenv-virtualenv`
-   `$ pyenv activate myenv ` --> To activate a virtual environment
-   `$ pyenv deactivate` --> To deactivate the currently active virtual environment
-   `$ pyenv uninstall myenv` --> To remove an existing virtual environment
-   `$ pyenv ` -->
-   `$ pyenv ` -->
-   `$ pyenv ` -->

-   **Set a Local Virtual Environment**: You can set a virtual environment to be used automatically in a specific project directory by creating a `.python-version` file in that directory. This can be done with the pyenv local command:
    -   `$ pyenv local myenv` -->

</details>

---

<details><summary style="font-size:25px;color:Orange"> pipenv (available for python version ≥ 3.3) </summary>

-   [Corey: Easily Manage Packages and Virtual Environments](https://www.youtube.com/watch?v=zDYL22QNiWk&list=PL-osiE80TeTskrapNbzXhwoFUiLCjGgY7&index=23&t=672s)
-   [Pipenv & Virtual Environments](https://pipenv-fork.readthedocs.io/en/latest/install.html#installing-pipenv)
-   `$ NOTE: pipenv should be added to the PATH in order to pipenv be recognized by Terminal.`

pipenv is a dependency management tool for Python that aims to combine the functionalities of pip (Python's package installer) and virtualenv (a tool to create isolated Python environments). It provides a unified approach to managing project dependencies, ensuring that your project's environment is isolated and all dependencies are properly managed.

-   **Virtual Environment Management**: pipenv automatically creates and manages a virtual environment for your project, eliminating the need to manually create virtual environments with virtualenv or pyenv-virtualenv.
-   **Dependency Management**: pipenv uses a Pipfile to specify project dependencies, replacing the traditional requirements.txt file. This Pipfile allows for more flexibility and readability.
-   **Lockfile for Reproducible Builds**: pipenv generates a Pipfile.lock, which locks the exact versions of dependencies, ensuring that your project builds are reproducible and consistent across different environments.
-   **Integration with pip**: pipenv leverages pip for package installation, ensuring compatibility with the broader Python ecosystem.
-   **Unified Workflow**: pipenv provides a single command-line interface for managing both virtual environments and dependencies, streamlining the workflow.
-   **Security**: pipenv can check for known security vulnerabilities in your dependencies using the pipenv check command, which is powered by the Python Packaging Authority's safety database.

-   Important Pipenv related paths:

    -   `/Users/a.momin/.local/share/virtualenvs`

-   `$ pip3 install pipenv`
-   `$ pipenv --python 3.7`

    -   `$ pipenv --python /usr/local/Cellar/python@3.9/3.9.13_1/Frameworks/Python.framework/Versions/3.9/bin/python3.9`
    -   `$ pipenv --python /usr/local/Cellar/python@3.10/3.10.4/bin/python3.10`
    -   Create a new project using Python 3.7, specifically

-   `$ pipenv --help | -h`
-   `$ pipenv --py`
-   `$ pipenv --venv`
    -   Returns the path of activated environment (pipenv)
    -   Output Python interpreter information.
-   `$ pipenv install` → create pip env and install packages from pipfile.lock
-   `$ pipenv install requests`
-   `$ pipenv uninstall requests`
-   `$ exit` → deactivate environment
-   `$ pipenv shell` → To activate this project in the virtualenv
-   `$ pipenv run` → Alternative to <pipenv shell>, run a command inside the virtualenv
-   `$ pipenv run python`
-   `$ pipenv run python script.py` → run script.py in context of env. without activating it.
-   `$ pipenv install -r ../requirment.txt` → install several packages from existing project using requirment.txt (a text file containing list of dependencies a project needs) file
-   `$ pipenv lock -r`
-   `$ pipenv install pytest --dev` → way to keep dev packages seperate from build packages
-   `$ pipenv --python 3.6` → change the python version to 3.6 in the env from existing version. Before running the command mannual change is need inside the pipfile: existing version to 3.6
-   `$ pipenv --rm` → remove the the environment. Note: the Pipfile is not removed.
-   `$ pipenv --venv` → path to the virtual env
-   `$ pipenv check`
-   `$ pipenv install` → install from the `Pipfile`
-   `$ pipenv graph` → Show a graph of your installed dependencies
-   `$ popenv lock`
-   `$ pipenv install --ignore-Pipfile`

</details>

---

<details><summary style="font-size:25px;color:Orange"> ANACONDA </summary>

-   [ANACONDA Documentations](https://conda.io/projects/conda/en/latest/user-guide/index.html)
-   [Corey Schafer: How to manage multiple version and environments of python](https://www.youtube.com/watch?v=cY2NXB_Tqq0)
-   path = `/Users/a.momin/opt/anaconda3` → Installed here so that only installing user can use the Conda distribution.
-   path = `/opt/anaconda3` → Installed here so that all user of the machine can use Anaconda.
-   `$ conda install bash_kernel -c conda-forge`

-   `$ conda init <SHELL_NAME>` → To initialize your shell for the first time.
-   `$ conda init bash` → Appends lines of codes to `.bash_profile` file
-   `$ conda clean --all` --> Conda maintains a package cache that can grow large over time. Clearing the cache can free up significant space.

-   #### conda help:

    -   `$ conda -h`
    -   `$ conda <command> -h` → EX. conda remove -h
    -   `$ conda create -H`
    -   `$ conda env -h`
    -   `$ conda env remove -h`
    -   `$ conda config remove -h`

-   #### conda config:

    -   `$ conda config --describe [DESCRIBE [DESCRIBE ...]]` → Describe given configuration parameters. If no arguments given, show information for all configuration parameters.
    -   `$ conda config --set auto_activate_base false` → To prevent Conda from activating the base environment by default?
    -   `$ conda config --add channels conda-forge` → Add the conda-forge channel:
    -   `$ conda config --show channels` -

-   FastAI:

    -   git clone https://github.com/fastai/fastai.git
    -   cd fastai

-   `$ conda activate fastai-cpu`
-   `$ 🔥 conda info`
-   `$ 🔥 conda info --envs` → To see a list of all of your environments

-   #### conda env:

    -   `$ 🔥 conda env list` → To see a list of all of your environments
    -   `$ 🔥 conda env export > environent.yml` → export virtual environent into environent file.
    -   `$ 🔥 conda env create -f environment-cpu.yml` → Create a new python project environment using conda package manager
    -   `$ 🔥 conda env create -f bio-env.txt -n env_name` → Create a new project environment using text file.
    -   `$ 🔥 conda env remove --name environent_name` → Remove/Delete the environment by the name `environent_name`

-   #### conda create/remove:

    -   `$ conda create -n env_name -y` → Create a environment with the given name, env_name
    -   `$ conda create --name conda_env_name <first_pkg second_pkg ...>`
    -   `$ conda create --name bio-env biopython` → Stack commands: create a new environment, name it bio-env and install the biopython package
    -   `$ conda create --name conda_env_name27 python=2.7 <a_pythone_package>` → Create a new python 2.7 project environment using conda package manager
    -   `$ 🔥 conda env create -f environment-cpu.yml` → Create a new python project environment using conda package manager
    -   `$ 🔥 conda env create -f requirements.txt -n  env_name` → Create a new project environment using text file.
    -   `$ conda remove --name conda_env_name --all` → Remove the specified environment
    -   `$ conda remove --name conda_env_name <package_name>` → Remove the specified package_name from specified environment.
    -   `$ 🔥 conda env remove --name environent_name` → Remove/Delete the environment by the name `environent_name`

-   🔥 `$ conda list` → list out the packages in the current environments
-   `$ conda list --explicit > pkgs.txt` → Export an environment with exact package versions for one OS
-   🔥 `$ conda list --export > requirements.txt`
-   `$ conda update -n base -c defaults conda`
-   `$ conda activate conda_env_name` → To activate this environment. Ex. conda activate fastai-cpu
-   `$ source activate conda_env_name` → To activate the environent
-   `$ conda deactivate` → To deactivate an active environment
-   `$ source deactivate` → To deactivate an active environment
-   `$ conda install -c pytorch pytorch`

##### [How to Manage Multiple Projects, Virtual Environments, and Environment Variables](https://www.youtube.com/watch?v=cY2NXB_Tqq0&list=PL-osiE80TeTt2d9bfVyTiXJA-UTHn6WwU&index=16)

-   Create a bash file in corresponding conda environment.
    -   mkdir -p $HOME/opt/anaconda3/envs/fastai/etc/conda/activate.d
    -   mkdir -p $HOME/opt/anaconda3/envs/fastai/etc/conda/deactivate.d
    -   touch $HOME/opt/anaconda3/envs/fastai/etc/conda/activate.d/env_vars.sh
        -   #!/bin/sh
        -   export SECRET_KEY='SDFLKJ;LASKJF;LAKSD;L'
        -   export DATABASE_URI="postgresql://user:pass@bd_server:5432/test_db"
    -   touch $HOME/opt/anaconda3/envs/fastai/etc/conda/deactivate.d/env_vars.sh
        -   #!/bin/sh
        -   unset SECRET_KEY
        -   unset DATABASE_URI

</details>
