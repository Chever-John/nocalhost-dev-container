ARG GO_VERSION=1.16

FROM golang:${GO_VERSION}-bullseye

# 创建一个非root用户，例如叫做developer
ARG USERNAME=developer
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG ROOTHOME=/home/$USERNAME

# 创建用户组和用户，并且赋予用户sudo权限
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# 设置环境变量HOME为新用户的家目录
ENV HOME=$ROOTHOME

# 安装必要的软件包
RUN apt-get update \
    && apt-get install --force-yes -y ca-certificates curl \
           build-essential gcc g++ \
           tzdata zip unzip vim wget \
           git openssh-client zsh bash net-tools tmux sudo wget \
    #
    # 清理不必要的文件
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# 修改时区
ENV TZ=Asia/Shanghai
RUN cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 将zsh设置为默认shell
RUN chsh -s /usr/bin/zsh

# 安装zsh及其插件
COPY ./zsh/zsh-in-docker.sh /tmp
RUN chmod +x /tmp/zsh-in-docker.sh && \
    /tmp/zsh-in-docker.sh \
    -a 'SPACESHIP_PROMPT_ADD_NEWLINE="false"' \
    -a 'SPACESHIP_PROMPT_SEPARATE_LINE="false"' \
    -p git \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p https://github.com/zsh-users/zsh-history-substring-search \
    -p https://github.com/zsh-users/zsh-syntax-highlighting \
    -p 'history-substring-search' \
    -a 'bindkey "\$terminfo[kcuu1]" history-substring-search-up' \
    -a 'bindkey "\$terminfo[kcud1]" history-substring-search-down'

# 安装Go调试工具
RUN go install github.com/go-delve/delve/cmd/dlv@latest

# 复制本地配置到p10k zsh和tmux
COPY ./zsh/.p10k.zsh $ROOTHOME/
COPY ./zsh/.tmux.conf $ROOTHOME/

# 切换到非root用户
USER $USERNAME

# 设置工作目录为非root用户的家目录
WORKDIR $ROOTHOME

# 设置入口点和默认命令
ENTRYPOINT [ "/bin/zsh" ]
CMD ["-l"]