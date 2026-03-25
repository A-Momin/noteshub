| Verbs     | On   | Off  | in   | Out  | Up   | down | Away | over |
| :-------- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **carve** |      |      |      |      |      |      |      |      |
| **build** |      |      |      |      |      |      |      |      |
| **page**  |      |      |      |      |      |      |      |      |
| **cut**   |      |      |      |      |      |      |      |      |
| **Take**  |      |      |      |      |      |      |      |      |
| **Put**   |      |      |      |      |      |      |      |      |
| **Get**   |      |      |      |      |      |      |      |      |
| **Turn**  |      |      |      |      |      |      |      |      |
| **Give**  |      |      |      |      |      |      |      |      |
| **Look**  |      |      |      |      |      |      |      |      |
| **Call**  |      |      |      |      |      |      |      |      |
| **Hold**  |      |      |      |      |      |      |      |      |
| **Come**  |      |      |      |      |      |      |      |      |
| **Go**    |      |      |      |      |      |      |      |      |
| **Scale** |      |      |      |      |      |      |      |      |
| **Plan**  |      |      |      |      |      |      |      |      |
| **Stand** |      |      |      |      |      |      |      |      |
| **Sort**  |      |      |      |      |      |      |      |      |


Write an email to my apartment manager requesting pest control service mentioning all the following
concerns as well:

1. I have been paying for pest control for about 3 years, but I was never able to live in the unit without cockrose activities.
2. I got sick of requesting pest control service every week.
3. I do not like to queue up in the leasing office and request for pest control service every week.
4. if it's not gotten ride of cockrose activities in my unit in next two months, I will forced to leave the appartment.

---

Subject: Urgent: Formal Complaint Regarding Persistent Cockroach Infestation - Apt #3423

Dear Jennifer,

I am writing to formally request immediate and effective pest control service for my apartment, **#3423**. Despite my consistent reports over the last few years, the **cockroach infestation** in my unit remains a severe and unresolved issue.

I would like to bring the following points to your attention:

* **Long-term issue despite payments:** I have been paying for monthly pest control services for approximately **three years**. However, I have never been able to live in this unit without significant cockroach activity.
* **Exhaustion from repeated requests:** I am incredibly frustrated with having to request pest control treatment on a **weekly basis** with no lasting results.
* **Inconvenience of reporting:** It is a major burden to have to **queue up at the leasing office** every week just to request a service that I am already paying for and that should have resolved the issue by now.
* **Final notice:** If the cockroach activity in my unit is not completely eliminated within the **next two months**, I will be forced to **vacate the apartment** to ensure a habitable and sanitary living environment.



I expect a thorough, "heavy treatment" to be scheduled immediately to address this ongoing health and hygiene concern. Please confirm the date and time for this service as soon as possible.

Sincerely,

Aminul Momin
Apt # 3423 

---
---

To master **Poetry**, it’s best to build a project that utilizes its core strengths: dependency management, virtual environments, and packaging. We will build a "Weather CLI" application that fetches data from an API.

Here is the industry-standard structure and workflow.

---

## 1. Project Initialization

Instead of creating folders manually, let Poetry scaffold the project for you.

```bash
# Create a new project
poetry new weather-cli
cd weather-cli

```

**What this creates:**

* `pyproject.toml`: The heart of your project (replaces `setup.py` and `requirements.txt`).
* `weather_cli/`: The source code directory.
* `tests/`: A pre-configured test suite folder.

---

## 2. Managing Dependencies

Poetry makes adding libraries safer by resolving conflicts before installing.

### Adding a standard dependency

```bash
poetry add requests click rich

```

* `requests`: For API calls.
* `click`: To create the CLI interface.
* `rich`: For beautiful terminal output.

### Adding a development-only dependency

You don't need testing tools in production. Poetry handles this with **Groups**.

```bash
poetry add pytest black --group dev

```

---

## 3. The `poetry.lock` File

This is the most critical part of Poetry.

* **The Problem:** `requirements.txt` often leads to "it works on my machine" bugs because sub-dependencies change.
* **The Poetry Solution:** The `.lock` file records the **exact version** of every single package and sub-package.
* **Rule:** Always commit the `poetry.lock` file to Git.

---

## 4. Writing the Application

Create a file at `weather_cli/main.py`:

```python
import click
from rich.console import Console

console = Console()

@click.command()
@click.option('--city', default='Dallas', help='City to check weather for.')
def main(city):
    """A simple CLI to check the weather."""
    console.print(f"[bold blue]Checking weather for {city}...[/bold blue]")
    # In a real app, you'd call an API here
    console.print(f"The weather in [green]{city}[/green] is currently [bold]Sunny[/bold].")

if __name__ == "__main__":
    main()

```

---

## 5. Configuring Executables (Scripts)

One of Poetry's best features is the ability to create "binaries" or entry points automatically. Add this to your `pyproject.toml`:

```toml
[tool.poetry.scripts]
weather = "weather_cli.main:main"

```

Now, instead of typing `python weather_cli/main.py`, you can just run:

```bash
poetry install
poetry run weather --city "Plano"

```

---

## 6. Virtual Environment Mastery

Poetry manages environments so you don't have to deal with `venv` folders.

| Command                    | Purpose                                                                               |
| -------------------------- | ------------------------------------------------------------------------------------- |
| **`poetry shell`**         | Activates the virtual environment in your current terminal.                           |
| **`poetry env info`**      | Shows where the environment is stored on your disk.                                   |
| **`poetry run <command>`** | Runs a command (like `pytest`) inside the environment without activating it.          |
| **`poetry update`**        | Updates all packages to their latest compatible versions and refreshes the lock file. |

---

## 7. Packaging for Distribution

If you wanted to share this tool on PyPI (Python Package Index), Poetry handles the build process perfectly.

```bash
# Build the source distribution and wheel
poetry build

```

This generates a `dist/` folder containing your `.whl` and `.tar.gz` files, ready for upload.

### Summary Checklist for Learning

1. **Read the `pyproject.toml**`: Understand how `dependencies` differ from `dev` groups.
2. **Inspect the `lock` file**: See how it maps out the entire dependency tree.
3. **Try `poetry check**`: This validates your configuration for errors.
4. **Try `poetry export**`: If you ever need to go back to `requirements.txt`, run `poetry export -f requirements.txt --output requirements.txt`.

---
---




