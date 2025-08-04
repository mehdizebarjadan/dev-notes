# ✅ Quick Mac Django Dev Setup Checklist

> Run each of these commands in **Terminal**, and verify the output:

---

### 🧰 1. **Check Python & Virtual Environment**

`python3 --version which python3`

Then activate your virtualenv (if you created one):

`source /Users/user/Projects/django/venv/bin/activate`

Verify:

`which python python --version`

---

### 🐍 2. **Check Django Installed**

`python -m django --version`

---

### 🌐 3. **Check Node & NVM**

`nvm --version node --version npm --version`

If `nvm` doesn’t work, make sure this is in your `.zshrc` or `.bashrc`:

`export NVM_DIR="$HOME/.nvm" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"`

---

### 🧪 4. **Check Git + SSH**

`git --version ssh -T git@github.com`

If SSH says `Hi yourname!`, then you're connected.

---

### 🖥️ 5. **Check VS Code**

Open Terminal in your project folder and type:

`code .`

This should launch VS Code in that folder. If not:

`export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"`

Add that to your `.zshrc` or `.bashrc`.

---

### 🛠️ 6. **PostgreSQL (optional)**

`psql --version`

---

### 🔄 7. **Run a Django Project Test**

Inside your Django project:

`python manage.py runserver`

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

