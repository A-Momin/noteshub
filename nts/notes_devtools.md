- **𝑺𝒚𝒎𝒃𝒐𝒍𝒔**: ⌘ ⌥ + ⌃ + ⤶ ⇧  ⤶ ⬋ ↩︎ ↲ ↵ ↫ ⭿ ♥ ★ 🎾 & 🔹

---

- <details><summary style="font-size:25px;color:Orange"> Software Version System </summary>

    Software versioning is a system of assigning unique identifiers (version numbers) to different releases of a software product. These versions help in tracking changes, managing updates, and ensuring compatibility.

    #### Versioning Schemes
    - **Semantic Versioning (SemVer)**: Uses a structured `MAJOR.MINOR.PATCH` format:
        - **MAJOR** (`X.0.0`) → Increments when there are breaking changes.
            - `1.0.0` → Initial stable release
            - `2.0.0` → Breaking changes introduced
        - **MINOR** (`1.X.0`) → Increments when new features are added in a backward-compatible manner.
            - `1.1.0` → Added new feature (backward-compatible)
        - **PATCH** (`1.0.X`) → Increments when bug fixes and minor improvements are made.
            - `1.1.1` → Bug fix release

    - **Date-Based Versioning**: Uses the release date as the version number, typically `YYYY.MM.DD` or `YYYY.R` (where `R` is the release number for that year). Example: `2024.1`, `2024.02.15`
    - **Incremental Versioning**: Uses a simple incremental number (`1`, `2`, `3`, etc.). Example: Windows 10, Windows 11

    #### Versioning Terminology
    - **Pre-Release Versions**: These are versions released before the final stable version and usually include experimental or test features.
        - **Alpha (`alpha`)** → Very early-stage, unstable version for internal testing. Example: `1.0.0-alpha.1`
        - **Beta (`beta`)** → More stable than Alpha, but still under development. Example: `1.0.0-beta.2`
        - **Release Candidate (`rc`)** → A version that is almost final, pending last-minute testing. Example: `1.0.0-rc.1`

    - **Stable Release**: Official, fully tested version ready for production use. Example: `1.0.0`
    - **Long-Term Support (LTS)**: A version supported for a longer period with security and bug fixes. Example: `Node.js 18 LTS`
    - **Hotfix**: A minor release to fix a critical issue. Example: `1.0.1`
    - **Deprecated Version**: A version that is no longer supported and should not be used.

    #### Other Versioning Concepts
    - **Backward Compatibility** → New versions work with older data or APIs.
    - **Forward Compatibility** → Older versions can work with new data or APIs.
    - **Rolling Release** → Continuous software updates without distinct version numbers (e.g., Arch Linux).

    </details>

---

