#  前言
使用Homebrew安装的mpv播放器默认没有图形界面入口，原来的生成链接的命令 `brew linkapps mpv` 被Homebrew废除。用了其它一些生成链接的方法也不成功。另外，也有说 `brew cask install` 的，但还是遇到问题。于是写了这个简单的小程序。`功能仅是拖拽文件到窗口，调用Homebrew已安装好的mpv。`有简单的检测已安装的最新版本的逻辑。可以看作是macOS Cocoa Drag and Drop的小例子。

# 说明
需要macOS 10.13及以上系统。如果没有错误发生，文件拖到其界面调用mpv播放后。本程序会自动退出。
![](screenshot.png)
图片来源：
[優子さん～](https://www.pixiv.net/member_illust.php?mode=medium&illust_id=45314988)

# 确保已用Homebrew安装好mpv播放器
以下是我使用的完全安装命令
## 安装Homebrew
``` shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
## 先安装ffmpeg，使用已编译好的版本，不用本地编译
``` shell
brew install --force-bottle ffmpeg --with-chromaprint --with-fdk-aac --with-fontconfig --with-freetype --with-frei0r --with-game-music-emu --with-libass --with-libbluray --with-libbs2b --with-libcaca --with-libgsm --with-libmodplug --with-librsvg --with-libsoxr --with-libssh --with-libvidstab --with-libvorbis --with-libvpx --with-opencore-amr --with-openh264 --with-openjpeg --with-openssl --with-opus --with-rtmpdump --with-rubberband --with-schroedinger --with-sdl2 --with-snappy --with-speex --with-srt --with-tesseract --with-theora --with-tools --with-two-lame --with-wavpack --with-webp --with-x265 --with-xz --with-zeromq --with-zimg
```
想要下载源码本地编译的话，自行去掉 `--force-bottle`

## 安装mpv
``` shell
brew install --force-bottle mpv --with-bundle --with-jack --with-libaacs --with-libarchive --with-libbluray --with-libcaca --with-libdvdnav --with-libdvdread --with-pulseaudio --with-rubberband --with-uchardet --with-vapoursynth
```
想要下载源码本地编译的话同理

## mpv 配置文件
安装好后会运行第一次退出会生成 ~/.config/mpv
我使用的是 [Argon-mpv-config](https://github.com/Argon-/mpv-config)

其中有的脚本只有空链接，需要自己下载。需要下载的脚本如下：
[mpv-scripts](https://github.com/wm4/mpv-scripts) ，
[mpv-repl](https://github.com/rossy/mpv-repl) ，
[mpv-stats](https://github.com/Argon-/mpv-stats/releases) 。
以上文件放到配置的scripts文件夹 。

[FineSharp.glsl](https://gist.github.com/igv/a9a21ad1f6dd7d0b4452) ，
[SSimDownscaler.glsl](https://gist.github.com/igv/36508af3ffc84410fe39761d6969be10) ，
[SSimSuperRes.glsl](https://gist.github.com/igv/2364ffa6e81540f29cb7ab4c9bc05b6b) ，
[adaptive-sharpen.glsl](https://gist.github.com/igv/8a77e4eb8276753b54bb94c1c50c317e) 。
以上文件放到配置的shaders文件夹 。

[mpv-prescalers](https://github.com/bjin/mpv-prescalers/tree/master) ，
prescalers的文件里，只需要nnedi3-nns32-win8x4.hook、nnedi3-nns64-win8x4.hook、ravu-lite-r3.hook、ravu-r3-rgb.hook、ravu-r3.hook ，也放到配置的shaders文件夹 。

## 如果想卸载Homebrew
``` shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
```
