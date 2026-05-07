# Acer Predator Helios 300 PH315-53 BIOS Unlock Documentation

This repository provides an automated toolkit and collection of hex patches designed to unlock hidden Advanced, Debug, and Chipset menus in the InsydeH2O BIOS of the Acer Predator Helios 300 (PH315-53-72XD). 

⚠️ **DISCLAIMER:** Modifying and flashing your BIOS carries inherent risks, including the possibility of permanently bricking your device. Use these tools completely at your own risk. Ensure you have a hardware SPI programmer or a Crisis Recovery USB prepared before proceeding.

## 🏆 Credits & Acknowledgements

The foundational tools, scripts, and original patch patterns in this repository are the hard work of the incredible modding community at the WinRaid forums. 

Massive credits go to **Sweet_Kitten**, **vermon**, and other contributors from the original WinRaid discussion thread. Without their initial research and reverse-engineering, this toolkit would not be possible.
* **Original WinRaid Thread:** [Request BIOS Unlock Acer Predator Helios PH315-53](https://winraid.level1techs.com/t/request-bios-unlock-acer-predator-helios-ph315-53/39708)

## 📁 The `patches` Directory Explained

Inside the `patches` folder, you will find three distinct patch files. Depending on what you want to unlock, you will choose **one** of these files to use in the flashing procedure.

* `patches.txt.OG`
  * This contains the **Original** baseline work provided by Sweet_Kitten, vermon, and the WinRaid community. Use this if you only want the standard Advanced menu unlocks.
  
* `patches.txt.EXTRA`
  * This is an expanded patch list. It contains everything from the `.OG` file, plus **numerous additional patch patterns** and low-level hex modifications discovered and added specifically for this repository to unhide further suppressed menus.

* `patches.txt.LEGACY`
  * This file contains the standard patches alongside highly specific dual-lock patches designed to **unlock the Setup Mode option and enable the Legacy ROM (CSM) boot option** on this hardware. *(Note: Proceed with extreme caution when modifying Boot Modes on 10th-Gen Intel Class 3 UEFI systems).*

## 🚀 How to Use (Flashing Procedure)

To apply the unlocked BIOS to your system, carefully follow these steps:

**Step 1: Select Your Patch**
1. Open the `patches` directory.
2. Choose the patch file you want to use (`patches.txt.OG`, `patches.txt.EXTRA`, or `patches.txt.LEGACY`).
3. **Copy** your chosen file into the **root directory** of this project (the same folder where the `.bat` files are located).
4. **Rename** the copied file exactly to: `patches.txt`

**Step 2: Bypass Hardware Locks (Set Variables)**
5. Run the `1. SET VARS.bat` script as an Administrator. This uses H2OUVE to disable Intel's BIOS Lock and FPRR hardware protections in your NVRAM.
6. Once the script completes successfully, **Reboot your laptop** to ensure the hardware accepts the unlocked state.

**Step 3: Patch and Flash**
7. After rebooting, run the `2. FLASH.bat` script as an Administrator. *(Note: Depending on your Windows environment, you may need to run this from a WinRE command prompt to avoid driver conflicts).*
8. The script will read your current BIOS, apply the hex modifications from your chosen `patches.txt` using UEFIPatch, and flash the modified `MOD.bin` back to your chip.
9. Reboot into your newly unlocked BIOS!
