# Tmux shortcuts
# Files in conf.d/ are auto-loaded by fish on startup.
# See: ~/.config/fish/functions/tx-proj.fish for the smart attach function.

# ta — attach to most recent session
function ta
    tmux a $argv
end

# tn <name> — new named session
function tn
    tmux new -s $argv
end

# tl — list all sessions
function tl
    tmux ls
end

# tk <name> — kill a session
function tk
    tmux kill-session -t $argv
end
