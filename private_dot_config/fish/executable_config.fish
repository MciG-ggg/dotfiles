

# >>> mavis-managed: minimax-code-cli >>>
# Fish doesn't read ~/.bashrc / ~/.zshrc, so fish users don't pick up
# the PATH that MiniMax Code adds there. Mirror it explicitly.
fish_add_path -g /Users/mcig/.mavis/bin
# <<< mavis-managed: minimax-code-cli <<<

# >>> codex-managed: homebrew-starship >>>
# Ensure Homebrew commands are available when fish is the login shell.
fish_add_path -g /opt/homebrew/bin /opt/homebrew/sbin

# Enable Starship prompt for interactive fish sessions.
if status is-interactive
    starship init fish | source
end
# <<< codex-managed: homebrew-starship <<<

# Flutter SDK
fish_add_path -g /Users/mcig/flutter/bin

# >>> codex-managed: flutter-android-env >>>
# Flutter / Android SDK / Java for Flutter development.
set -gx JAVA_HOME /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home
set -gx ANDROID_HOME $HOME/Library/Android/sdk
set -gx ANDROID_SDK_ROOT $ANDROID_HOME
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
fish_add_path -g /Users/mcig/flutter/bin
fish_add_path -g /opt/homebrew/opt/openjdk@17/bin
fish_add_path -g $ANDROID_HOME/platform-tools $ANDROID_HOME/emulator $ANDROID_HOME/cmdline-tools/latest/bin
fish_add_path -g /Library/TeX/texbin
# <<< codex-managed: flutter-android-env <<<

# >>> codex-managed: local-cli-proxy >>>
# Use Clash Verge's local mixed HTTP proxy for CLI tools when TUN is off.
# This keeps Flutter/Gradle/Git network checks working without affecting localhost.
if command -q nc; and nc -z 127.0.0.1 7897 >/dev/null 2>&1
    set -gx http_proxy http://127.0.0.1:7897
    set -gx https_proxy http://127.0.0.1:7897
    set -gx HTTP_PROXY $http_proxy
    set -gx HTTPS_PROXY $https_proxy
    set -gx ALL_PROXY http://127.0.0.1:7897
    set -gx no_proxy localhost,127.0.0.1,::1
    set -gx NO_PROXY $no_proxy
end
# <<< codex-managed: local-cli-proxy <<<
export PATH="$HOME/.local/bin:$PATH"
zoxide init fish | source

# colima docker socket
set -gx DOCKER_HOST unix:///Users/mcig/.colima/default/docker.sock
