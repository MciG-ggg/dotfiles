# 设置 PATH 环境变量
fish_add_path /usr/local/bin
fish_add_path /usr/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin
fish_add_path /opt/nvim-linux-x86_64/bin
fish_add_path $HOME/go/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive # Commands to run in interactive sessions can go here

    # Run fastfetch on shell startup
    # fastfetch

    # No greeting
    set fish_greeting

    # Use starship
    starship init fish | source
    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end
    atuin init fish | source

    # start zoxide
    zoxide init fish | source

    # Aliases
    alias pamcan pacman
    alias ls 'eza --icons'
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias q 'qs -c ii'
    alias bat batcat
    alias vibe-kanban 'npx vibe-kanban'

end


# 验证代理状态的快捷命令 (可选)
function proxy_check
    curl -I https://www.google.com
end

# 自动获取 Windows 宿主机 IP
set -gx WINDOWS_HOST (string trim (cat /etc/resolv.conf | grep nameserver | awk '{print $2}'))

# 设置代理函数
function proxy_on
    set -gx http_proxy "http://$WINDOWS_HOST:7897"
    set -gx https_proxy "http://$WINDOWS_HOST:7897"
    set -gx all_proxy "socks5://$WINDOWS_HOST:7897"
    # echo "代理已开启: $http_proxy"
end
proxy_on

function proxy_off
    set -e http_proxy
    set -e https_proxy
    set -e all_proxy
    echo 代理已关闭
end

# nvm setup
if status is-interactive
    # 强制切换到已下载的最新的版本
    nvm use latest --silent
end
atuin init fish | source
set -gx BROWSER "/mnt/c/Windows/System32/cmd.exe /c start"
set -gx UV_INDEX_URL "https://pypi.tuna.tsinghua.edu.cn/simple"

# opencode
fish_add_path /home/mcig/.opencode/bin

set -gx PATH "/home/mcig/.pixi/bin" $PATH