- <details><summary style="font-size:25px;color:Orange">Maven</summary>
    - **📘 What is Maven?**
        - Apache Maven is a **build automation and project management tool** primarily for **Java** projects.
        - It uses an XML file called `pom.xml` to describe the project’s structure, dependencies, build steps, and plugins.
        - Simplifies:
            - Dependency management
            - Build lifecycle
            - Project structure
            - Documentation and reporting
            - CI/CD integration

    - **📁 Project Object Model (POM)**: The `pom.xml` file is the core of any Maven project. Key elements:
        - `<project>`: Root element
        - `<modelVersion>`: POM version (usually 4.0.0)
        - `<groupId>`: Project group (e.g., `com.capitalone`)
        - `<artifactId>`: Project/module name
        - `<version>`: Artifact version
        - `<packaging>`: Type (`jar`, `war`, `pom`)
        - `<name>`: Project name
        - `<description>`: Project description

    - **Artifact**:
        - A packaged output (e.g., `.jar`, `.war`, `.pom`)
        - Identified by `groupId`, `artifactId`, and `version`
        - Example: `com.capitalone:my-app:1.0`

    - **Dependency**:
        - Libraries required for compile/run time
        - Declared in the `<dependencies>` section
        - Example:

        ```xml
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-core</artifactId>
            <version>5.3.9</version>
        </dependency>
        ```

    - **Repository**:
        - **Local**: `~/.m2/repository`
        - **Remote**: Maven Central
        - **Private/Internal**: Nexus, Artifactory

    - **Plugin**: Adds functionality such as compiling, testing, packaging, etc.
        - Examples: `maven-compiler-plugin`, `maven-surefire-plugin`, `maven-assembly-plugin`

    - **Goals**: A specific task provided by a plugin

        ```bash
        mvn compiler:compile
        ```

    - **Phases (Build Lifecycle)**: Default phases include:
        - `validate`, `compile`, `test`, `package`, `verify`, `install`, `deploy`
        - Run using:

        ```bash
        mvn clean install
        ```

    - **Lifecycle**: Built-in lifecycles:
        - `default`: build
        - `clean`: cleanup
        - `site`: documentation

    - **Profiles**: Custom environment-specific configurations

        ```xml
        <profiles>
            <profile>
            <id>dev</id>
            <properties>
                <env>development</env>
            </properties>
            </profile>
        </profiles>
        ```

        - Run using:

        ```bash
        mvn install -Pdev
        ```

    - **Parent and Inheritance**: Enables project inheritance

        ```xml
        <parent>
            <groupId>com.capitalone</groupId>
            <artifactId>base-project</artifactId>
            <version>1.0</version>
        </parent>
        ```

    - **Multi-Module Projects**: Define a parent project with child modules

        ```xml
        <modules>
            <module>service-api</module>
            <module>service-impl</module>
        </modules>
        ```

    - **🛠️ Maven Commands Cheat Sheet**
        - `mvn clean`: Delete the `target/` folder
        - `mvn compile`: Compile source code
        - `mvn test`: Run unit tests
        - `mvn package`: Create `.jar`/`.war`
        - `mvn install`: Save artifact in local repo
        - `mvn deploy`: Upload artifact to remote repo
        - `mvn dependency:tree`: Show dependency tree
        - `mvn site`: Generate documentation site
        - `mvn versions:display-dependency-updates`: Show outdated dependencies

    - **🧩 Plugin Example: Compiler Plugin**: Sample configuration:

            ```xml
            <build>
            <plugins>
                <plugin>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.1</version>
                <configuration>
                    <source>1.8</source>
                    <target>1.8</target>
                </configuration>
                </plugin>
            </plugins>
            </build>
            ```

    - **🔄 Maven vs Gradle**: Comparison table:

            | Feature        | Maven                  | Gradle                       |
            | -------------- | ---------------------- | ---------------------------- |
            | Syntax         | XML (`pom.xml`)        | Groovy/Kotlin DSL            |
            | Performance    | Slower                 | Faster (incremental builds)  |
            | Learning Curve | Beginner-friendly      | More flexible, steeper curve |
            | Convention     | Convention over config | Highly customizable          |

    - **🧠 Best Practices**
        - Lock versions to avoid unexpected upgrades
        - Use plugins instead of shell scripts
        - Clean before building (`mvn clean install`)
        - Separate build and deployment logic
        - Use profiles for environment configuration

    - **🔒 Maven for Enterprise (Security/Compliance)**
        - Use internal repositories (e.g., Nexus, Artifactory)
        - Enable checksum verification
        - Scan transitive dependencies for vulnerabilities
        - Tools:
            - OWASP Dependency Check
            - Snyk
            - SonarQube

    </details>

---

- <details><summary style="font-size:25px;color:Orange">NPM (Node Package Manager)</summary>
    - **NPM Sub Tools**:
        - eslint --init
    - **NodeJS Global Packages**: ~/../../usr/local/lib/node_modules/
    - **documentation**: https://docs.npmjs.com/cli-documentation/

    - `$ npm install npm@latest -g` → to upgrade npm into latest version
    - `$ npm help` →
    - `$ npm install -h` → Display different way to use the 'specified' (`install` in this case) command
    - `$ npm <command> -h` → quick help on <command>
    - `$ npm update -h` → Display the documentation for the 'specified' (update) ttext
    - `$ npm help-search update` → Allow you search the npm documentation for the 'specified' (update in this case) text.
    - `$ npm init -yes` →
    - `$ npm config list -l` →
    - `$ npm config set init-author-name "Aminul Momin"` →
    - `$ npm config get init-author-name` →
    - `$ npm set init-license "MIT"` →
    - `$ npm config delete init-license` →
    - `$ npm config delete init-author-name` →
    - `$ npm install moment` → install moment package
    - `$ npm install moment --save` → install moment package adding the package name (moment) into the 'dependencies', aka production dependency list, of 'package.json' file.
    - `$ npm install moment -g` → install moment package globaly.

    #### aliases: remove, rm, r, un, unlink
    - `$ npm uninstall moment` → uninstall moment package WITHOUT removing its record from package.json file
    - `$ npm uninstall moment --save` → uninstall moment package WITH removing its record from package.json file
    - `$ npm uninstall moment -g` → uninstall moment package globally.
    - `$ npm un moment -g` →
    - `$ npm remove moment -g` →
    - `$ npm rm moment -g` →

    - `$ npm install lodash --save-dev` → install lodash package adding the package-name (lodash) into the 'devDependency', aka development dependency list, of 'package.json' file.
    - `$ npm uninstall lodash --save-dev` → uninstall lodash package WITH removing its record from package.json file

    - `$ npm list` → List out the LOCALLY installed packages.
    - `$ npm list --depth 1` →
    - `$ npm list --depth 0` →
    - `$ npm list --global true --depth 0` → List out the GLOBALLY installed packages.

    - `$ npm install lodash@3.3.0` → install lodash with exact version
    - `$ npm install lodash@4.14` → install lodash with exact major and minor but latest patch versions.

    - `$ npm install ^4.14.1` → install latest minor and patch version leaving major version as it is.
    - `$ npm install ~4.14.1` → install latest patch version leaving major and minor version as it is.
    - `$ npm install 4.14.1` → install as it is.
    - `$ npm install *` → install latest version irespective to major, minor or patch

    - `$ npm update lodash --save` → update the 'specified' (lodash) package to latest available version
    - `$ npm update --dev --save-dev` → update just the dev dependencies
    - `$ npm update` → update all dev and production dependencies
    - `$ npm update -g` → update all global packages.
    - `$ npm update -g  gulp` → update gulp packages globaly.

    </details>

