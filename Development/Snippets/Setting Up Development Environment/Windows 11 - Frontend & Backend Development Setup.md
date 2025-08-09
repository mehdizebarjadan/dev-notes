## Here's a Step-by-Step Setup for Your Windows 11 Laptop

> ⚠️ Note: You’ll use **WSL2** (Windows Subsystem for Linux) to get a Unix-like environment, just like your Mac.

---

### 🔧 1. **Install WSL2 and Ubuntu**

Open PowerShell (as admin) and run:
```powershell
wsl --install
```

Reboot when prompted. It will install Ubuntu (default). Once done, open Ubuntu from Start Menu.

---

### 🧰 2. **Inside WSL2 (Ubuntu)** — replicate your Mac setup

Now you’re in a Linux terminal inside Windows. Run these commands to match your Mac environment:

```bash
# Update and install basics 
sudo apt update && sudo apt upgrade -y 
sudo apt install git curl python3 python3-pip python3-venv build-essential -y
```
---

### 🟢 3. **Install NVM and Node**

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc  # or ~/.zshrc if using zsh

nvm install --lts
nvm use --lts

```

---

### 🐍 4. **Python Environment for Django**

Inside your project directory:

```bash
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install django black pylint isort
```

---

### 🔐 5. **Setup Git + SSH**

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

ssh-keygen -t ed25519 -C "your@email.com"
cat ~/.ssh/id_ed25519.pub
```

Add that key to your [GitHub SSH keys](https://github.com/settings/keys).

Test:
```bash
ssh -T git@github.com
```

---

### 💻 6. **Install VS Code**

Install VS Code on Windows: https://code.visualstudio.com

Then install the **WSL extension**:

- In VS Code: search for `Remote - WSL` and install it
    

From inside WSL:
```bash
code .
```

That opens VS Code in your Ubuntu environment with full access to Python, Django, etc.

---

### 🧩 7. **Install VS Code Extensions**

Match what you have on Mac:

- Python
    
- Pylance
    
- Django
    
- Django Template
    
- Black Formatter
    
- isort
    

---

### 🐘 8. **Install PostgreSQL (optional)**

In WSL:
```bash
sudo apt install postgresql postgresql-contrib
```

---
### 🐳 9. **Install Docker (optional)**

- Install **Docker Desktop for Windows**
    
- Enable **WSL2 integration** in Docker settings

---
## 🔁 Syncing Projects Between Mac and Windows

If you use GitHub for all your code, you'll stay in sync:
```bash
# On both machines:
git clone git@github.com:yourusername/your-django-project.git
```
