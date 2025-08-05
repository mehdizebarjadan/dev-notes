# Dev Notes Vault

This is a collaborative Obsidian vault for development notes.
Use folders like 📚 Courses, 💻 Projects, and 🧠 Concepts to organize your knowledge.

## Folder Guide
- 📚 Courses: Notes from courses and tutorials
- 💻 Projects: Project-specific notes
- 🧪 Snippets: Reusable code blocks
- 🧠 Concepts: Deep dives into topics
- ✅ Daily: Daily logs and progress
- templates/: Templates for consistent notes

---
a lightweight, focused Obsidian setup for developer learning (especially useful if you're studying Django, React, etc.).

🧠 The goal: avoid overwhelm and give you just the right tools for capturing knowledge, tracking progress, and exploring ideas.

---

## ✅ Your Lightweight Obsidian Setup for Dev Learning

### 🗂️ Folder Structure (Starter Vault)

Create a vault folder named something like: `dev-notes`

Inside, use this structure:

```
dev-notes/
├── 📚 Courses/
├── 💻 Projects/
├── 🧪 Snippets/
├── 🧠 Concepts/
├── ✅ Daily/
├── templates/
```

- Courses → Notes from Udemy, docs, tutorials
    
- Projects → Thoughts, todos, code ideas per project
    
- Snippets → Reusable commands, code
    
- Concepts → Deeper explanations (e.g., “JWT auth”, “React lifecycle”)
    
- Daily → Journaling, progress logs

---
### 🔌 Recommended Plugins (Minimal & Dev-Focused)

Go to: ⚙️ Settings → Community plugins → Turn on Safe Mode → OFF → Browse

Install these:

1. ✅ Tasks
    
    - Track todos in any note using `- [ ] Task`
        
    - Filter by status, date, priority
    
2. 📅 Calendar
    
    - Pairs with Daily Notes for a journal-like view
        
    - Lets you navigate notes by date easily
    
3. 🧠 Dataview
    
    - Turns your notes into queries (like a personal database)
        
    - E.g. “show me all undone tasks from Courses”
    
4. 📝 Advanced Tables
    
    - Markdown tables, but easier to edit (keyboard-friendly)
    
5. 🔁 Git (optional)
    
    - Sync your vault with GitHub (especially good if using multiple machines or want version control)


---

### 🧩 Optional Quality-of-Life Plugins

- Templater → Create note templates (e.g., for new lessons or project notes)
    
- Tag Wrangler → Manage & rename tags easily
    
- Code Editor Shortcuts → Mimics VS Code feel inside code blocks
    

---

### 🗓️ Enable Core Plugins

In Settings → Core Plugins, enable:

- Daily Notes
    
- Templates
    
- Backlinks
    
- File Explorer
    
- Tag pane


---

### ✨ Suggested Workflows

1. 📓 Daily Note
    
    - What you learned today
        
    - What you struggled with
        
    - Quick todos
    
2. 🧠 Concepts
    
    - Note: `JWT Authentication.md`
        
    - Break down a topic in your own words
        
    - Link it to projects where it's used
    
3. 🔁 Snippets
    
    - Markdown code blocks for bash, Python, JS, etc.
        
    - Example:


      ```python
		      def is_valid_email(email):
			    return "@" in email and "." in email

		```