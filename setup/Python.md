# Virtual environment

To make sure your VS Code `settings.json` points to the **correct Python virtual environment**, you'll need to:

---

## ✅ Step 1: Identify the Python interpreter path

In your terminal (inside the Django project directory), run:

bash

```which python`

If you're inside a virtual environment, this will return something like:

swift

`/Users/yourname/Projects/django/venv/bin/python`

This is the full path to your virtual environment’s Python interpreter.

> 🧠 Tip: If it just says `/usr/bin/python` or something global, you’re **not in a virtual environment** yet.

---

## ✅ Step 2: Activate Your Virtual Environment (if needed)

If you haven’t created one yet:

bash

`python3 -m venv venv`

Then activate it:

bash

`source venv/bin/activate`

Now try:

bash

`which python`

You should get a path inside your project folder, like:

swift

`/Users/yourname/Projects/django/venv/bin/python`

---

## ✅ Step 3: Add the Path to VS Code Settings

Open `.vscode/settings.json` and add:

json

`"python.defaultInterpreterPath": "/Users/yourname/Projects/django/venv/bin/python"`

Or use the VS Code variable if `venv` is in the root of your workspace:

json

`"python.defaultInterpreterPath": "${workspaceFolder}/venv/bin/python"`

This tells VS Code to always use your project’s virtual environment.




```json
{
  "python.defaultInterpreterPath": "/Users/user/Projects/django/venv/bin/python",
  "python.formatting.provider": "black",
  "editor.formatOnSave": true,
  "python.linting.enabled": true,
  "python.linting.pylintEnabled": true,
  "files.associations": {
    "**/templates/*.html": "django-html"
  }
}

```