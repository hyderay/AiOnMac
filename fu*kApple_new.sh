#!/bin/bash

set -euo pipefail       
IFS=$'\n\t'             

# ── Constants 
ELIGIBILITY_PLIST="/private/var/db/eligibilityd/eligibility.plist"
OS_ELIGIBILITY_PLIST="/private/var/db/os_eligibility/eligibility.plist"

# ── Find PlistBuddy
PLISTBUDDY="$(command -v PlistBuddy || true)"
if [[ -z "$PLISTBUDDY" ]]; then
  echo "PlistBuddy not found. Install Xcode Command-Line Tools first."
  exit 1
fi
echo "Using PlistBuddy found at: $PLISTBUDDY"


# ── Ensure we’re root 
if (( EUID != 0 )); then
  echo "Run this script with sudo, e.g.  sudo $0"
  exit 1
fi


echo "=============================================="
echo "Select mode:"
echo "1) Enable Apple Intelligence (patch system)"
echo "2) Reset plists to factory defaults (delete & reboot)"
echo "=============================================="
read -r -p "Enter 1 or 2: " mode_choice < /dev/tty
echo


# ── Mode 1 – patch
if [[ $mode_choice =~ ^[1]$ ]]; then
  echo "Patching eligibility plists..."

  # 1 · Unlock both files
  sudo chflags nouchg "$ELIGIBILITY_PLIST" "$OS_ELIGIBILITY_PLIST" 2>/dev/null || true
  sudo chmod 777    "$ELIGIBILITY_PLIST" "$OS_ELIGIBILITY_PLIST"   2>/dev/null
  echo "Files unlocked."

  # 2 · Apply plist edits
  sudo "$PLISTBUDDY" -c "Set :OS_ELIGIBILITY_DOMAIN_STRONTIUM:os_eligibility_answer_t 4" "$OS_ELIGIBILITY_PLIST" || true
  sudo "$PLISTBUDDY" -c "Set :OS_ELIGIBILITY_DOMAIN_XCODE_LLM:os_eligibility_answer_t 4" "$OS_ELIGIBILITY_PLIST" || true
  sudo "$PLISTBUDDY" -c "Set :OS_ELIGIBILITY_DOMAIN_GREYMATTER:os_eligibility_answer_t 4" "$ELIGIBILITY_PLIST"   || true
  echo "Plist modifications complete."

  # 3 · Relock plists
  echo "Finalizing – locking plists…"
  sudo chmod 444 "$ELIGIBILITY_PLIST" "$OS_ELIGIBILITY_PLIST"
  sudo chflags uchg "$ELIGIBILITY_PLIST" "$OS_ELIGIBILITY_PLIST"
  echo "Done. Reboot and test Apple Intelligence. Re-enable SIP later if desired."
  exit 0
fi


# ── Mode 2 – factory reset
if [[ $mode_choice =~ ^[2]$ ]]; then
  echo "Deleting eligibility plists and letting macOS recreate them..."
  sudo chflags nouchg "$ELIGIBILITY_PLIST" "$OS_ELIGIBILITY_PLIST" 2>/dev/null || true
  sudo rm -f "$ELIGIBILITY_PLIST" "$OS_ELIGIBILITY_PLIST"
  echo "Done. Reboot now, or run:"
  echo "  sudo launchctl kickstart -k system/com.apple.eligibilityd"
  exit 0
fi


# ── Invalid input
echo "Error: \"$mode_choice\" is not a valid option. Please enter 1 or 2." >&2
exit 1