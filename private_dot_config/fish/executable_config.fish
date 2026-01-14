# 设置 PATH 环境变量
set -gx PATH $HOME/.cargo/bin $HOME/.npm-global/bin $HOME/.local/bin $HOME/.nix-profile/bin /opt/nvim-linux-x86_64/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/games /usr/local/games /snap/bin

function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive # Commands to run in interactive sessions can go here

    # Run fastfetch on shell startup
    fastfetch

    # No greeting
    set fish_greeting

    # Use starship
    starship init fish | source
    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end

    # start zoxide
    zoxide init fish | source

    # Aliases
    alias pamcan pacman
    alias ls 'eza --icons'
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias q 'qs -c ii'
    alias claude '/home/mcig/.npm-global/bin/claude'
    alias bat batcat
    alias vibe-kanban 'npx vibe-kanban'

end

set -gx PATH /usr/local/bin /usr/bin $PATH
