-   𝐔𝐬𝐞𝐟𝐮𝐥𝐥 𝑺𝒚𝒎𝒃𝒐𝒍𝒔: ⮐ ⎇ ⬆︎ ⌘ ⌥ + ⌃ + ⤶ ⇧  ⤶ ⬋ ↩︎ ↲ ↵ ↫ ⭿ ♥ ★ 🎾 &

-   [Documentations: Jupyter Notebook](https://jupyter-notebook.readthedocs.io/en/latest/?badge=latest)
-   [Deploy A Jupyter Notebook Server into Production using Docker & Heroku](https://www.youtube.com/watch?v=GoJ6qR2VMTA)
-   [How to install Bash Kernel](http://slhogle.github.io/2017/bash_jupyter_notebook/)
-   [IPython Doc](https://ipython.readthedocs.io/en/stable/interactive/tutorial.html#)
-   [IPython Doc](https://ipython.org/documentation.html)

-   `jupyter nbconvert --to script data-wrangling-and-ml-with-pyspark.ipynb` --> Convert `*.ipynb` into `*.py`
-   `jupyter labextension list`

```sh
create_old_jnb_pyenv(){
    pyenv virtualenvs oldjnb
    pyenv activate oldjnb
    pip install -r $SD/requirements_jnb_ds_bash_mysql.txt
    pip uninstall jinja2 nbconvert
    pip install jinja2 nbconvert
}
```

<details open><summary style="font-size:25px;color:Orange;text-align:left">Magic Commands</summary>

In Jupyter Notebooks, **magic commands** are special commands that are not a part of the Python language but provide additional functionality for interacting with the notebook environment. Magic commands start with either a single % (line magic) or %% (cell magic) and are used to perform various tasks.

-   MAGIC:

    -   Magic commands come in two flavors:
        -   Line Magics, which are denoted by a single `%` prefix and operate on a single line of input,
        -   Cell Magics, which are denoted by a double `%%` prefix and operate on multiple lines of input.

-   LINE MAGIC:

    -   They are similar to command line calls.
    -   They start with `%` character.
    -   Rest of the line is its argument passed without parentheses or quotes.
    -   Line magics can be used as expression and their return value can be assigned to variable.

-   CELL MAGIC:

    -   They have `%%` character prefix.
    -   They can operate on multiple lines below their call.

-   `%magicfunction?` → Information of a given 'magicfunction' is printed.
-   `!` → Bash Command Prefix
-   `%` → line magic indicator
-   `%%` → cell magic indicator
-   `%lsmagic` → list out all the magic commands available to be used.
-   `%matplotlib inline` → %matplotlib inline sets the backend of matplotlib to the 'inline' backend: With this backend, the output of plotting commands is displayed inline within frontends like the Jupyter notebook, directly below the code cell that produced it.

**Line Magic Commands:**

-   Run the named file inside the Jupyter notebook as a program.

    ```python
    %run script.py
    %time and %timeit:
    ```

-   Measure the execution time of a single statement or expression.

    ```python
    %time print("Hello, World!")
    %timeit -n 1000 -r 3 sum(range(1000))
    ```

-   Load code into a code cell.

    ```python
    %load path/to/script.py
    ```

-   Display variables in the interactive namespace or reset the namespace.

    ```python
    %who
    %whos
    %reset -f
    # Cell Magic Commands:
    %%time and %%timeit:
    ```

**Cell Magic Commands:**

-   Measure the execution time of the entire cell or a statement multiple times.

    ```python
    %%time
    print("Hello, World!")
    %%writefile:
    ```

-   Write the contents of a cell to a file.

    ```python
    %%writefile script.py
    print("Hello, World!")
    %%html:
    ```

-   Render the cell contents as HTML.

    ```python
    %%html
    <h1>Hello, World!</h1>
    %%bash:
    ```

-   Run cell with bash in a subprocess.

    ```python
    %%bash
    echo "Hello, World!"
    %%capture:
    ```

-   Capture the stdout/stderr of a cell.

    ```python
    %%capture captured_output
    print("Hello, World!")
    ```

These are just a few examples, and there are many more magic commands available. To see a list of all available magic commands and their descriptions, you can use `%lsmagic` or `%magic` in a Jupyter cell. Additionally, you can get help on any magic command by appending ? to the command, for example, %timeit?.

</details>

---

<details open><summary style="font-size:25px;color:Orange;text-align:left">Installation & Configurations:</summary>

#### Installation and Configurations of Jupyter Lab

-   `$ pip install jupyterlab`
-   `$ pip install ipykernel; pip install bash_kernel; python -m bash_kernel.install` → Installing a Bash Kernel

#### Installation and Configurations of Jupyter Notebook

-   `$ python3 -m pip install jupyter` → install Jupyter Notebook
-   `$ pip3 install --upgrade notebook` → Upgrade Jupyter Notebook
-   `$ pip install notebook`

-   `$ jupyter notebook` → start server of jupyter notebook at port-8888.
-   🔥 `$ jupyter notebook --help`
-   `$ jupyter notebook --help-all`
-   🔥 `$ jupyter --path`
-   🔥 `$ jupyter notebook --generate-config` → Create a `jupyter_notebook_config.py` file in the `.jupyter` directory, with all the defaults configurations commented out.

-   `$ jupyter kernelspec list `
-   `$ jupyter kernelspec remove kernel_name`

-   🔥 `$ pip install ipykernel`
-   🔥 `$ ipython kernel install --user --name=ads_jnb_kernel`

-   How to create bash kernel for jupyter notebook

    -   `$ python -m venv .venv`
    -   `$ source .venv/bin/activate`
    -   `$ pip install ipykernel`
    -   `$ pip install bash_kernel`
    -   `$ python -m bash_kernel.install`
    -   `$ rm -fr bash_kernel`

    ```bash
    create_bash_kernel(){
        # It install a bash kernel for jupyter notebook.
        # NOTE: It's recommanded to install it in a perticular conda environment.

        pip install bash_kernel
        python -m bash_kernel.install
        rm -fr bash_kernel
    }
    ```

-   How to create mysql kernel for jupyter notebook

    ```bash
    create_sql_kernel(){
        # It install a mysql kernel for jupyter notebook.
        # NOTE: It's recommanded to install it in a perticular conda environment.

        pip install mysql-kernel #
        python -m mysql_kernel.install

        # run the next line only if installed kernel does not work as expected
        # pip install --user --upgrade "sqlalchemy<2.0"
    }
    ```

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

#### How add custome style sheet (css) to Jupyter Notebook

-   `$ jupyter notebook --generate-config`

-   `Specify CSS Rules`: Add CSS rules to your `custom.css` file. For example, to increase the font size for code cells and Markdown cells, you can use CSS rules like the following:

    ```css
    /* Increase font size for code cells */
    .CodeMirror pre {
        font-size: 14px; /* Adjust the font size as needed */
    }

    /* Increase font size for Markdown cells */
    .text_cell_render p {
        font-size: 16px; /* Adjust the font size as needed */
    }
    ```

-   `Specify Custom CSS File in Jupyter Notebook`:

    -   To apply these CSS rules, you need to specify your custom CSS file in your Jupyter Notebook configuration. You can do this by editing the Jupyter configuration file.
    -   Open a terminal and run the following command to generate a Jupyter Notebook configuration file if you haven't already:
        -   `$ jupyter notebook --generate-config`
        -   This will create a configuration file, typically named jupyter_notebook_config.py, in your Jupyter configuration directory.

-   `Edit the Configuration File`: Open the generated configuration file (e.g., jupyter_notebook_config.py) in a text editor. Search for the c.NotebookApp.css_files line and uncomment it if necessary. Add the path to your custom CSS file:

    ```python
    c.NotebookApp.css_files = ["path/custom.css"]
    ```

#### ENABLE JUPYTER NOTEBOOK EXTENSION & THEMES:

-   [Installing jupyter_contrib_nbextensions](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/install.html)

-   `$ conda install -c conda-forge jupyter_contrib_nbextensions` → Install the extention from `conda-forge` channel.
-   `$ pip install jupyter_contrib_nbextensions` → Install the extention
-   `$ jupyter contrib nbextension install --user` → Setup the configuration
-   `$ pip install jupyter_nbextensions_configurator`
-   `$ jupyter nbextensions_configurator enable --user`
-   `$ jupyter nbextension enable <nbextension require path>` → Enable the extension
-   `$ pip install jupyterthemes` → install jupyterthemes
-   `$ pip install --upgrade jupyterthemes` → upgrade to latest version
-   `$ jt -l` → List out all the available themes available in package called 'jupyterthemes'
-   `$ jt -t gruvboxd` → Enable 'gruvboxd' theme
-   `$ jt -r` → Reset the theme of this notebook to default setting.

-   It’s time to make your jupyter notebook cool again. One can customize each and every aspect of the notebooks. Lets start with customizing colours. On both windows and linux (ubuntu), the process is fairly straight.
-   Customizing colours:
    -   Go to user directory for whom jupyter is installed.
    -   Find directory named `.jupyter`. Note that you may find another folder named `.ipython` in the same directory. IPython is now the Jupyter project.
    -   Create folder named `custom` in the `.jupyter` directory.
    -   Create a CSS file in the `custom` directory. Name it `custom.css`.
    -   Open up your favourite editor. Start adding style to this file.

#### Important Files:

-   `~/.jupyter/custom/custom.js` → a special file to tweak the jupyter notebook setup
-   `~/.jupyter/nbconfig/notebook.json` → another special file to tweak the jupyter setup
-   `/Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/jupyter_contrib_nbextensions`

</details>

<details open>
<summary style="font-size:25px;color:Orange;text-align:left">Usefull JNB Shortcuts:</summary>

#### USEFULL JUPYTER TRICKS:

-   `<Function_name> + ⬆︎ + ⮐` → Show where the the given function, 'Function_name', from.
-   `? <Function_name>` → Print out the doc string of the given 'Function_name'.
-   `?? <Function_name>` → Print out the source code for the given 'Function_name'.
-   🔥 `⬆︎ + tab` → Print the short version of document string.
-   🔥 `⬆︎ + tab + tab` → Print the long version of the document string.
-   `⬆︎ + tab + tab + tab` →
-   `⎇ + tab ` → Auto Completion
-   `^ + ⬆︎ + -` → Split cell into two cells
-   `Hold down 'alt'` → Use multiple cursors
-   `Cmd + '[' / ']'` → Indent / dedent line
-   `%load <path/python_file.py>`
-   `%run <path/python_file.py>` → Execute a python script from jupyter notebook cell.
-   `%run -i <path/python_file.py>` → Import custom python script file
-   `!` → bash command prrefix in JNB. The exclamatory symbol is followed by a bash command. (`!pwd`, `!ls`, `!cd`)

#### SHORTCUTS:

-   `⌃ + ⮐` → run selected cell
-   `⬆︎ + ⮐` → run cell, select below
-   `⎇ + ⮐` → run cell and insert below
-   `A` → insert empty cell above
-   `B` → insert empty cell below
-   `Y` → change selected markdown cell into code cell.
-   `M` → change code-type-cell to markdown-type-cell
-   `dd` → delete selected cell
-   `J` → move cell selection up
-   `K` → move cell selection down
-   `c` → copy selected cell
-   `x` → cuts selected cell
-   `v` → paste after the selected cell
-   `z` → undo the last operation
-   🔥`⎇ + f` → Fold / Expand code Block.
-   🔥`⬆︎ + ^ + <-` → collapse all the heading
-   🔥`⬆︎ + ^ + ->` → expand all the heading
-   🔥`<-` → collapse the heading of the selected.
-   🔥`->` → expand the selected heading
-   `⬆︎ + ->` / `->` → select cells
-   `⬆︎ + m` → merges selected cells
-   `⬆︎ + ^ + -` → splits the cell at the cursor's position
-   `f` → find and replace in selected cells
-   `1` → change cell to heading 1 (not in VSC)
-   `2` → change cell to heading 2 (not in VSC)
-   `3` → change cell to heading 3 (not in VSC)
-   `4` → change cell to heading 4 (not in VSC)
-   `5` → change cell to heading 5 (not in VSC)
-   `6` → change cell to heading 6 (not in VSC)

</details>

---

<details open><summary style="font-size:25px;color:Orange;text-align:left">Jupyter lab</summary>

-   `$ pip install jupyterlab_materialdarker_theme`
-   `$ jupyter labextension list`
-   `$ pip uninstall jupyterlab_materialdarker_theme`
-   `$ `
-   `$ `

</details>

---

<details open><summary style="font-size:25px;color:Orange;text-align:left">MISC</summary>

<!-- #  Running Jupyter Notebook on an EC2 Server  -->

#!/usr/bin/env bash

# Commands for installing jupyter server in GCP Compute Engine

-   `$ sudo apt-get update`
-   `$ sudo pip install jupyter`
-   `$ jupyter notebook --generate-config`

```python
# vim ~/.jupyter/jupyter_notebook_config.py
c = get_config()
c.NotebookApp.ip = '\*'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 1111
```

-   `$ jupyter notebook password`
-   `$ jupyter notebook --ip=0.0.0.0 --port=8886 --no-browser`

 <!-- Running Jupyter Notebook on AWS  -->

jupyter notebook --generate-config

ipython

from IPython.lib import passwd

passwd()

Enter password: [Create password and press enter] Verify password: [Press enter]

'sha1:e8b6afa24b64:608613e172510938d5c357c28a6771c1cfa2d85a'

exit

openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem
sudo chown $USER:$USER /home/ubuntu/certs/mycert.pem

ssh -i ~/Desktop/fastai_ml1.pem -N -f -L 8888:localhost:8888 ubuntu@ec2-54-165-14-114.compute-1.amazonaws.com

# </details>
