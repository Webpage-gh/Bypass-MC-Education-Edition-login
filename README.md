简体中文  [English](https://github.com/Webpage-gh/Bypass-MC-Education-Edition-login/blob/main/README_EN.md)
# 绕过 MC 教育版登录
使用 Termux 执行这个脚本来安装资源包以绕过登录对话框

### 使用方法
1. 对您的设备获取 Root 权限，参考 [安装 Magisk](https://topjohnwu.github.io/Magisk/install.html)
2. 下载并安装 [Termux](https://github.com/termux/termux-app/releases/latest) 和 MC 教育版
3. 换源（针对国内用户），安装依赖
   ```bash
   termux-change-repo
   ```
   ```bash
   apt update -y && apt install git tsu jq -y
   ```
4. 执行以下命令
   ```bash
   git clone https://github.com/Webpage-gh/Bypass-MC-Education-Edition-login.git && sudo sh Bypass-MC-Education-Edition-login/Bypass.sh; rm -rf Bypass-MC-Education-Edition-login
   ```

### 手动安装
首先，我们推荐您采用 Termux 来安装它。如果因为一些原因不能这么做，那么我们可以：

1. 复制`mcpack`中的所有文件到`/data/data/com.mojang.minecraftedu/games/com.mojang/resource_packs/教育版绕登录UI`文件夹中
2. 把`global_resource_packs.json`中的文字按照JSON的格式添加到`/data/data/com.mojang.minecraftedu/games/com.mojang/minecraftpe/global_resource_packs.json`文件里
3. 修改复制的文件（夹）的所有者和用户组，以及权限。通常只需要允许所有者对文件有读写权限(rw-------)，对文件夹有读写执行权限(rwx------)。所有者和用户组是所对应程序的UID。

#### 卸载
无论安装是否成功，我们都已经在执行最后一条命令后把这个项目删除掉了。接下来我们只需要进入游戏删除这个资源包就可以了。如果因为卡在登录页面而无法删除，我们可以直接清除软件的数据，或者按照手动安装的步骤删除掉这些文件（夹）。