---

- <details><summary style="font-size:25px;color:Orange">dig</summary>
    - `$ dig server name type`
    - `$ vim /ete/resolve.conf` → config file that lists prefarable name server to look up to.
    - `8.8.8.8` is a IP address of DNS server owned by Google
    - `$ whois harnesstechtx.com`

    - `$ dig @8.8.8.8 harnesstechtx.com ANY` → Querying the Google DNS server (`8.8.8.8`) for any DNS record related to the domain `harnesstechtx.com`

    - **Reverse DNS look up**: Reverse DNS lookup (rDNS) is the process of determining the domain name associated with an IP address — the opposite of a standard DNS (forward) lookup, which finds the IP address for a given domain.
        - `$ dig -x 8.8.8.8` → Reverse DNS Lookup.

    ##### `dig` Commands
    - `$ dig harnesstechtx.com` → Basic DNS Lookup for A Record (IPv4)
    - `$ dig harnesstechtx.com A` → A Record (IPv4)
    - `$ dig harnesstechtx.com AAAA` → AAAA Record (IPv6)
    - `$ dig harnesstechtx.com MX` → MX Record (Mail Servers)
    - `$ dig harnesstechtx.com NS` → NS Record (Name Servers)
    - `$ dig www.harnesstechtx.com CNAME` → CNAME Record
    - `$ dig harnesstechtx.com TXT` → TXT Record (SPF, DKIM, etc.)
    - `$ dig harnesstechtx.com SOA` → SOA Record (Start of Authority)
    - `$ dig harnesstechtx.com ANY` → List All Record Types. `ANY` queries are rate-limited by many DNS servers.

    - `$ dig -x 8.8.8.8` → Reverse DNS Lookup
    - `$ dig @8.8.8.8 harnesstechtx.com` → Use a Specific DNS Server
    - `$ dig harnesstechtx.com +short` → short Output (Simplified Output)
    - `$ dig harnesstechtx.com +trace` → trace (Full resolution path like `nslookup -d2`)
    - `$ dig harnesstechtx.com +noall +answer` → nocmd +noquestion +nocomments +nostats (Clean Output)
    - `$ dig harnesstechtx.com +ttlunits` → Check TTLs (Time to Live)
    - `$ dig harnesstechtx.com +dnssec` → Check DNSSEC (if supported)
    - `$ dig +nocmd harnesstechtx.com any +multiline +answer` → Gives a nice overview of the domain with details.

    ##### `dig` Commands Common Parameters
    - **`+short`**: Displays only the final answer with no additional metadata.
    - **`+trace`**: Traces the entire DNS resolution path, from the root servers down to the authoritative nameservers.
    - **`+noall`**: Suppresses all default sections of the output.
    - **`+answer`**: Displays only the answer section of the DNS response.
    - **`+ttlunits`**: Makes the TTL (Time To Live) in responses easier to read by displaying units (e.g., 1h, 2m, 30s).
    - **`+nocmd`**: Suppresses the initial command display (e.g., version info, command used).
    - **`+multiline`**: Formats the output in multiple lines for easier reading, especially for complex records (e.g., DNSKEY, TXT, RRSIG).
    - **`+dnssec`**: Requests DNSSEC-related records (like RRSIG). If DNSSEC is supported for the domain, you’ll see digital signatures.

    ##### How to interpret output retured by `dig` command
    - `$ dig @8.8.8.8 harnesstechtx.com ANY` → querying the **Google DNS server (8.8.8.8)** for **any DNS record** related to the domain `harnesstechtx.com`. Here's a **breakdown of the output** and what each part means:
    - `; <<>> DiG 9.10.6 <<>> @8.8.8.8 harnesstechtx.com ANY` → **Command + Header**: You're using `dig` version 9.10.6, querying `8.8.8.8` for **any** record type of the domain `harnesstechtx.com`.

    - `;; ->>HEADER<<- opcode: QUERY, status: NXDOMAIN, id: 19885` → **Got Answer**:
        - **opcode: QUERY** — a standard DNS query
        - **status: NXDOMAIN** —> No such domain exists. This means `harnesstechtx.com` does not exist in the DNS — not even as a parked or configured domain.
        - **id: 19885** — query ID (used internally)

    - `flags: qr rd ra;`
        - `qr`: this is a response
        - `rd`: recursion desired
        - `ra`: recursion available (Google’s DNS supports recursive queries)

    - **QUESTION SECTION**: You asked for any type (`ANY`) of DNS records (A, MX, TXT, etc.) for `harnesstechtx.com`.

        ```dns
        ;; QUESTION SECTION:
        ;harnesstechtx.com.		IN	ANY
        ```

    - **AUTHORITY SECTION**: This indicates that **no DNS records exist** for `harnesstechtx.com`, and instead you're getting the **Start of Authority (SOA)** for the `.com` TLD.

        ```dns
        ;; AUTHORITY SECTION:
        com.	900	IN	SOA	a.gtld-servers.net. nstld.verisign-grs.com. ...
        ```

        - It’s returned as a fallback to indicate that “The domain you're querying does not exist, but here’s the authority server for the `.com` zone.”

    - **Additional Section**

        ```dns
        ;; OPT PSEUDOSECTION:
        ; EDNS: version: 0, flags:; udp: 512
        ```

        - Related to **EDNS0**, an extension to DNS for additional capabilities (e.g., DNSSEC).
        - Not relevant to the lack of results.

    - **Query Metadata**

        ```
        ;; Query time: 27 msec
        ;; SERVER: 8.8.8.8#53(8.8.8.8)
        ;; WHEN: Sat May 03 11:09:59 CDT 2025
        ;; MSG SIZE  rcvd: 119
        ```

        - **Query time**: How long the lookup took (27 ms)
        - **SERVER**: Which DNS server responded (Google DNS 8.8.8.8)
        - **WHEN**: Date and time of the query
        - **MSG SIZE**: Size of the DNS response

    - **How to Verify**

    - `$ whois harnesstechtx.com`
        - If it returns No match for "HARNESSTECHTX.COM" Then the domain is unregistered.

    </details>

