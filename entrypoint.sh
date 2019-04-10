# 修改工作空间
CURDIR=/home/$USER
cd $CURDIR
echo "Change workspace to $CURDIR=>" && pwd && whoami

# 关闭VNC
if [ -d ~/.vnc ]; then
  vncserver -kill :1
fi
# 启动VNCServer
vncserver

echo "finished."
bash