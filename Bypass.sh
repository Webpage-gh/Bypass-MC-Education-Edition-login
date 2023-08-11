#!/bin/env sh

# 当前用户是否为 root
if [ "$(id -u)" != "0" ]; then
    echo "需要 root 权限来访问MC教育版的私有目录"
    exit 1
fi

PKG=com.mojang.minecraftedu
DIR="$(dirname "$(realpath "$0")")"
packdir="/data/data/$PKG/games/com.mojang/resource_packs/教育版绕登录UI"
jsonfile="/data/data/$PKG/games/com.mojang/minecraftpe/global_resource_packs.json"
# 通过pm获取MC教育版的UID，然后赋值
UID="$(su -c "pm list packages -U $PKG"|awk -F: '{print $NF}')"

# 判断获取到的UID是否为空，确保正确获取到UID
if [ -z "$UID" ]; then
    echo "没有获取到包名包含 $PKG 对应的 UID，您是否安装了 MC 教育版？"
    exit=true
fi

# 能否执行jq命令
if ! command -v jq > /dev/null; then
    echo "没有找到命令 jq，您需要安装它。推荐的做法是使用 Termux 执行这个脚本"
    exit=true
fi

# 检测完整性这部分鸽了，应该不会有人只解压这个脚本吧

# 是否出现过错误
if [ "$exit" = "true" ]; then exit 1; fi

# 复制资源包并设置权限
echo "正在复制资源包"
mkdir -p "$packdir"
cp -rf "$DIR/mcpack" "$packdir"
chown -R "$UID:$UID" "$packdir"
find "$packdir" -type d -exec chmod 700 {} \;
find "$packdir" -type f -exec chmod 600 {} \;

# 启用资源包
echo "正在启用资源包"
mkdir -p "${jsonfile%/*}"
jq -s '.[0] + .[1] | unique_by(.pack_id)' "$DIR/global_resource_packs.json" "$jsonfile" > "$jsonfile.swap"
mv -f "$jsonfile.swap" "$jsonfile"

echo "完成"