# docker-fedora-vnc
Docker buid for fedora with vnc

# VNC help

open xstartup

```
vim ~/.vnc/xstartup
```

setup

```
#!/bin/sh

xrdb $HOME/.Xresources
startxfce4 &
```

# Steps

see http://www.terwergreen.com/post-dark/7871.html
