#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

# 根据容器运行时传递进来的用户 ID 来创建用户和用户组，并设置用户空间
USER_ID=${LOCAL_USER_ID:-9001}

echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -u $USER_ID -o -c "" -m user
usermod -a -G root user
export HOME=/home/user

# 修改工作目录文件夹所属用户和用户组
chown -R user.user /workdir/

exec /usr/local/bin/gosu user "$@"