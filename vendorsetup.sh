#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
# 关于橙狐变量详见 fox_12.1/vendor/recovery/orangefox_build_vars.txt

# Wehter to enable dynamic partition
    export ONEPLUS_DYNAMIC=true

	export TW_DEFAULT_LANGUAGE="zh_CN"
	export LC_ALL="C"
	export ALLOW_MISSING_DEPENDENCIES=true

	echo -e "\x1b[96mmondrian: 开始添加OrangeFox Vars...\x1b[m"
	## 构建信息
	# 设置显示在关于页面里的维护人员名称
	export OF_MAINTAINER=天拖保全丁文元
	# 设置版本号为日期
	export FOX_MAINTAINER_PATCH_VERSION=$(date +%y%m%d)
	# 当你需要标记出这个recovery是一个特殊版本时使用
	export FOX_VARIANT=5/5TUnifid

	## 添加功能
	# 使用完整版getprop命令
	export FOX_REPLACE_TOOLBOX_GETPROP=1
	# 支持tar命令
	export FOX_USE_TAR_BINARY=1
	# 支持sed命令
	export FOX_USE_SED_BINARY=1
	# 支持lz4命令
	export FOX_USE_LZ4_BINARY=1
	# 支持zstd命令
	export FOX_USE_ZSTD_BINARY=1
	# 使用bash代替sh和ash
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	# 添加橙狐的app管理器功能
	export FOX_ENABLE_APP_MANAGER=1
	# 使用完整版grep命令
	export FOX_USE_GREP_BINARY=1
	# 支持lzma, xz命令
	export FOX_USE_XZ_UTILS=1
	# 使用橙狐编译的NANO编辑器
	export FOX_USE_NANO_EDITOR=1
	# 添加phhusson's lptools工具
	export OF_ENABLE_LPTOOLS=1

	## 添加橙狐特殊处理
    # 支持5/5T
    export TARGET_DEVICE_ALT="cheeseburger"
    # 自动处理avb2.0
	export OF_PATCH_AVB20=1
	# 避免在已加密设备上应用强制加密补丁
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	# 防止橙狐在解密后重新运行自启动进程
	export OF_NO_RELOAD_AFTER_DECRYPTION=1
	# 禁用检查rom里的compatibility.zip
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	# 使用zip卡刷包的方式安装橙狐后不恢复橙狐的默认设置
	export FOX_RESET_SETTINGS=disabled
	# 删除zip包里的AromaFM（有的设备用不了）
	# export FOX_DELETE_AROMAFM=1

	## 硬件功能设定
	# 没有绿色led
	# export OF_USE_GREEN_LED=0
	# 关闭闪光灯功能
	# export OF_FLASHLIGHT_ENABLE=0
	# 自定义闪光灯路径，修复闪光灯
	# export OF_FL_PATH1=/sys/class/leds/led:torch_0
	# export OF_FL_PATH2=/sys/class/leds/led:torch_1

	## 界面显示设定
# 	export OF_STATUS_INDENT_LEFT="48"
# 	export OF_STATUS_INDENT_RIGHT="48"
# 	export OF_SCREEN_H=2340
	# 禁止禁用导航栏
	export OF_ALLOW_DISABLE_NAVBAR=0

	## 调整刷入zip刷机包时刷机脚本要检测的相关属性
# 	设置一个很老的build时间，用于解决某些ROM例如MIUI刷机脚本里的防回滚保护检测
# 	export FOX_BUGGED_AOSP_ARB_WORKAROUND="1546300800"; # Tuesday, January 1, 2019 12:00:00 AM GMT+00:00

	# 为“快速备份”指定默认选择的分区
	export OF_QUICK_BACKUP_LIST="/boot;/dtbo;"
	# 将装载逻辑分区时的一些错误仅显示在日志里
	export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
	# 禁用橙狐内置的magisk菜单
	# export FOX_DELETE_MAGISK_ADDON=1
	# 内置Magisk
	export FOX_MOVE_MAGISK_INSTALLER_TO_RAMDISK=1
	# 使用指定的magisk
	# export FOX_USE_SPECIFIC_MAGISK_ZIP="$HOME/Magisk.zip"
	# 使用指定的magisk版本号，由于magisk 23+使用了新的包装形式，文件路径改变了，橙狐无法获取正确的版本
	# export MAGISK_VER=26.1
	# 当修补recovery/boot镜像时，始终指示magiskboot v24+修补vbmeta标头（自动禁用avb验证？）
# 	export FOX_PATCH_VBMETA_FLAG=1
	# 在修复或格式化f2fs数据分区之前自动卸载绑定/sdcard
	export OF_UNBIND_SDCARD_F2FS=1
	# 设置默认时区为北京时间
	export OF_DEFAULT_TIMEZONE="TAIST-8;TAIDT"
	# 在gui初始化的早期阶段加载主题和设置（包括语言设置）
	export FOX_ALLOW_EARLY_SETTINGS_LOAD=1
	# 安装压缩包页面选项的最大数量，调小这个值会显示滚动条（大于4小于9时生效，默认为4）
	export OF_OPTIONS_LIST_NUM=9

	F=$(find "device" -maxdepth 2 -name "cheeseburger_dumpling")
	# 修改启动画面背景色为#000000(黑色)
	\cp -fp bootable/recovery/gui/theme/portrait_hdpi/splash.xml "$F"/recovery/root/twres/splash.xml
	sed -i 's/value="#D34E38"/value="#000000"/g' "$F"/recovery/root/twres/splash.xml
	sed -i 's/value="#FF8038"/value="#000000"/g' "$F"/recovery/root/twres/splash.xml

	echo -e "\x1b[96mcheeseburger_dumpling: 当你看到这个消息的时候，所有的OrangeFox Var已经添加完毕！\x1b[m"
