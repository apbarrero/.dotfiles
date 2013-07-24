#!/usr/bin/zsh

# Verbose output for pgrep
function pg()
{
    PIDS=`pgrep $1`
    if [ -z "$PIDS" ]; then
        echo "No processes matching $1"
        return 1
    else
        echo "$PIDS" | xargs ps -fp
    fi
}

