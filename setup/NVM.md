# Installing and Configuring NVM on macOS (M1)

1. **Remove conflicting installations:** Before installing NVM, uninstall any existing Node or nvm installations (especially Homebrew ones). The nvm documentation explicitly warns that “Homebrew installation is not supported”[github.com](https://github.com/nvm-sh/nvm#:~:text=Homebrew%20installation%20is%20not%20supported,below%2C%20before%20filing%20an%20issue). If you have installed nvm via Homebrew, run `brew uninstall nvm` and `brew cleanup`[github.com](https://github.com/nvm-sh/nvm#:~:text=Homebrew%20installation%20is%20not%20supported,below%2C%20before%20filing%20an%20issue). Also remove any globally installed Node versions (e.g. `brew uninstall node` or delete `/usr/local/bin/node`) to avoid conflicts with nvm’s managed Node versions.
    
2. **Install prerequisites (Xcode CLI, Rosetta):** Ensure the Xcode command-line tools are installed, as nvm requires Git/compilers. Run:
    
    ```bash
    xcode-select --install
	```
    
    The nvm README notes that if Git or the CLI tools aren’t present, the installer will fail[github.com](https://github.com/nvm-sh/nvm#:~:text=Since%20OS%20X%2010.9%2C%20,1782). On Apple Silicon Macs, also install Rosetta 2 to allow running Intel binaries:
    
	  ```bash
	  softwareupdate --install-rosetta --agree-to-license
	```
	    
    (Installing Rosetta is only needed if you plan to use older Node versions that lack ARM support.) These steps prepare your system with the necessary tools[github.com](https://github.com/nvm-sh/nvm#:~:text=Since%20OS%20X%2010.9%2C%20,1782)[vinaysomawat.medium.com](https://vinaysomawat.medium.com/nvm-install-node-fails-to-install-on-macos-big-sur-m1-chip-a4dea4c5e041#:~:text=Uninstalled%20nvm%20if%20it%E2%80%99s%20already,installed%20using%20Homebrew).
    
3. **Set up your shell profile:** Identify your default shell (`echo $SHELL`). On recent macOS versions (Catalina and later), the default is **zsh**; on older systems it may be bash. For zsh, ensure a `~/.zshrc` file exists (the nvm installer won’t add itself to a missing file). For bash, use `~/.bash_profile` or `~/.bashrc`. If the file doesn’t exist, create it:
    
    bash
    
    CopyEdit
    
    `touch ~/.zshrc       # for zsh users (macOS default) touch ~/.bash_profile  # for bash users`
    
    As the official docs explain: on macOS 10.15+, “the default shell is zsh and nvm will look for `.zshrc` to update; none is installed by default. Create one with `touch ~/.zshrc` and run the install script again”[github.com](https://github.com/nvm-sh/nvm#:~:text=If%20you%20get%20,following%20might%20be%20the%20reason). (Similarly, bash users should create `~/.bash_profile` or `~/.bashrc` if missing[github.com](https://github.com/nvm-sh/nvm#:~:text=,command).) This ensures nvm can add its setup code to your shell config.
    
4. **Install NVM via the official script:** Run the nvm install script as recommended on the nvm GitHub. For example:
    
    bash
    
    CopyEdit
    
    `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash`
    
    (Replace `v0.40.3` with the latest release if newer.) This command clones nvm into `~/.nvm` and automatically appends the necessary initialization code to your shell profile[github.com](https://github.com/nvm-sh/nvm#:~:text=curl%20). After it completes, check that your shell config (`~/.zshrc` or similar) contains lines like:
    
    bash
    
    CopyEdit
    
    `export NVM_DIR="$HOME/.nvm" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm:contentReference[oaicite:8]{index=8}.`
    
    If the installer didn’t add these lines (or added them to a different file), you can add them manually. This snippet (from nvm’s README) sets the `NVM_DIR` and sources `nvm.sh` so that the `nvm` command is available in every new shell[github.com](https://github.com/nvm-sh/nvm#:~:text=export%20NVM_DIR%3D%22%24%28%5B%20,This%20loads%20nvm).
    
5. **Reload the shell and verify:** Close and reopen your Terminal (or run `source ~/.zshrc` / `source ~/.bash_profile`) so the profile changes take effect[github.com](https://github.com/nvm-sh/nvm#:~:text=,command%20and%20the%20new%20configuration). Then verify nvm is installed by running:
    
    bash
    
    CopyEdit
    
    `nvm --version command -v nvm`
    
    The first should print an nvm version number, and the second should output `nvm` (since nvm is a shell function, not a standalone binary[github.com](https://github.com/nvm-sh/nvm#:~:text=To%20verify%20that%20nvm%20has,been%20installed%2C%20do)). If it does, the installation worked. If you still see “command not found,” double-check that the export snippet from Step 4 is in the correct file (see Troubleshooting below). As the nvm docs note, you may need to restart your terminal or source the file to load nvm[github.com](https://github.com/nvm-sh/nvm#:~:text=,command%20and%20the%20new%20configuration)[github.com](https://github.com/nvm-sh/nvm#:~:text=To%20verify%20that%20nvm%20has,been%20installed%2C%20do).
    
6. **Install and manage Node versions:** With nvm working, install the Node.js versions you need. For example, to get the latest LTS release:
    
    bash
    
    CopyEdit
    
    `nvm install --lts`
    
    On an M1 Mac you should **prefer Node 16 or later**, since Node 16+ provides native ARM64 builds[github.com](https://github.com/nvm-sh/nvm#:~:text=Note%20For%20Macs%20with%20the,of%20those%20versions%20or%20later). (If you need Node 14 or earlier, see below on using Rosetta.) You can also use `nvm install node` for the current version, or `nvm install <version>`. Use `nvm ls` to list installed versions, `nvm use <version>` to switch versions, and `nvm alias default <version>` to set a default. The first version you install becomes the default for new shells unless changed.
    

## Troubleshooting common issues

- **“nvm: command not found” after install:** This usually means your shell didn’t load the nvm script. First, ensure your shell profile (e.g. `~/.zshrc` for zsh or `~/.bash_profile` for bash) contains the nvm initialization snippet from Step 4[github.com](https://github.com/nvm-sh/nvm#:~:text=export%20NVM_DIR%3D%22%24%28%5B%20,This%20loads%20nvm). If it’s missing, add it manually or rerun the installer. Also make sure you created the profile file before installing (use `touch ~/.zshrc` if needed)[github.com](https://github.com/nvm-sh/nvm#:~:text=If%20you%20get%20,following%20might%20be%20the%20reason). After editing, open a new terminal or run `source ~/.zshrc` to load nvm. As the official guide advises, you may need to restart the terminal instance for changes to take effect[github.com](https://github.com/nvm-sh/nvm#:~:text=,command%20and%20the%20new%20configuration).
    
- **Homebrew-installed NVM not working:** If you tried to install nvm via Homebrew, uninstall it (`brew uninstall nvm`) and use the official script instead. The nvm maintainers emphasize that “Homebrew installation is not supported”[github.com](https://github.com/nvm-sh/nvm#:~:text=Homebrew%20installation%20is%20not%20supported,below%2C%20before%20filing%20an%20issue). Using the script ensures nvm is set up correctly under your user directory.
    
- **Node versions and Rosetta on M1:** By default, nvm will download ARM-compatible Node binaries when available (Node 16+ on macOS). If you try to install an older Node (like v14) that isn’t offered in ARM form, you may get errors. In that case, you can either install a newer Node (>=16) as recommended[github.com](https://github.com/nvm-sh/nvm#:~:text=Note%20For%20Macs%20with%20the,of%20those%20versions%20or%20later), or use Rosetta to install the older version. For Rosetta mode, you can right-click the Terminal app, choose “Get Info” and check “Open using Rosetta,” then restart Terminal. Alternatively, in any terminal run:
    
    bash
    
    CopyEdit
    
    `arch -x86_64 zsh`
    
    (This spawns a new shell under Intel emulation.) Then run your `nvm install <version>` command there[vinaysomawat.medium.com](https://vinaysomawat.medium.com/nvm-install-node-fails-to-install-on-macos-big-sur-m1-chip-a4dea4c5e041#:~:text=arch%20). This will use Rosetta to compile or fetch the Intel build of Node. Once installed under Rosetta, you can return to normal (ARM) mode for other tasks.
    
- **Xcode or build errors:** If `nvm install <version>` fails with Git or compilation errors (e.g. “command not found: git” or “clang: error”), double-check that Xcode CLI tools are installed (`xcode-select --install`)[github.com](https://github.com/nvm-sh/nvm#:~:text=Since%20OS%20X%2010.9%2C%20,1782). Without the CLI tools, nvm can’t fetch or compile Node.
    
- **Verification tip:** Run `command -v nvm` to ensure nvm is recognized by your shell. It should simply return `nvm`[github.com](https://github.com/nvm-sh/nvm#:~:text=To%20verify%20that%20nvm%20has,been%20installed%2C%20do). (Do not rely on `which nvm`, since nvm is a shell function not a standalone binary.) If it doesn’t, the nvm initialization lines are not being executed.
    

With these steps and checks, nvm should be correctly installed on your M1 Mac (macOS Sequoia) and ready for managing multiple Node.js versions for web development.