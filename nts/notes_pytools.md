-   **𝑺𝒚𝒎𝒃𝒐𝒍𝒔**: ⌘ ⌥ + ⌃ + ⤶ ⇧  ⤶ ⬋ ↩︎ ↲ ↵ ↫ ⭿ ♥ ★ 🎾 & 🔹

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

-   **`.whl`** File: A `.whl` file (Wheel file) is a binary distribution format for Python packages. It is a pre-built, compressed package that allows for faster installation compared to building from source.

    -   Pre-compiled: Unlike setup.py, which requires building, a `.whl` fi le contains a pre-compiled package, making installation (`pip install package.whl`) faster.
    -   Faster Installation: Since it avoids compilation, installing a wheel file with pip is significantly faster.
    -   Standard Format: `.whl` follows the PEP 427 (Wheel Standard), making it the preferred way to distribute Python packages.

---

-   <details><summary style="font-size:25px;color:Orange"> Software Version System </summary>

    Software versioning is a system of assigning unique identifiers (version numbers) to different releases of a software product. These versions help in tracking changes, managing updates, and ensuring compatibility.

    #### Versioning Schemes

    -   **Semantic Versioning (SemVer)**: Uses a structured `MAJOR.MINOR.PATCH` format:

        -   **MAJOR** (`X.0.0`) → Increments when there are breaking changes.
        -   **MINOR** (`1.X.0`) → Increments when new features are added in a backward-compatible manner.
        -   **PATCH** (`1.0.X`) → Increments when bug fixes and minor improvements are made.
        -   **Example:**
        -   `1.0.0` → Initial stable release
        -   `1.1.0` → Added new feature (backward-compatible)
        -   `1.1.1` → Bug fix release
        -   `2.0.0` → Breaking changes introduced

    -   **Date-Based Versioning**: Uses the release date as the version number, typically `YYYY.MM.DD` or `YYYY.R` (where `R` is the release number for that year).

        -   **Example**: `2024.1`, `2024.02.15`

    -   **Incremental Versioning**: Uses a simple incremental number (`1`, `2`, `3`, etc.).
        -   **Example**: Windows 10, Windows 11

    #### Versioning Terminology

    -   **Pre-Release Versions**: These are versions released before the final stable version and usually include experimental or test features.

        -   **Alpha (`alpha`)** → Very early-stage, unstable version for internal testing.
        -   Example: `1.0.0-alpha.1`
        -   **Beta (`beta`)** → More stable than Alpha, but still under development.
        -   Example: `1.0.0-beta.2`
        -   **Release Candidate (`rc`)** → A version that is almost final, pending last-minute testing.
        -   Example: `1.0.0-rc.1`

    -   **Stable Release**: Official, fully tested version ready for production use. Example: `1.0.0`

    -   **Long-Term Support (LTS)**: A version supported for a longer period with security and bug fixes. Example: `Node.js 18 LTS`

    -   **Hotfix**: A minor release to fix a critical issue. Example: `1.0.1`

    -   **Deprecated Version**: A version that is no longer supported and should not be used.

    #### Other Versioning Concepts

    -   **Backward Compatibility** → New versions work with older data or APIs.
    -   **Forward Compatibility** → Older versions can work with new data or APIs.
    -   **Rolling Release** → Continuous software updates without distinct version numbers (e.g., Arch Linux).

    </details>

---

