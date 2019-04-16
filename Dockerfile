#依赖的镜像
FROM fedora:29
#镜像创建者的信息
LABEL maintainer="Terwer Green <cbgtyw@gmail.com>"

### Envrionment config
ENV LANG=C.UTF-8 \
    TZ=Asia/Shanghai \
    TZ=CST-8 \
    USER=terwer

# 添加网易源
RUN rm -rf /etc/yum.repos.d/* \
    && curl -o /etc/yum.repos.d/fedora.repo http://mirrors.163.com/.help/fedora-163.repo \
    && curl -o /etc/yum.repos.d/fedora-updates.repo http://mirrors.163.com/.help/fedora-updates-163.repo \
    && dnf clean all \
    && dnf makecache \
&& echo "mirror set finished." \
&& dnf install passwd -y \
&& echo "package install finished." 

# 创建用户
RUN useradd -m -g root terwer \
    && echo "$USER:123456" | chpasswd

# 安装xfce-desktop、VNC
RUN dnf groupinstall -y "Xfce Desktop" \
    && dnf install @developer-workstation-environment -y \
    && dnf install tigervnc-server -y

# 容器入口
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["bash", "/entrypoint.sh"]
