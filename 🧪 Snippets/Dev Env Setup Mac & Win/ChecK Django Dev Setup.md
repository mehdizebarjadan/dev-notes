# ✅ Quick Mac Django Dev Setup Checklist

> Run each of these commands in **Terminal**, and verify the output:

---

### 🧰 1. **Check Python & Virtual Environment**

```bash
python3 --version
which python3
```
Then activate your virtualenv (if you created one):
```bash
source /Users/user/Projects/django/venv/bin/activate
```
Verify:
```bash
which python
python --version
```

---

### 🐍 2. **Check Django Installed**
```bash
python -m django --version
```

---

### 🌐 3. **Check Node & NVM**
```bash
nvm --version
node --version
npm --version
```
If `nvm` doesn’t work, make sure this is in your `.zshrc` or `.bashrc`:
```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
```

---

### 🧪 4. **Check Git + SSH**
```bash
git --version
ssh -T git@github.com
```
If SSH says `Hi yourname!`, then you're connected.

---

### 🖥️ 5. **Check VS Code**

Open Terminal in your project folder and type:
```bash
code .
```
This should launch VS Code in that folder. If not:
```bash
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
```
Add that to your `.zshrc` or `.bashrc`.

---

### 🛠️ 6. **PostgreSQL (optional)**
```bash
psql --version
```

---

### 🔄 7. **Run a Django Project Test**

Inside your Django project:

```bash
python manage.py runserver
```

Visit `http://127.0.0.1:8000/` in your browser — if it loads, you're golden.

---

### 🧩 8. **VS Code Extensions Check (manually)**

In VS Code:

- Open **Extensions Panel** (⇧⌘X)
    
- Make sure you’ve installed:
    
    - ✅ Python
        
    - ✅ Pylance
        
    - ✅ Django
        
    - ✅ Django Template
        
    - ✅ Black Formatter
        
    - ✅ isort
## ⛳ Script file to Setup Django

![[setup_django.sh]]![[setup_django_env_mac.sh]]