---

- <details><summary style="font-size:25px;color:Orange">yq</summary>
    - `$ brew install yq`
    - `$ yq 'explode(.)' file_name.yml > explode_file_name.yml`
    - `$ yq . file.yaml` → Pretty-prints the content of `file.yaml`.
    - `$ yq '.name' file.yaml` → Extracts the value of the `name` key from the YAML document.
    - `$ yq '.user.email' file.yaml` → Extracts the `email` field nested under the `user` object.
    - `$ yq '.users[] | select(.active == true)' file.yaml` → Filters and shows elements in `users` array where `active` is `true`.
    - `$ yq '.users[].email' file.yaml` → Lists the `email` of each user in the `users` array.
    - `$ yq '.users | length' file.yaml` → Outputs the number of elements in the `users` array.
    - `$ yq '.age = 30' file.yaml` → Sets the `age` field to `30` in the YAML document.
    - `$ yq '{name: .name, email: .email}' file.yaml` → Constructs a new object with only `name` and `email` fields.
    - `$ yq 'keys' file.yaml` → Lists all top-level keys in the YAML document.
    - `$ yq '.users[] | [.name, .email] | @csv' file.yaml` → Lists each user's name and email as comma-separated strings (requires `--tojson` + `jq` or script workaround in native `yq`).
    - `$ yq 'flatten' file.yaml` → Flattens nested arrays (only applicable if input structure supports it).
    - `$ curl -s https://example.com/data.yaml | yq '.items[].id'` → Fetches remote YAML and extracts the `id` from each `items` entry.
    - `$ yq 'del(.password)' file.yaml` → Removes the `password` field from the YAML document.
    - `$ yq '.foo?.bar?.baz' file.yaml` → Safely navigates nested keys, returning `null` if any key is missing (requires `yq` v4+).

    - `$ `
    - `$ `
    - `$ `

    </details>

