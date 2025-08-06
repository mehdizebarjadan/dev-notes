Mac (M1, macOS Sequoia) - Django & React
## ✅ 1. **Terminal Setup**

- Use **iTerm2** instead of the default Terminal:
    
	```bash
	brew install --cask iterm2
	```
    
- Optional but helpful: install a nice terminal prompt like **Starship**:
    
	```bash
	brew install starship
	echo 'eval "$(starship init zsh)"' >> ~/.zshrc
	```
    

---

## ✅ 2. **Shell Config (Zsh)**

- Make sure `.zshrc` includes:
    
    ```bash
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
	```
    
- Reload:
    
    ```bash
	    source ~/.zshrc
	```

---

## ✅ 3. **Node & NPM Setup**

- Install latest LTS version of Node via `nvm`:
   ```bash
	nvm install --lts
	nvm use --lts
	nvm alias default lts/*
	```
    
- Verify:
	```bash
	node -v
	npm -v
	``` 

    

---

## ✅ 4. **Essential Global Packages**

Install globally useful CLI tools:

```bash
npm install -g yarn
npm install -g typescript
npm install -g eslint
npm install -g prettier
npm install -g create-react-app
```

---

## ✅ 5. **Homebrew Essentials**

Install common dev tools:

```bash
brew install git
brew install gh           # GitHub CLI
brew install wget
brew install tmux
brew install python       # If needed for scripts or data tools
```

**Optional GUI apps:**

```bash
brew install --cask visual-studio-code
brew install --cask google-chrome
brew install --cask rectangle          # window manager
brew install --cask postman
```

---

## ✅ 6. **Git Setup**

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
git config --global init.defaultBranch main
git config --global core.editor "code --wait"
```

---

## ✅ 7. **VS Code Extensions (Recommended)**

Install from the extensions panel or command line:

```bash
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension eamodio.gitlens
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension visualstudioexptteam.vscodeintellicode
```

---

## ✅ 8. **Docker (Optional for Backend or Fullstack)**

```bash
brew install --cask docker
```

Make sure Docker runs natively on M1.

---

## ✅ 9. **Setup Project Workspace**

```bash
mkdir ~/Projects
cd ~/Projects
```

Use `git clone`, `npx create-react-app`, or whatever framework you like.

---

## ✅ 10. **Keep It Clean**

Set up:

```bash
brew cleanup
```

And consider using a tool like [`mackup`](https://github.com/lra/mackup) to sync your dotfiles/settings via cloud.

---

## Optional Bonus

- Use `volta` if you want an alternative to `nvm` that’s often faster and simpler on M1.
    
- Setup SSH keys for GitHub:
    ```bash
    ssh-keygen -t ed25519 -C "your@email.com"
	pbcopy < ~/.ssh/id_ed25519.pub
	# Add it to GitHub > Settings > SSH and GPG keys
	```