# AiOnMac

**Enable Apple Intelligence features on China SKU Macs**

—

## ⚙️ Overview

**AiOnMac** is a simple script that unlocks Apple Intelligence features on macOS systems sold in China.

Apple limits some features based on device region settings — this script bypasses that restriction for eligible systems.

—

## ✅ Supported macOS Versions

- macOS **15.1** to **macOS 16 beta 1**

—

## 🚀 Usage

> ⚠️ **Requires disabling System Integrity Protection (SIP)**

1. **Disable SIP**  
   - Boot into **Recovery Mode**
   - Open **Terminal** and run:
     ```bash
     csrutil disable
     ```
   - Reboot into macOS normally

2. **Run the script**
   - In Terminal, execute:
     ```bash
     bash -c “$(curl -fsSL https://raw.githubusercontent.com/hyderay/AiOnMac/main/ai_on_mac.sh)”
     ```

3. **Re-enable SIP** *(recommended)*  
   - Boot into **Recovery Mode** again
   - Run:
     ```bash
     csrutil enable
     ```

4. **Done!** 🎉  
   - You can now access **Apple Intelligence** features.


—

<img width="827" alt="Screenshot 2025-06-14 at 10 16 27" src="https://github.com/user-attachments/assets/22aac919-aaf6-4c8c-90fe-b54e06de9dae" />


## ❗ Disclaimer

- This script modifies system files. Use at your own risk.
- Not affiliated with Apple Inc.
- For educational and testing purposes only.