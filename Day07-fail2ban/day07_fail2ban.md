# 🔫 Day 07: Operation Counter-Strike (Fail2Ban)

**Mission:** Automate intrusion detection and ban IP addresses that show malicious behavior.

## 🚧 The Problem
Even with SSH keys (Day 6), bots can still flood the server with thousands of login attempts per hour. This wastes system resources and clutters logs.

## 🛠️ The Solution
**Fail2Ban:** An intrusion prevention framework that monitors log files and automatically updates firewall rules.

### 1. Installation & Config
Installed `fail2ban` and configured a local jail (`/etc/fail2ban/jail.local`).

| Setting | Value | Reason |
| :--- | :--- | :--- |
| `bantime` | `1h` | Banned IPs are locked out for 1 hour. |
| `maxretry` | `3` | 3 failed attempts = Immediate Ban. |
| `backend` | `systemd` | Monitors system logs efficiently. |

### 2. The "Sniper" Logic
* **Trigger:** Fail2Ban scans `/var/log/auth.log` for "Failed password".
* **Action:** When threshold (3) is reached, it adds a `REJECT` rule to the Firewall.

### 3. Verification
* **Simulation:** Manually banned a test IP (`1.2.3.4`).
* **Command:** `sudo fail2ban-client set sshd banip 1.2.3.4`
* **Result:** IP appeared in the "Banned List" instantly.

## 🧠 Key Takeaway
"Security automation is the only way to scale." We cannot watch logs 24/7, so we built a robot to do it for us.

---
*Status: ✅ Complete*
