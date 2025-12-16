# 🛡️ Day 06: Operation Bolted Door (SSH Hardening)

**Date:** December 16, 2025
**Mission:** Secure the Linux server by disabling password-based logins and enforcing Cryptographic Key Authentication.

## 🚧 The Problem
By default, SSH (Port 22) allows users to log in with a simple password. This makes the server vulnerable to:
1.  **Brute Force Attacks:** Bots guessing billions of passwords per second.
2.  **Root Access:** If the `root` password is weak, the entire system is compromised.

## 🛠️ The Solution
We shifted from "Something you know" (Password) to "Something you have" (SSH Key).

### 1. Key Generation (Client-Side)
Generated an ED25519 key pair, which is more secure and faster than legacy RSA keys.
```bash
ssh-keygen -t ed25519 -C "nevin_devsecops"

```

###2. Key TransferSent the public lock (`.pub` file) to the server's `authorized_keys` list using PowerShell.

```powershell
type $env:USERPROFILE\.ssh\id_ed25519.pub | ssh nevin@192.168.234.128 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"

```

###3. Server Hardening (`/etc/ssh/sshd_config`)Modified the SSH daemon configuration to ban unsafe practices.

| Setting | Value | Reason |
| --- | --- | --- |
| `PermitRootLogin` | `no` | Prevents direct login as the 'God' user. |
| `PasswordAuthentication` | `no` | **CRITICAL:** Disables text passwords entirely. |
| `PubkeyAuthentication` | `yes` | Forces the use of SSH Keys. |
| `PermitEmptyPasswords` | `no` | Basic hygiene. |

###4. Verification* **Test:** Ran `ssh nevin@192.168.234.128` from a fresh terminal.
* **Result:** Logged in instantly without a password prompt.

##🧠 Key Takeaway"Security is not about making things impossible to break, but making them too expensive to break." By removing passwords, we forced attackers to steal a physical 4096-bit key file instead of just guessing a word.

---

*Status: ✅ Complete*

```

---

### 📝 File 2: The README Update
Open your main **`README.md`** file (the one that tracks your 100 days progress) and add this entry to your checklist or table.

**Add this line:**

```markdown
| Day 06 | 🛡️ SSH Hardening | Disabling Passwords, Enforcing Key Auth | ✅ Completed |

```

---

###🚀 How to Push ItRun these commands in your Windows PowerShell to make it official:

```powershell
git add .
git commit -m "Day 06: Successfully hardened SSH and disabled passwords"
git push origin main

```
