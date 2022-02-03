# syntax=docker/dockerfile:1

# 选择最新版本的 ubunut
FROM ubuntu

# 安装 gosu
RUN apt-get update && apt-get -y --no-install-recommends install \
	gnupg \	
    ca-certificates \
    curl
RUN gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.14/gosu-$(dpkg --print-architecture)" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.14/gosu-$(dpkg --print-architecture).asc" \
    && gpg --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu\
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu

# 指定容器启动时运行的脚本，并添加可执行权限
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# 安装编译Linux内核所需要的工具
RUN apt-get update && apt-get -y --no-install-recommends install \
    gcc \
    automake \
    autoconf \
    libtool \
    make \
    gcc-arm-linux-gnueabihf \
    gcc-aarch64-linux-gnu \
    flex \
    bison \
    libncurses5-dev \
    libssl-dev \
    bc
# 指定工作目录
WORKDIR /workdir/

# 传递给 ENTRYPOINT 的参数
CMD ["/bin/bash"]
