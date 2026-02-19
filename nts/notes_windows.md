*   Explain _.exe, _.cmd, _.bat, _.ps1 files in great details
*   how to customize Windows CMD prompt
*   [Configure keyboard shortcut](https://www.youtube.com/watch?v=vEQe_Mt0BTM)

*   <details><summary style="font-size:25px; color: Orange">Windows Shortcuts</summary>

    1.  **The "Life Savers" (Essential Utility)**: These are the shortcuts everyone should know to navigate the OS quickly.
        - **`Win + V`**: **Clipboard History**. Instead of only pasting the _last_ thing you copied, this shows a list of everything you've copied recently. (You may need to click "Turn on" the first time).
        - **`Win + Shift + S`**: **Snipping Tool**. The fastest way to take a partial screenshot and draw on it or save it.
        - **`Ctrl + Shift + Esc`**: **Task Manager**. Opens it directly without needing to go through the `Ctrl + Alt + Del` screen.
        - **`Win + .` (Period)**: **Emoji & Symbol Picker**. Quickly insert emojis, GIFs, or mathematical symbols into any text field.
        - **`Win + L`**: **Lock PC**. Instantly locks your computer—essential for office or public settings.
    2.  **Window & Desktop Management**: Control your screen clutter like a pro.
        - **`Win + D`**: **Show/Hide Desktop**. Minimizes everything instantly. Press again to bring them all back.
        - **`Alt + Tab`**: **Switch Apps**. Hold `Alt` and tap `Tab` to cycle through open windows.
        - **`Win + Arrow Keys`**: **Snap Windows**. Snap the current window to the left, right, or corners to multi-task perfectly.
        - **`Win + Tab`**: **Task View**. Shows all open windows and allows you to create **Virtual Desktops** (great for separating "Work" from "Gaming").
        - **`Win + Ctrl + D`**: Create a new Virtual Desktop.
        - **`Win + Ctrl + Left / Right Arrow`**: Switch between your Virtual Desktops.
    3.  **File Explorer Shortcuts**: Stop hunting through folders with your mouse.
        - **`Win + E`**: **Open File Explorer**.
        - **`F2`**: **Rename**. Select a file and hit F2 to change the name instantly.
        - **`Alt + Up Arrow`**: Go "up" one folder level.
        - **`Alt + D`**: Jump to the **Address Bar** so you can type a path or search.
        - **`Ctrl + Shift + N`**: Create a new folder.

    4.  **Hidden "Power" Menus**:
        - **`Win + X`**: **Power User Menu**. Opens a secret menu above the Start button with quick links to Device Manager, Terminal (Admin), and System settings.
        - **`Win + I`**: **Settings**. Opens the main Windows Settings app.
        - **`Win + R`**: **Run Dialog**. Type `cmd` , `notepad` , or `calc` to launch apps instantly.
        - **`Win + [Number 1-9]`**: Opens the app pinned to your taskbar in that position (e.g., `Win + 1` opens the first app on the left).

    5.  **Quick Browser / Navigation Tips**: These work in almost any browser (Edge, Chrome, etc.) and many Windows apps. - **`Ctrl + T`**: Open new tab. - **`Ctrl + Shift + T`**: **Undo Close Tab**. Reopens the last tab you accidentally closed (a true life-saver). - **`Ctrl + L`**: Highlight the URL/Search bar. - **`Ctrl + Backspace`**: Delete a whole word at a time (much faster than character-by-character).
        > **Pro Tip:** If your graphics/screen ever freezes or acts "glitchy," try **`Win + Ctrl + Shift + B`**. This restarts your graphics driver without closing your apps.

    </details>


Customizing the Command Prompt (CMD) can turn a drab, black-and-white box into a productive environment that feels like a modern developer tool.


1. **Functional Setup (Environment Variables)**: If you want to run programs like `python`, `git`, or `node` from anywhere, you must configure your **PATH**.

    1. Press `Win + S` and search for **"Edit the system environment variables"**.
    2. Click **Environment Variables** at the bottom.
    3. Under **User variables**, find **Path** and click **Edit**.
    4. Add the folder paths where your `.exe` files live.


1. **Persistent Aliases (The "Linux Style")**: CMD doesn't support the `alias` command natively like Linux, but you can use `doskey`. However, `doskey` resets every time you close the window unless you use a **Startup Script**.

    - **Step A**: Create a macro file

        Create a file named `macros.doskey` in a safe folder (e.g., `C:\Scripts\`) and add your favorite shortcuts:

        ```batch
        ls=dir /b
        ll=dir /a
        gs=git status
        ga=git add .
        gc=git commit -m $*
        clear=cls

        ```

    - **Step B**: Automate it via the Registry

        To make CMD load these every time it starts, you need to tell the registry where your "AutoRun" script is.

        1. Press `Win + R`, type `regedit`, and hit Enter.
        2. Navigate to: `HKEY_CURRENT_USER\Software\Microsoft\Command Processor`
        3. Right-click in the right pane -> **New** -> **String Value**.
        4. Name it `AutoRun`.
        5. Double-click it and set the value to: `doskey /macrofile="C:\Scripts\macros.doskey"`
