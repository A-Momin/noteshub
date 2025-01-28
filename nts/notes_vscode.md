-   [How to make your own VS Code theme!](https://www.youtube.com/watch?v=pGzssFNtWXw)
-   𝐔𝐬𝐞𝐟𝐮𝐥𝐥 𝑺𝒚𝒎𝒃𝒐𝒍𝒔: ⇧ ⮐ ⎇ ⌘ ⌥ + ⌃ + ⤶  ⤶ ⬋ ↩︎ ↲ ↵ ↫ ⭿ ♥ ★ → ➡️ ⬅️ ⬆︎ ⬇️

-   `^ + ⌘ + Spaces` → To get Emoji (🏠)
-   `^ + Spaces` → To get markdown snippet autocomplete.
-   `⌘ + ⇧ + O` → Allow open various symbol

<details><summary style="font-size:25px;color:Orange;text-align:left">Notes Link</summary>

-   [RemoteDev: Develop from anywhere with Visual Studio Code](https://www.youtube.com/watch?v=CYObXaSjj78)

</details>

### TWEAK SETTINGS:

-   `~/Library/Application\ Support/Code/User/settings.json` → Path for VSC `settings.json` file

-   `⌘ + ⇧ + P`
    -   🔥search: `setting`; Select: `Open Workspace Setting (JSON)` → to create local workspace Settings? - `python.terminal.activateEnvironment": true`
    -   search: `key mapping`; Select: `Inspect key mapping` → to inspect key-mapping file.
    -   search: `keyboard shortcut`; Select: `Open Default keyboard shortcut (JSON)` → to inspect shortcut file.
    -   search: `user snippet`; Select: `configure user snippet` → to configure user snippets.
        -   Project wise user's snippet are saved in `.vscode` folder

### USEFULL PATH OF FILES AND FOLDERS on MACOS

-   ~/Library/Application\ Support/Code/User/settings.json
-   ~/Library/Application\ Support/Code/User/keybindings.json
-   ~/Library/Application\ Support/Code/User/snippets

<details><summary style="font-size:25px;color:Orange;text-align:left">USEFULL SHORTCUTS</summary>

#### Shortcuts

-   `⌘ + ⇧ + f` → Search a patteren in multiple files.
-   🔥 `⌥ + z` → Toggle Wrap/Unwrap word of integrated terminal.
-   `⌘ + ⇧ + k` → Delete the line of code at the cursor.
-   `⌘ + x` → Cut the line of code at the cursor to paste somewhere else.
-   🔥 `⌘ + k + 0` → Fold code at the base indentation lavel
-   `⌥ + ⌘ + ]` → Fold code in the editor
-   `⌘ + k + j` → Unold code.
-   `⌘ + ⇧ + e` → Toggle between file explorer and editor.
-   `⌘ + ↓` → Collapse/Expend the folder in the file explorer
-   `→` → Expend the folder in the file explorer
-   `←` → Collapse the folder in the file explorer
-   `^ + Enter` → Open focused file from file explorer.
-   `fn + ^ + f5` → Run script
-   `⌘ + b` → Toggle side bar
-   `⌘ + ⇧ + e` → Jump between Editor and Explorer
-   `⌘ + j` → Togle between integrated terminal and Editor.
-   `⌘ + ⇧ + x` → Search for Extentions
-   `⌘ + k + m` → Options to choose among various keymaps.

#### Command Palette Search

-   `⌘ + ⇧ + P` -> Open the Command Palette
    -   Search:
        -   `filename` ↦ ⮐
        -   `insert unicode` ↦ ⮐ -> To get Unicode Characters
        -   `transform to UPPERCASE/lowercase/titlecase` ↦ ⮐
        -   `ndentationToSpaces` ↦ ⮐
        -   `indentationToTabs` ↦ ⮐
        -   `Profiles: Switch Profile` -> to Switch Between Profiles

#### Configuration Shortcuts

-   `⌘ + k + t` → Toggle between themes.
-   `⌘ + ,` → Open the default `settings.json`-file for VSCode.
-   `⌘ + ⇧ + P` -> type 'Default Keyboard Shortcuts (JSON)' ↦ ⮐
-   `⌘ + k + r` → OPEN KEYBOARD SHORTCUTS Reference.
-   `⌘ + k + s` → Open Keyboard Shortcuts.

</details>

<details><summary style="font-size:25px;color:Orange;text-align:left">Windows OS</summary>
    
- Keyboard Shortcut (`^ + k + s`):
    - Search: `View: Open Next/Previous Editor`; Set: `⌃ + ⎇ + ➡️` / `⌃ + ⎇ + ⬅️`.
    - Search: `cursorTop/cursorBottom`; Set: `⌃ + ⬆︎` / `⌃ + ⬇️`.
    - Search: `cursorTopSelect/cursorBottomSelect`; Set: `⌃ + ⇧ + ⬆︎` / `⌃ + ⇧ + ⬇️`.
    - Search: `cursorHomeSelect/cursorEndSelect`; Set: `⌃ + ⇧ + ⬅️` / `⌃ + ⇧ + ➡️`.
    - 
</details>

### MANAGE EXTENSIONS FROM COMMAND LINE

-   `$ code -help` → Print usage.
-   `$ code --install-extension <extension-id[@version] | path-to-vsix>` → Installs or updates an extension.
    -   The argument is either an extension id or a path to a VSIX.
    -   The identifier of an extension is '${publisher}.${name}'.
    -   Use '--force' argument to update to latest version. To install a specific version provide '@${version}'. For example: 'vscode.csharp@1.2.3'.
-   `$ code --list-extensions > list_vsc_extension.txt` → List out all the vscode extensions in the file, list_vsc_extension
-   `$ code --uninstall-extension <extension-id>` → Uninstalls an extension.
-   `$ code --disable-extensions` → Disable all installed extensions.
-   `$ code --disable-extension <extension-id>` → Disable an extension.
-   `$ code --extensions-dir <dir>` → Set the root path for extensions.

### MISC:

-   <b style="color:magenta;text-align:left">How to search a kewword across multiple files?</b>

    1.  select the folder/files (by clicking it) you want to serch of.
    2.  `⌘+⬆︎+f`
    3.  put the kew word into the search box to search

-   <b style="color:magenta;text-align:left">How to find differences between two files?</b>

    1.  `RightClick` on one file and `select: Select for Compare`
    2.  `RightClick` on the second file and `select: Compare with Selected`

<details><summary style="font-size:25px;color:Orange;text-align:left">what is a profile in Visual Studio Code?</summary>

A **profile** in **Visual Studio Code (VS Code)** is a feature that allows you to create and manage separate, customized configurations for your development environment. Profiles can include different settings, extensions, themes, keybindings, and UI layouts, making it easier to switch between different setups tailored for specific projects, workflows, or development needs.

---

#### **Key Features of Profiles in VS Code**

1. **Custom Settings**: Each profile can have its own unique configuration settings (e.g., font size, editor behavior, etc.).
2. **Extensions**: Profiles can have different sets of installed extensions, enabling you to install only what you need for a particular project or workflow.
3. **Keybindings**: Profiles allow customized keybinding configurations for different tasks or workflows.
4. **UI Customization**: You can adjust themes, icons, and layouts for each profile.
5. **Workspace-Specific Profiles**: Profiles can be linked to specific workspaces, making them automatically load when you open that workspace.

---

#### **Why Use Profiles?**

1. **Project-Specific Needs**: Different projects may require unique configurations or extensions (e.g., Python vs. JavaScript projects).
2. **Role-Specific Workflows**: Developers who switch between roles (e.g., frontend development, backend development, or DevOps) can maintain separate setups for each.
3. **Focus and Organization**: Minimize clutter by loading only the extensions and settings relevant to your current task or project.
4. **Personal and Team Use**: Share profiles with team members to maintain a consistent development environment across a team.

---

#### **How to Use Profiles in VS Code**

1. **Access Profiles**:

    - Open the Command Palette (`Ctrl+Shift+P` or `Cmd+Shift+P` on macOS).
    - Search for **"Profiles: Create Profile"**, **"Profiles: Switch Profile"**, or **"Profiles: Manage Profiles"**.

2. **Create a Profile**:

    - Choose "Create Profile" from the Command Palette.
    - Name your new profile and decide whether to start from scratch or use an existing configuration as a base.

3. **Switch Profiles**:

    - Use the **"Profiles: Switch Profile"** command to toggle between profiles.
    - Profiles are instantly loaded, updating your settings, extensions, and layout.

4. **Export/Import Profiles**:
    - You can export a profile to a JSON file and share it with others or import a shared profile into your own VS Code setup.

---

#### **Example Use Cases**

1. **Frontend Development Profile**:

    - Extensions: Prettier, ESLint, Tailwind CSS IntelliSense.
    - Settings: Auto-format on save, dark theme.
    - Keybindings: Shortcuts for web preview.

2. **Backend Development Profile**:

    - Extensions: Python, PostgreSQL, Docker.
    - Settings: Enable linting and debugging configurations.

3. **Writing or Documentation Profile**:
    - Extensions: Markdown Preview Enhanced, Spell Checker.
    - Settings: Increased font size for readability.

---

Profiles help make **VS Code** flexible and adaptable for a variety of workflows, letting you work efficiently across different projects and tasks.

</details>