---

- <details><summary style="font-size:25px;color:Orange">jq</summary>
    - `$ jq -r .access_token`
    - `$ cat file.json | jq .` → Pretty-prints the JSON content of `file.json` for easier reading.
    - `$ jq '.name' file.json` → Extracts and displays the value of the `name` key from the JSON object.
    - `$ jq '.user.email' file.json` → Extracts the `email` field nested under the `user` object.
    - `$ jq '.users[] | select(.active == true)' file.json` → Filters and shows user objects where the `active` field is `true`.
    - `$ jq '.users[] | .email' file.json` → Extracts and lists the `email` field from each object in the `users` array.
    - `$ jq '.users | length' file.json` → Returns the number of items in the `users` array.
    - `$ jq '.age = 30' file.json` → Updates (or sets) the `age` field to `30` in the JSON object.
    - `$ jq '{name: .name, email: .email}' file.json` → Constructs and outputs a new object with only `name` and `email` fields.
    - `$ jq 'keys' file.json` → Lists all the top-level keys in the JSON object.
    - `$ jq -r '.users[] | [.name, .email] | @csv' file.json` → Outputs name and email of each user as comma-separated values, without quotes around the output.
    - `$ jq 'flatten' file.json` → Flattens nested arrays into a single-level array.
    - `$ curl -s https://api.example.com/data | jq '.items[] | .id'` → Fetches JSON from an API and lists the `id` field of each object in the `items` array.
    - `$ jq 'del(.password)' file.json` → Deletes the `password` field from the JSON object.
    - `$ jq '.foo?.bar?.baz' file.json` → Safely tries to access a deeply nested field, returning `null` if any intermediate key is missing.

    </details>

---

- <details><summary style="font-size:25px;color:Orange">parquet</summary>
    - `$ pip install parquet`

    </details>

---

- <details><summary style="font-size:25px;color:Orange">pre-commit</summary>
    - `$ `
    - `$ pip install pre-commit` -> Install `pre-commit`
    - `$ pre-commit install` -> Install the hooks
    - `$ pre-commit run --all-files` -> Run it manually (optional)

    - Here’s a sample `.pre-commit-config.yaml` configuration file tailored for a **Python project**. It includes commonly used hooks like `black`, `flake8`, `isort`, `mypy`, and more:

    ```yaml

    repos:

        -   repo: https://github.com/psf/black
            rev: 24.3.0
            hooks:

            -   id: black
                language_version: python3
                name: Format Python
                exclude: |
                ^data/|^migrations/

        -   repo: https://github.com/pre-commit/mirrors-flake8
            rev: v6.1.0
            hooks:

            -   id: flake8
                additional_dependencies: [flake8-bugbear]

        -   repo: https://github.com/pre-commit/mirrors-isort
            rev: v5.12.0
            hooks:

            -   id: isort
                language_version: python3

        -   repo: https://github.com/pre-commit/mirrors-mypy
            rev: v1.9.0
            hooks:

            -   id: mypy
                additional_dependencies: [types-requests]
                language_version: python3

        -   repo: https://github.com/pre-commit/pre-commit-hooks
            rev: v4.4.0
            hooks:

            -   id: check-added-large-files
            -   id: check-merge-conflict
            -   id: end-of-file-fixer
            -   id: trailing-whitespace

        -   repo: https://github.com/asottile/pyupgrade
            rev: v3.15.0
            hooks:

            -   id: pyupgrade
                args: [--py39-plus] # Match your Python version

        -   repo: local
            hooks:

            -   id: pylint
                name: "Check Python"
                description: Pylint hook for this sfecific virtualenv.
                entry: pipenv run pylint
                language: python
                types: [python]
            -   id: yamllint
                name: "Check YAML"
                description:
                entry: pipenv run yamllint
                language: python
                types: [yaml]
            -   id: pytest
                name: "Run Unit Tests"
                description: :Run all unit tests in the tests directory
                entry: pipenv run pytest -svv ./tests
                language: python
                types: [python]
                always_run: true
                files: .\*
                pass_filenames: false

        -   repo: https://github.com/Yelp/detect-secrets
            rev: v1.4.0
            hooks:

            -   id: detect-secrets
                args: ["scan", "--baseline", ".secrets.baseline"]
    ```

    </details>

