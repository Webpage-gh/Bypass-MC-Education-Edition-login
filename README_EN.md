[简体中文](https://github.com/Webpage-gh/Bypass-MC-Education-Edition-login)  English
# Bypassing MC Education Edition Login

Use Termux to execute this script to install the resource pack and bypass the login dialog.

## Usage

1. Obtain root access for your device, refer to [Installing Magisk](https://topjohnwu.github.io/Magisk/install.html).
2. Download and install [Termux](https://github.com/termux/termux-app/releases/latest) and MC Education Edition.
3. Change the package source (for users in China) and install the git command:
   
   ```bash
   termux-change-repo
   ```
   
   ```bash
   apt update -y && apt install git -y
   ```

4. Execute the following commands:

   ```bash
   git clone https://github.com/Webpage-gh/Bypass-MC-Education-Edition-login.git && sudo sh Bypass-MC-Education-Edition-login/Bypass.sh; rm -rf Bypass-MC-Education-Edition-login
   ```

## Manual Installation

First, we recommend using Termux to install it. If you can't do it for some reason, then you can:

1. Copy all files from `mcpack` to the `/data/data/com.mojang.minecraftedu/games/com.mojang/resource_packs/EducationEditionBypassUI` folder.
2. Add the text from `global_resource_packs.json` to `/data/data/com.mojang.minecraftedu/games/com.mojang/minecraftpe/global_resource_packs.json` in JSON format.
3. Modify the owner, user group, and permissions of the copied files or folders. Typically, you only need to allow the owner to have read-write permissions (rw-------) for files, and read-write-execute permissions (rwx------) for folders. The owner and user group should correspond to the UID of the respective program.

### Uninstall

Whether the installation is successful or not, we have already deleted this project after executing the last command. Next, we only need to enter the game and delete this resource pack. If you're unable to delete it due to being stuck on the login page, you can directly clear the app's data, or follow the steps from the manual installation to delete these files or folders.