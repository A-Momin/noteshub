-   [How to make your own VS Code theme!](https://www.youtube.com/watch?v=pGzssFNtWXw)
-   𝐔𝐬𝐞𝐟𝐮𝐥𝐥 𝑺𝒚𝒎𝒃𝒐𝒍𝒔: ⇧ ⮐ ⎇ ⌘ ⌥ + ⌃ + ⤶  ⤶ ⬋ ↩︎ ↲ ↵ ↫ ⭿ ♥ ★ → ➡️ ⬅️ ⬆︎ ⬇️
    -   `^ + ⌘ + Spaces` → get Emoji from MacOS

<details>
<summary style="font-size:25px;color:Orange;text-align:left">Notes Link</summary>

-   [RemoteDev: Develop from anywhere with Visual Studio Code](https://www.youtube.com/watch?v=CYObXaSjj78)
</details>

### TWEAK SETTINGS:

-   `~/Library/Application\ Support/Code/User/settings.json` → Path for VSC `settings.json` file

-   `⌘ + ⇧ + P`
    -   🔥search: `setting`; Select: `Open Workspace Setting (JSON)` → to create local workspace Settings? - python.terminal.activateEnvironment": true
    -   search: `key mapping`; Select: `Inspect key mapping` → to inspect key-mapping file.
    -   search: `keyboard shortcut`; Select: `Open Default keyboard shortcut (JSON)` → to inspect shortcut file.
    -   search: `user snippet`; Select: `configure user snippet` → to configure user snippets.
        -   Project wise user's snippet are saved in `.vscode` folder

### USEFULL PATH OF FILES AND FOLDERS on MACOS

-   ~/Library/Application\ Support/Code/User/settings.json
-   ~/Library/Application\ Support/Code/User/keybindings.json
-   ~/Library/Application\ Support/Code/User/snippets

<details>
<summary style="font-size:25px;color:Orange;text-align:left">USEFULL SHORTCUTS</summary>

#### How to find differences between two files?

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
-   `⌘ + ,` → Setting
-   `⌘ + ⇧ + P` → Open command palette
-   `⌘ + ⇧ + P <file util>` → Open command palette
-   `⌘ + b` → Toggle side bar
-   `⌘ + ⇧ + e` → Jump between Editor and Explorer
-   `⌘ + ⇧ + x` → Search for Extentions
-   `⌘ + ,` → Open the default settings json-file for VSCode.
-   `⌘ + j` → Togle between integrated terminal and Editor.
-   `⌘ + k + r` → OPEN KEYBOARD SHORTCUTS Reference.
-   `⌘ + k + s` → Open shortcuts-binding.
-   `⌘ + k + t` → Toggle between themes.
-   `⌘ + k + m` → Options to choose among various keymaps.
-   `⌘ + ⇧ + O` → Allow open various symbol
-   To get Emoji (🏠)
    -   `⌘ + ⇧ + P` → Search: 'insert unicode'; Select: Desired Emoji: Press `⮐`
    -   `^ + ⌘ + Spaces` → Open Emoji
-   Open Default Keybinding (JSON) file:
    -   `⌘ + ⇧ + P` -> type 'Default Keybinding' ↦ ⮐
-   Transform to lowercase, UPPERCASE and titlecase selected text.
    -   `⌘ + ⇧ + P`; Select: 'transform to UPPERCASE/lowercase/titlecase' ↦ ⮐
-   Transform indentation to Spaces.
    -   `⌘ + ⇧ + P` ↦ type 'ndentationToSpaces' ↦ ⮐
-   Transform indentation to Tab. - `⌘+⇧+P` type 'indentationToTabs' ↦ ⮐
</details>

<details>
<summary style="font-size:25px;color:Orange;text-align:left">Windows OS</summary>
    
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

-   How to search a kewword across multiple files?
    -   clicking select the folder of the files you want to serch of
    -   `⌘+⬆︎+f`
    -   put the kew word into the search box to search