---

- <details><summary style="font-size:25px;color:Orange">make</summary>

    - `$ brew install make`

    -   `make` is a command-line utility in Linux and other Unix-like operating systems that is used to build and manage software projects. It automates the process of compiling source code, linking object files, and creating executables and libraries. The basic idea behind make is that it reads a set of instructions, called a `Makefile`, that describe how to build the project. The `Makefile` specifies a set of targets, dependencies, and commands that make can use to build the project.
    -   A `Makefile` is a text file that contains a set of rules that tell make how to build a software project. Each rule defines a target, which is the name of the file that make should create, and a set of dependencies, which are the files that the target depends on. The rule also specifies a set of commands that make should execute to build the target.

    #### Terms and Components around `make`

    | Component       | Description                                 |
    | --------------- | ------------------------------------------- |
    | `Target`        | What you want to build or run               |
    | `Dependency`    | Files or targets required before execution  |
    | `Recipe`        | Shell commands that build or run something  |
    | `Makefile`      | File that defines targets, rules, variables |
    | `Variable`      | Name-value pairs used in recipes            |
    | `Automatic Var` | Special variables (`$@`, `$<`, `$^`, etc.)  |
    | `Phony Target`  | Label for tasks, not related to a file      |


    #### Targets

    - A _target_ is usually a filename or a label for a task.
    - It defines what should be built or what action should be performed.

    ```makefile
    # Here, `build` is the target.
    build:
        echo "Building project"
    ```

    #### Dependencies (Prerequisites)

    - **dependencies** (also called **prerequisites**) are **files or targets** that a given rule relies on to determine whether it needs to be executed. They form the foundation of how `make` determines **what to build** and **when** to rebuild it.

    - **Terminology**
        - In a `Makefile`, a rule has the following structure:

            ```makefile
            target: dependencies
                commands
            ```

        - `target`: The file or output you want to create.
        - `dependencies`: Files that the target depends on.
        - `commands`: The shell commands used to build the target.

        - If any of the **dependencies have a more recent modification time** than the `target`, then `make` considers the target **outdated** and will run the associated `commands`.

            ```makefile
            main.o: main.c defs.h
                gcc -c main.c -o main.o
            ```

            - `main.o` is the target.
            - `main.c` and `defs.h` are dependencies.
            - If `main.c` or `defs.h` changes, `make` will recompile `main.c`.

    - **How Make Uses Dependencies**: When you run `make`, it:
        - Checks if the `target` file exists.
        - If not, it runs the rule's commands.
        - If the target **exists but is older** than any of its dependencies, it rebuilds the target.
        - If the target is **newer than all** its dependencies, it does nothing.

    - **Chained Dependencies**: Dependencies can have their own dependencies, creating a **dependency tree**.

        ```makefile
        my_program: main.o utils.o
            gcc main.o utils.o -o my_program

        main.o: main.c
            gcc -c main.c -o main.o

        utils.o: utils.c
            gcc -c utils.c -o utils.o
        ```

        - If `utils.c` changes:
            - `make` rebuilds `utils.o`, then relinks `my_program`.

    - **File Dependencies**
        - Standard files like `.c`, `.h`, `.py`, `.txt`, etc.

    - **Target Dependencies**
        - When a dependency is itself a `make` target.

        ```makefile
        all: compile run

        compile:
            echo "Compiling..."

        run:
            echo "Running..."
        ```

    - **Generated Files**
        - Dependencies that are created by another rule.

    - **Phony Targets (Non-file Dependencies)**
        - Sometimes, the target is not a real file. For example:

        ```makefile
        .PHONY: clean

        clean:
            rm -f *.o my_program
        ```

        - Here, `clean` has no dependencies. It's a command wrapper.

    #### Recipes

    - A recipe is a set of shell commands that `make` runs to build a target.
    - Each line is executed in a new shell.

    ```makefile
    install:
        pip install -r requirements.txt
    ```

    #### Makefile

    - The file named `Makefile` (or `makefile`) contains all the targets, dependencies, and recipes.
    - This is the instruction file that `make` reads.

    #### Variables

    - Variables store reusable values (e.g., compiler names, flags).

    ```makefile
    CC=gcc
    CFLAGS=-Wall

    build:
        $(CC) $(CFLAGS) -o myapp main.c
    ```

    #### Automatic Variables

    - **automatic variables** are special variables that are **automatically populated** by `make` during the execution of rules. They allow you to **reference information about the target, dependencies, and commands** without having to hard-code values — making your `Makefile` more concise, dynamic, and reusable.
    - Special variables provided by `make` for use inside recipes:

        | Variable | Meaning                                                     |
        | -------- | ----------------------------------------------------------- |
        | `$@`     | The **target** name of the rule.                            |
        | `$%`     | The target member name, when the target is an archive file. |
        | `$<`     | The **first** prerequisite (dependency).                    |
        | `$^`     | **All** prerequisites, with duplicates **removed**.         |
        | `$+`     | All prerequisites, including **duplicates**.                |
        | `$?`     | All prerequisites that are **newer** than the target.       |
        | `$*`     | The **stem** matched by a pattern rule (`%`).               |

    - `$@` — Target Name

        ```makefile
        output.txt: input.txt
            cp $< $@
        ```

        ```sh
        cp input.txt output.txt
        ```

    - `$<` — First Dependency

        ```makefile
        main.o: main.c
            gcc -c $< -o $@
        ```

        ```sh
        gcc -c main.c -o main.o
        ```

    - `$^` — All Unique Dependencies

        ```makefile
        program: main.o util.o
            gcc $^ -o $@
        ```

        ```sh
        gcc main.o util.o -o program
        ```

    - `$+` — All Dependencies (with duplicates)

        ```makefile
        example: a.o a.o
            echo $+
        ```

        ```sh
        echo a.o a.o
        ```

    - `$?` — Only Newer Dependencies

        ```makefile
        # This will only echo files that have a **timestamp newer** than `build`.
        build: file1.c file2.c
            @echo "Changed files: $?"
        ```

    - `$*` — Pattern Stem (useful in pattern rules)

        ```makefile
        # If invoked for `main.o`, `$*` is `main`.
        %.o: %.c
            gcc -c $< -o $@
        ```

    #### Pattern Rules

    - Define generic build instructions using wildcards.

    ```makefile
    %.o: %.c
        gcc -c $< -o $@
    ```

    #### Phony Targets

    - These are not actual files. They're used for task-like commands (e.g., `clean`, `test`).

    ```makefile
    .PHONY: clean

    clean:
        rm -rf *.o myapp
    ```

    #### Sample `Makefile`

    </details>

