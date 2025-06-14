# AiOnMac

Enable Apple Intelligence on China SKU Macs with a single script.

## Overview

**AiOnMac** is a tool that allows you to unlock and enable Apple Intelligence features on Mac computers officially sold in mainland China (China SKU).  
Tested on and supports macOS 15.1 to macOS 26 beta 1.

---

## Usage

> ⚠️ **System Integrity Protection (SIP) must be disabled while running this script. You can re-enable SIP after the patch.**

### 1. Disable SIP

1. Restart your Mac and hold `Command (⌘) + R` to enter **Recovery Mode**.
2. In the menu bar, select **Utilities > Terminal**.
3. Enter the following command:
    ```
    csrutil disable
    ```
4. Restart your Mac.

### 2. Run the Script

1. Download and run the patch script in **Terminal**:
    ```bash
    sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/hyderay/AiOnMac/refs/heads/main/fu*kApple_new.sh)"
    ```
2. Follow the on-screen prompts.

### 3. Re-enable SIP (Recommended)

1. Reboot into **Recovery Mode** again.
2. Open **Terminal** from the Utilities menu.
3. Enter:
    ```
    csrutil enable
    ```
4. Restart your Mac.

---

## Supported Systems

- macOS 15.1 ~ macOS 26 beta 1 (Sequoia and above)

---

<img width="827" alt="Screenshot 2025-06-14 at 10 16 27" src="https://github.com/user-attachments/assets/22aac919-aaf6-4c8c-90fe-b54e06de9dae" />

## Disclaimer

- This script modifies system files and may void your warranty.  
- Use at your own risk.
- Not affiliated with or endorsed by Apple Inc.

---

## Credits

- https://github.com/hyderay/AiOnMac
