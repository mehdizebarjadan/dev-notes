# SSH Key Setup

```bash
ssh-keygen -t ed25519 -C "you@example.com"
```

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