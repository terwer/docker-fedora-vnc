# 修改工作空间
CURDIR=/home/$USER
cd $CURDIR
echo "Change workspace to $CURDIR=>" && pwd && whoami

# 关闭VNC
vncserver -kill :1
# 修改VNC连接配置
# 启动VNCServer
vncserver

echo "finished."
bash