Understanding how SSH keys work and how they’re used will help you manage code securely and confidently.

---

## 🔐 **What Is an SSH Key and Why It's Good**

An **SSH key** is a **cryptographic key pair** used to authenticate securely without needing a password.

It consists of:

- **Private key** (`~/.ssh/id_ed25519`): Secret — _never share it_
    
- **Public key** (`~/.ssh/id_ed25519.pub`): Share with GitHub (or other servers)
    

### ✅ Benefits:

- **Secure authentication**: Better than passwords
    
- **No need to re-enter GitHub credentials** for every push/pull
    
- **Can be revoked** or rotated easily
    
- **Enables automation** (e.g., CI/CD) without exposing passwords



## 💡 **How the SSH Key Is Used (GitHub Example)**

1. **You generate a key pair**:
    
    ```bash
    ssh-keygen -t ed25519 -C "you@example.com"
```
    
2. **You add the public key to GitHub**:
    
    - Run:
			```
			
        
        
    - Go to GitHub → **Settings > SSH and GPG keys > New SSH Key**
        
    - Paste the key and give it a name like “MacBook M1”
        
3. **You tell your system to use the private key**:
    
    bash
    
    CopyEdit
    
    `eval "$(ssh-agent -s)" ssh-add ~/.ssh/id_ed25519`
    
4. **When you push/pull with Git**, GitHub checks if your public key matches your private key.
    
    - If it does, you’re in — no password prompt.


## 🔍 **How to Test It**

After adding the key:

bash

CopyEdit

`ssh -T git@github.com`

Expected output:

vbnet

CopyEdit

`Hi yourusername! You've successfully authenticated, but GitHub does not provide shell access.`

That means it’s working 🎉

---

## 🛠️ Tip: Set Default SSH Key in Git Config (Optional)

If you're using SSH with GitHub regularly, make sure your Git remote is using the SSH URL:

bash

CopyEdit

`git remote set-url origin git@github.com:yourusername/your-repo.git`

And optionally create a `~/.ssh/config` like:

ssh

CopyEdit

`Host github.com   AddKeysToAgent yes   IdentityFile ~/.ssh/id_ed25519`


The difference between **SSH** and **HTTPS** setups for GitHub mostly comes down to **how you authenticate** and **manage access** when you push/pull code.

Here’s a simple breakdown:

---

## 🔐 Authentication Methods

|Feature|SSH Setup|HTTPS Setup|
|---|---|---|
|**How you authenticate**|Using SSH keys (public/private key pairs)|Using username/password or personal access token (PAT)|
|**Setup complexity**|Requires generating SSH keys and adding your public key to GitHub|No key generation needed; just use your GitHub username and PAT when prompted|
|**Security**|More secure; no passwords transmitted; keys are hard to steal if kept safe|Depends on token security; passwords discouraged, tokens preferred|
|**Convenience**|Once set up, you rarely need to enter credentials|Usually requires typing token/password unless credential helpers are set up|
|**Firewall/proxy issues**|Sometimes blocked by corporate firewalls|Usually works better behind proxies since it uses HTTPS|

---

## 🔄 Usage Differences

- **SSH URLs look like:**
    
    scss
    
    CopyEdit
    
    `git@github.com:username/repo.git`
    
- **HTTPS URLs look like:**
    
    arduino
    
    CopyEdit
    
    `https://github.com/username/repo.git`
    

---

## When to use which?

- Use **SSH** if you want:
    
    - Password-less authentication after setup
        
    - Better security with key pairs
        
    - To avoid typing credentials repeatedly
        
- Use **HTTPS** if you want:
    
    - Quick setup without generating keys
        
    - To work behind restrictive networks/firewalls
        
    - To authenticate via tokens (especially on CI/CD systems)
        

---

## Bonus: Switching Between SSH and HTTPS

You can change the remote URL anytime with:

bash

CopyEdit

`git remote set-url origin git@github.com:username/repo.git   # SSH git remote set-url origin https://github.com/username/repo.git   # HTTPS`