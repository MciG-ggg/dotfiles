# tx-proj — attach to (or create) a tmux session named after the current directory.
# Usage:  cd ~/Projects/myapp  &&  tx-proj
#   - First run:  creates session "proj-myapp" in $PWD
#   - Later runs: reattaches the same session
#   - Works correctly whether invoked from inside or outside tmux
#   - Safe with dotted dirs / spaces (prefixed with "proj-")

function tx-proj
    set -l name "proj-"(basename $PWD)

    # Ensure the target session exists. When called from inside tmux,
    # create it detached so we don't end up with a nested foreground session.
    if not tmux has-session -t "$name" 2>/dev/null
        tmux new-session -d -s "$name" -c "$PWD"
    end

    # Inside an existing tmux server: switch the current client to the target.
    # Outside tmux: attach a fresh client. Avoids "sessions should be nested".
    if set -q TMUX
        tmux switch-client -t "$name"
    else
        tmux attach-session -t "$name"
    end
end