-   <details><summary style="font-size:25px;color:Orange"> PYTHON3 </summary>

    -   [Corey: How to Set the Path and Switch Between Different Versions/Executables (Mac & Linux)](https://www.youtube.com/watch?v=PUIE7CPANfo&list=PL-osiE80TeTskrapNbzXhwoFUiLCjGgY7&index=14&t=1218s)

    ```python
    >>> import sys
    >>> sys.argv
    >>> sys.executable
        '/Library/Frameworks/Python.framework/Versions/3.7/bin/python3'
    ```

    -   **TROUBLESHOOTING ON PYTHON EXECUTABLES**:

        -   `$ which -a python3` → locate all (-a) python3 file in the user's path
        -   `$ which python3.11`
        -   `$ whereis python3` → /usr/bin/python3
        -   `$ ls -al /opt/homebrew/bin | grep python`
        -   `$ ls -al /opt/bin/python3`
        -   `$ ls -al /opt/bin/python3 | grep python`

        -   **Some Common paths of Python binaries**:

            -   `/usr/local/Cellar/python3/3.7.3/bin`
            -   `/Library/Frameworks/Python.framework/Versions`
            -   `/usr/local/Cellar` → paths of various python versions.
            -   `/usr/local/opt/` → These python executables are actually symlinks of python in `/usr/local/Cellar`
            -   `/usr/local/opt/python@3.9/bin/python3.9` → PATH of python3.9:

    -   `$ type python`
    -   `$ python3 -V` → Version of the current executalbe python3.
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
        -   `sudo pip install virtualenv` → This may already be installed
        -   `virtualenv .env` → Create a virtual environment
        -   `source .env/bin/activate` → Activate the virtual environment
        -   `pip install -r requirements.txt` → Install dependencies
        -   `deactivate` → Exit the virtual environment

    </details>

---

-   <details><summary style="font-size:25px;color:Orange"> pip3 </summary>

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

    -   `$ pip install somepackage.whl` → Install from a Local `.whl` File
    -   `$ pip install numpy --index-url https://pypi.org/simple` → Use a Specific Index (Alternative PyPI)
    -   `$ `
    -   `$ `
    -   `$ `

    -   **Install the Packages from GitHub Using `pip`**:

        -   `$ pip install git+https://github.com/yourusername/your-repo.git` → Install from a Public Repository
        -   `$ pip install git+https://github.com/yourusername/your-repo.git@branch-name` → Install from a Specific Branch
        -   `$ pip install git+https://github.com/yourusername/your-repo.git@v0.1.0` → Install from a Specific Tag (Versioned Release)
        -   `$ pip install git+https://github.com/yourusername/your-repo.git@commit-hash` → Install from a Specific Commit
        -   `$ pip install git+ssh://git@github.com/yourusername/your-repo.git` → Install from a Private Repository (Using SSH)

    -   **pipx**: `pipx` is a tool for installing and running Python applications in isolated environments. It allows you to install CLI-based Python tools globally while keeping them separate from your system's Python environment.

        -   Use `pipx` for standalone CLI applications (e.g., `black`, `poetry`, `httpie`).
        -   Use `pip` for library dependencies inside a virtual environment (e.g., `pip install requests`).

        -   `$ python3 -m pip install --user pipx`
        -   `$ python3 -m pipx ensurepath`
        -   `$ pipx install poetry` → Install a CLI Tool Using `pipx`. This installs `poetry` in an isolated virtual environment and makes it globally accessible.
        -   `$ pipx run cowsay "Hello, World!"` → Run a CLI Tool Without Installing. This runs `cowsay` without permanently installing it.
        -   `$ pipx list` → List Installed Applications
        -   `$ pipx uninstall poetry` → Uninstall a Tool

    -   **How `pipx` Differs from `pip`**

        | Feature                          | `pipx`                                                                     | `pip`                                                                      |
        | -------------------------------- | -------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
        | **Primary Use**                  | Installs and runs Python applications in **isolated virtual environments** | Installs Python packages into the **current environment**                  |
        | **Scope**                        | Designed for **CLI tools** (executables)                                   | Used for installing **libraries, frameworks, and dependencies**            |
        | **Isolation**                    | Each installed package gets its **own virtual environment**                | Installs packages into a **shared environment** (global or virtualenv)     |
        | **Risk of Dependency Conflicts** | Low (isolated environments prevent conflicts)                              | Higher (dependencies may conflict in the same environment)                 |
        | **Global Installation**          | Safe for installing global CLI tools                                       | Not recommended for global installation (can lead to dependency conflicts) |
        | **Uninstallation**               | Clean and removes all traces of a package                                  | May leave behind dependencies that are no longer needed                    |

    </details>

---

-   <details><summary style="font-size:25px;color:Orange"> pipx </summary>

    -   Use `pipx` to keep your Python CLI tools isolated and avoid dependency conflicts!
    -   Installing CLI Applications

        -   `pipx` ensures Python-based command-line tools are **installed globally** but **run in isolated virtual environments**, avoiding dependency conflicts.
        -   Example CLI tools best installed with `pipx`:

            -   `black` (code formatter)
            -   `httpie` (HTTP client)
            -   `awscli` (AWS command-line tool)
            -   `poetry` (Python packaging tool)
            -   `ansible` (IT automation)

            **Example:**

            -   `$ pipx install black` → Install black package
            -   `$ black --version  # Works globally without interfering with other projects`

    -   Preventing Dependency Conflicts
        -   Since `pipx` creates **isolated virtual environments** for each application, it prevents global package conflicts.
        -   If you install a CLI tool using `pip`, it could interfere with existing dependencies.

    #### Commands

    ##### **🔹 Installation & Uninstallation**

    ```bash
    $ pipx install <package-name>
    ```

    -   Install a CLI tool globally in an isolated environment.
    -   **Example:**

        ```bash
        $ pipx install black  # Install Black (Python formatter)
        ```

        ```bash
        $ pipx uninstall <package-name>
        ```

        -   Uninstall a previously installed CLI tool.

    -   **Example:**

        ```bash
        $ pipx uninstall black  # Remove Black
        ```

        ```bash
        $ pipx reinstall <package-name>
        ```

        -   Reinstall a package in a fresh environment.

    -   **Example:**

        ```bash
        $ pipx reinstall black  # Reinstall Black
        ```

        ```bash
        $ pipx reinstall-all
        ```

        -   Reinstall all installed packages. Useful after upgrading Python.

        ```bash
        $ pipx uninstall-all
        ```

        -   Uninstall all installed tools.

    ##### **🔹 Running Python Apps Without Installing**

    ```bash
    $ pipx run <package-name> [args]
    ```

    -   Run a tool **without installing it permanently**.
    -   **Example:**

        ```bash
        $ pipx run cowsay "Hello, pipx!"  # Run cowsay once without installing
        ```

        ```bash
        $ pipx runpip <package-name> <pip-command>
        ```

        -   Run `pip` inside an isolated environment.

    -   **Example:**

        ```bash
        $ pipx runpip black install requests  # Install requests inside Black's environment
        ```

    ##### **🔹 Listing & Managing Installed Packages**

    ```bash
    $ pipx list
    ```

    -   Show all installed CLI tools and their virtual environments.

    ```bash
    $ pipx ensurepath
    ```

    -   Ensure `pipx`'s installation path is in your system's `PATH` variable (needed after installing `pipx`).

    ```bash
    $ pipx upgrade <package-name>
    ```

    -   Upgrade a specific package.
    -   **Example:**

        ```bash
        $ pipx upgrade black  # Upgrade Black
        ```

        ```bash
        $ pipx upgrade-all
        ```

        -   Upgrade all installed packages.

    ##### **🔹 Managing Virtual Environments**

    ```bash
    $ pipx inject <package-name> <dependency>
    ```

    -   Inject additional dependencies into an installed package's environment.
    -   **Example:**

        ```bash
        $ pipx inject black mypy  # Install `mypy` inside Black's environment
        ```

        ```bash
        $ pipx reinstall-all --python <python-version>
        ```

        -   Reinstall all packages using a specific Python version.

    -   **Example:**

        ```bash
        $ pipx reinstall-all --python python3.10  # Reinstall using Python 3.10
        ```

    ##### Summary Table

    | Command                                | Description                                 |
    | -------------------------------------- | ------------------------------------------- |
    | `$ pipx install <package>`             | Install a package globally in isolation     |
    | `$ pipx uninstall <package>`           | Uninstall a package                         |
    | `$ pipx list`                          | List installed packages                     |
    | `$ pipx run <package>`                 | Run a package without installing            |
    | `$ pipx upgrade <package>`             | Upgrade a package                           |
    | `$ pipx upgrade-all`                   | Upgrade all packages                        |
    | `$ pipx reinstall <package>`           | Reinstall a package                         |
    | `$ pipx reinstall-all`                 | Reinstall all packages                      |
    | `$ pipx inject <package> <dependency>` | Add a dependency to a package's environment |

    </details>

---

-   <details><summary style="font-size:25px;color:Orange"> pyenv </summary>

    -   [pyenv doc](https://github.com/pyenv/pyenv-installer)
    -   [How to Install and Run Multiple Python Versions on macOS](https://www.youtube.com/watch?v=31WU0Dhw4sk)

    -   **pyenv** is a popular tool for managing multiple versions of Python on a single system. It simplifies the process of switching between different Python versions and managing project-specific Python environments. Here are the key features and uses of pyenv in the context of Python programming:
    -   **pyenv-virtualenv** is a plugin for `pyenv` that facilitates the creation and management of Python virtual environments. This integration allows you to create virtual environments that are associated with specific Python versions managed by `pyenv`

    -   **Multiple Python Versions**: pyenv allows you to install and use multiple versions of Python simultaneously. This is particularly useful for testing your code against different Python versions or using different versions for different projects.
    -   **Version Switching**: You can easily switch between different Python versions using simple commands. This helps in maintaining compatibility with various projects that might require different Python versions.
    -   **Local and Global Versions**: pyenv enables setting a global Python version that is used system-wide. Additionally, you can set local Python versions for specific projects, ensuring that each project uses the correct version of Python without interfering with others.
    -   **Plugin Support**: pyenv can be extended with plugins, such as pyenv-virtualenv, which integrates virtual environment management. This further enhances its capabilities by allowing the creation and management of isolated Python environments for different projects.
    -   **Configuration**:

        -   `$ brew install pyenv`
        -   `$ brew install pyenv-virtualenv` → [Install pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)

            ```sh
            # Add pyenv to PATH
            export PATH="$HOME/.pyenv/bin:$PATH"
            # Initialize pyenv
            eval "$(pyenv init --path)"
            eval "$(pyenv init -)"
            ##  pyenv-virtualenv is a plugin for pyenv that facilitates the creation and management of Python virtual environments.
            eval "$(pyenv virtualenv-init -)"
            ```

        -   `$ pyenv virtualenvs`
        -   `$ pyenv activate <virtualenv_name>`
        -   `$ pyenv deactivate`
        -   `$ pyenv virtualenv-delete virtualenv_name`

    -   `$ pyenv` → list out all _pyenv_ commands.
    -   `$ pyenv help <command>` → Provide information on the specified command.
    -   `$ pyenv install -l` → List out all the python versions available to install.
    -   🚀`$ pyenv versions` → List out all the installed python versions in your machine.
    -   🚀`$ pyenv global 3.9.7` → Set the given python version as your global python.
    -   🚀`$ pyenv local myenv` → set a virtual environment to be used automatically in a specific project directory by creating a `.python-version` file in that directory.

    -   `$ pyenv install 3.9.7` → Install python3.9.7 through pyenv.
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

    -   `$ pyenv install 3.9.5 ` → Ensure Python 3.9.5 is installed
    -   🚀`$ pyenv versions` → List out all the installed python versions in your machine.
    -   🚀`$ pyenv virtualenv 3.9.5 myenv` → create a virtual environment with a specific version of Python using the pyenv virtualenv command.
    -   🚀`$ pyenv virtualenvs ` → To list all virtual environments managed by `pyenv-virtualenv`
    -   `$ pyenv activate myenv ` → To activate a virtual environment
    -   `$ pyenv deactivate` → To deactivate the currently active virtual environment
    -   `$ pyenv uninstall myenv` → To remove an existing virtual environment
    -   `$ pyenv ` →
    -   `$ pyenv ` →
    -   `$ pyenv ` →

    </details>

---

-   <details><summary style="font-size:25px;color:Orange"> pipenv </summary>

    -   [Corey: Easily Manage Packages and Virtual Environments](https://www.youtube.com/watch?v=zDYL22QNiWk&list=PL-osiE80TeTskrapNbzXhwoFUiLCjGgY7&index=23&t=672s)
    -   [Pipenv & Virtual Environments](https://pipenv-fork.readthedocs.io/en/latest/install.html#installing-pipenv)
    -   `$ NOTE: pipenv should be added to the PATH in order to pipenv be recognized by Terminal.`

    **pipenv** is a dependency management tool for Python that aims to combine the functionalities of pip (Python's package installer) and virtualenv (a tool to create isolated Python environments). It provides a unified approach to managing project dependencies, ensuring that your project's environment is isolated and all dependencies are properly managed.

    -   **Virtual Environment Management**: pipenv automatically creates and manages a virtual environment for your project, eliminating the need to manually create virtual environments with virtualenv or pyenv-virtualenv.
    -   **Dependency Management**: pipenv uses a Pipfile to specify project dependencies, replacing the traditional requirements.txt file. This Pipfile allows for more flexibility and readability.
    -   **Lockfile for Reproducible Builds**: pipenv generates a Pipfile.lock, which locks the exact versions of dependencies, ensuring that your project builds are reproducible and consistent across different environments.
    -   **Integration with pip**: pipenv leverages pip for package installation, ensuring compatibility with the broader Python ecosystem.
    -   **Unified Workflow**: pipenv provides a single command-line interface for managing both virtual environments and dependencies, streamlining the workflow.
    -   **Security**: pipenv can check for known security vulnerabilities in your dependencies using the pipenv check command, which is powered by the Python Packaging Authority's safety database.

    -   **Notes**:

        -   You cannot directly install a specific Python version using `pipenv`.
            -   You can use `pyenv` to install specific Python version.
                -   `pipenv --python 3.*.*` can find the given python version if it's install through `pyenv`.
        -   You have to be in the environment to activate it.
        -   You can run a script that in a perticular environment without activating it (`pipenv run python script.py`).
        -   A random python script cannot be run in a perticular pipenv environment without moving it into that environment.
        -   pipenv does not directly support creating a virtual environment with a custom name. It automatically creates a virtual environment in a default location (`~/.local/share/virtualenvs/`) based on the project's directory.
            -   **Workaround**: Create venv using `pyenv` or `python -m venv` with custom name and activate it. Now `pipenv` consumes it instead of creating a new venv.

    -   **Configuration**:

        -   `$ pip3 install pipenv`

        -   Important Pipenv related paths:

            -   `/Users/a.momin/.local/share/virtualenvs`

    -   🚀`$ pipenv --python 3.7` → Create a new project using Python 3.7, specifically

        -   `$ pipenv --python /usr/local/Cellar/python@3.9/3.9.13_1/Frameworks/Python.framework/Versions/3.9/bin/python3.9`
        -   `$ pipenv --python /usr/local/Cellar/python@3.10/3.10.4/bin/python3.10`

    -   `$ pipenv --help | -h`
    -   `$ pipenv --py` →
    -   `$ pipenv install` → create pip env and install packages from pipfile.lock
    -   `$ pipenv install requests`
    -   `$ pipenv uninstall requests`
    -   `$ exit` → deactivate environment
    -   🚀`$ pipenv shell` → Activate the virtualenv
    -   `$ pipenv run` → Alternative to <pipenv shell>, run a command inside the virtualenv
    -   `$ pipenv run python` →
    -   🚀`$ pipenv run python script.py` → run `script.py` in context of env without activating it. assumed `script.py` is in the venv
    -   `$ pipenv install -r ../requirment.txt` → install several packages from existing project using requirment.txt (a text file containing list of dependencies a project needs) file
    -   `$ pipenv lock -r` →
    -   `$ pipenv install pytest --dev` → way to keep dev packages seperate from build packages
    -   `$ pipenv --python 3.6` → change the python version to 3.6 in the env from existing version. Before running the command mannual change is need inside the pipfile: existing version to 3.6
    -   `$ pipenv --rm` → remove the the environment. Note: the Pipfile is not removed.
    -   🚀`$ pipenv --venv` → Returns the path of activated environment (pipenv)
    -   🚀`$ ls ~/.local/share/virtualenvs/` → to List All Pipenv Virtual Environments.
    -
    -   `$ pipenv check` →
    -   `$ pipenv install` → install from the `Pipfile`
    -   `$ pipenv graph` → Show a graph of your installed dependencies
    -   `$ pipenv lock` →
    -   `$ pipenv install --ignore-Pipfile`

    -   <details><summary style="font-size:15px;color:Maroon">How can I share a pipenv virtual environment with multiple projects?</summary>

        #### Method 1: Use a Common Virtual Environment Path (`PIPENV_VENV_IN_PROJECT`)

        By default, Pipenv stores virtual environments in `~/.local/share/virtualenvs/` (Linux/macOS) or `%USERPROFILE%\.virtualenvs\` (Windows). To share an environment between multiple projects, you can:

        1. **Create the Virtual Environment in a Common Location**

        ```bash
        pipenv --python 3.x  # Create a virtual environment (choose your Python version)
        ```

        2. **Find the Virtual Environment Path**

        ```bash
        pipenv --venv
        ```

        Example output:

        ```
        /Users/your_user/.local/share/virtualenvs/myenv-abc123
        ```

        3. **Set the `PIPENV_VENV_IN_PROJECT` or Manually Link the Virtual Environment**
           To force Pipenv to use this environment in another project, use:

        ```bash
        export PIPENV_VENV_IN_PROJECT=1  # Keeps the env in the project directory
        ```

        Alternatively, create a `.venv` symlink in another project:

        ```bash
        ln -s /Users/your_user/.local/share/virtualenvs/myenv-abc123 /path/to/another_project/.venv
        ```

        #### Method 2: Use a Global Virtual Environment

        Instead of creating project-specific environments, use a system-wide virtual environment and instruct Pipenv to use it:

        4. **Create a Global Virtual Environment**

        ```bash
        python3 -m venv ~/shared_env
        ```

        5. **Activate It in Each Project**: For macOS/Linux:

        ```bash
        source ~/shared_env/bin/activate
        ```

        6. **Use `pipenv --python` to Link It**: In each project, tell Pipenv to use this Python environment:

        ```bash
        pipenv --python ~/shared_env/bin/python
        ```

        #### Method 3: Use a Custom Environment Variable (`PIPENV_IGNORE_VIRTUALENVS`)

        If you manually activate the virtual environment before using `pipenv`, set:

        ```bash
        export PIPENV_IGNORE_VIRTUALENVS=1
        ```

        This prevents Pipenv from creating a new virtual environment and forces it to use the currently activated one.

        </details>

        </details>

---

-   <details><summary style="font-size:25px;color:Orange"> poetry </summary>

    -   **Poetry** is a dependency management and packaging tool for Python that simplifies the process of managing dependencies, packaging projects, and publishing to PyPI. It provides an easy way to create, build, and distribute Python packages while handling virtual environments automatically.

    #### poetry commands

    -   `$ poetry new my_project` → Create a new Python project with a standard structure
    -   `$ poetry init` → Initialize a Poetry project interactively in the current directory
    -   `$ poetry add requests` → Add a package (e.g., requests) to the project dependencies
    -   `$ poetry add numpy@latest` → Add the latest version of numpy
    -   `$ poetry add flask --dev` → Add a package to the development dependencies
    -   `$ poetry install` → Install all dependencies from `pyproject.toml`
    -   `$ poetry update` → Update all dependencies to the latest allowed versions
    -   `$ poetry lock` → Generate a new `poetry.lock` file based on `pyproject.toml`
    -   `$ poetry show` → Show installed dependencies and their versions
    -   `$ poetry show --tree` → Display dependencies in a tree format
    -   `$ poetry remove pandas` → Remove a package from dependencies
    -   `$ poetry build` → Build the project as a package
    -   `$ poetry publish` → Publish the package to PyPI
    -   `$ poetry publish --dry-run` → Simulate publishing without actually uploading
    -   `$ poetry run python script.py` → Run a script inside the Poetry environment
    -   `$ poetry shell` → Spawn a new shell within the virtual environment
    -   `$ poetry env list` → List available virtual environments
    -   `$ poetry env remove python3.10` → Remove a specific virtual environment
    -   `$ poetry self update` → Update Poetry to the latest version
    -   `$ poetry cache clear --all` → Clear all cached dependencies
    -   `$ poetry config --list` → Show current Poetry configuration
    -   `$ poetry export -f requirements.txt > requirements.txt` → Export dependencies to a `requirements.txt` file

    </details>

---

-   <details><summary style="font-size:25px;color:Orange"> conda </summary>

    -   [ANACONDA Documentations](https://conda.io/projects/conda/en/latest/user-guide/index.html)
    -   [Corey Schafer: How to manage multiple version and environments of python](https://www.youtube.com/watch?v=cY2NXB_Tqq0)
    -   path = `/Users/a.momin/opt/anaconda3` → Installed here so that only installing user can use the Conda distribution.
    -   path = `/opt/anaconda3` → Installed here so that all user of the machine can use Anaconda.
    -   `$ conda install bash_kernel -c conda-forge`

    -   `$ conda init <SHELL_NAME>` → To initialize your shell for the first time.
    -   `$ conda init bash` → Appends lines of codes to `.bash_profile` file
    -   `$ conda clean --all` → Conda maintains a package cache that can grow large over time. Clearing the cache can free up significant space.

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

---

-   <details><summary style="font-size:25px;color:Tomato"> Publish a Python package into PyPI Repository </summary>

    #### Experimental Python package:

    -   **Inspired by**: [Arjan Code](https://youtu.be/5KEObONUkik.)
    -   **Created `pyenv` Environment**: `pypkgpublish`
    -   **Project Location**: `/Users/am/mydocs/Software_Development/Python_Program/Python3/2023-package`

    </details>