---

- <details><summary style="font-size:25px;color:Orange">Slack</summary>
    - <details><summary style="font-size:20px;color:#FF1493">Common Slack emojis and their Shortcuts</summary>

        • `:Thumbs up` → 👍 "Thumbs up": Expresses agreement, acknowledgment, or "got it."
        • `:Check mark` → ✅ "Check mark": Shows a task is complete or a request has been acknowledged.
        • `:Fire` → 🔥 "Fire": Signifies enthusiasm, excitement, or high praise.
        • `:emoji_name` → 👀 "Eyes": Indicates someone is looking at a message or task, or needs to get back to it.
        • `:emoji_name` → 💯 "100": Indicates perfection, outstanding work, or a job well done.
        • `:emoji_name` → 🤔 "Thinking face": Encourages reflection, invites collaboration, or shows someone is pondering.
        • `:emoji_name` → 🙌 "Raised hands": Celebrates success, expresses excitement, or acknowledges a team effort.
        • `:emoji_name` → 👏 "Clap": Offers praise, appreciation, or acknowledges a job well done.
        • `:emoji_name` → 😀 "Smiley face": Creates a welcoming atmosphere, expresses happiness, or shows agreement.
        • `:emoji_name` → 👋 "Wave": Greets colleagues, acknowledges messages, or expresses a friendly gesture.
        • `:emoji_name` → 😂 "Laughing face with tears": Expresses humor or strong agreement.
        • `:emoji_name` → 🙏 "Folded hands": Requests help or expresses gratitude.
        • `:emoji_name` → ❤️ "Red heart": Expresses love or affection.
        • `:emoji_name` → ✨ "Sparkles": Adds excitement or highlights something special.
        • `:emoji_name` → 🤯 "Exploding head": Indicates astonishment, surprise, or excitement.
        • `:emoji_name` → 🙏 "Praying hands": Expresses gratitude, appreciation, or a request.
        • `:emoji_name` → 🎉 "Party popper": Celebrates something, expresses enthusiasm, or marks an accomplishment.
        • `:emoji_name` → 🤔 "Thinking face": Indicates a question, a need for clarification, or someone is pondering.
        • `:emoji_name` → ✨ "Sparkles": Adds a bit of flair or excitement.
        • `:emoji_name` → ⏰ "Alarm clock": Often used to indicate a deadline or reminder.
        • `:emoji_name` → 💡 "Lightbulb": Suggests an idea or inspiration.
        • `:emoji_name` → 🚦 "Traffic light": Can be used to indicate the status of a project or task.
        • `:emoji_name` → 🚀 "Rocket": Can be used to indicate a launch or the start of a project.
        • `:emoji_name` → ⚙️ "Gear": Can be used to indicate work or processes.
        • `:emoji_name` → 🚧 "Construction site": Can be used to indicate an issue or a project in progress.
        • `:emoji_name` → ⚠️ "Warning sign": Can be used to indicate a potential problem or a warning.
        • `:emoji_name` → 🛑 "Stop sign": Can be used to indicate a halt or a pause.
        • `:emoji_name` → 🤔 "Thinking face": Can be used to indicate a question or a need for clarification.
        • `:emoji_name` → ❓ "Question mark": Can be used to indicate a question or a need for clarification.
        • `:emoji_name` → 🔴 "Red circle": Can be used to indicate an issue or a problem.
        • `:emoji_name` → 🟢 "Green circle": Can be used to indicate a successful completion or a positive outcome.
        • `:emoji_name` → 🚫 "Prohibited": Can be used to indicate a negative or unacceptable status.
        • `:emoji_name` → 🚳 "Men's room": Can be used in the context of certain situations.
        • `:emoji_name` → 🚺 "Women's room": Can be used in the context of certain situations.
        • `:emoji_name` → ♾ "Infinity": Can be used to indicate an unlimited amount or situation.

        </details>

    #### 🙋‍♂️ Participation & Acknowledgment

    | Emoji                | Meaning                             |
    | -------------------- | ----------------------------------- |
    | `:wave:`             | 👋 Hello / Goodbye / I'm here       |
    | `:raised_hand:`      | ✋ I have a question / volunteering |
    | `:hand:`             | ✋🏽 Also a raised hand / hold on     |
    | `:eyes:`             | 👀 Looking into it / Monitoring     |
    | `:thumbsup:`         | 👍 Approved / Got it / Agree        |
    | `:white_check_mark:` | ✅ Task complete / Confirmed        |
    | `:ok_hand:`          | 👌 All good / Okay                  |

    #### 🔋 Energy & Availability

    | Emoji           | Meaning                              |
    | --------------- | ------------------------------------ |
    | `:low_battery:` | 🔋 Low energy / need a break         |
    | `:battery:`     | 🔋 Back online / charged up          |
    | `:zzz:`         | 😴 Logging off / AFK                 |
    | `:coffee:`      | ☕ Need coffee / early start / focus |
    | `:hourglass:`   | ⏳ Busy / heads-down work            |
    | `:soon:`        | 🔜 On it / Will respond soon         |

    #### 🧠 Status & Mood

    | Emoji             | Meaning                               |
    | ----------------- | ------------------------------------- |
    | `:thinking_face:` | 🤔 Considering / Evaluating something |
    | `:confused:`      | 😕 Need clarity / Not sure            |
    | `:nerd_face:`     | 🤓 Deep in dev / Learning mode        |
    | `:fire:`          | 🔥 High urgency / Great work          |
    | `:rocket:`        | 🚀 Shipping / Launching / Progress    |

    #### ✅ Feedback & Voting

    | Emoji                | Usage                           |
    | -------------------- | ------------------------------- |
    | `:heavy_plus_sign:`  | ➕ Add me / Add something       |
    | `:heavy_minus_sign:` | ➖ Remove me / Remove something |
    | `:x:`                | ❌ Disagree / Cancel            |
    | `:clap:`             | 👏 Applause / Appreciation      |
    | `:tada:`             | 🎉 Congrats / Celebrations      |

    #### 🖐 Special Custom (Popular in Tech Teams)

    | Emoji          | Meaning                                                          |
    | -------------- | ---------------------------------------------------------------- |
    | `:this:`       | ☝️ Agree with the message above (Slack default or custom with ↑) |
    | `:that:`       | 👇 Agree with the message below                                  |
    | `:eyes_on_me:` | 🔍 Review request / PR needs attention (custom)                  |
    | `:nope:`       | 🙅‍♂️ Not valid / Decline                                           |

    </details>

---

- <details><summary style="font-size:25px;color:Orange">Zoom</summary>

    | MacOS Commands | Achivements | Windows Commands |
    | :------------- | :---------- | :--------------- |
    | `⌘ + ⌥ + 5`    | 👍          | ----             |
    | `⌥ + y`        | ✋          | ----             |
    | ----           | ----        | ----             |

    <details>
