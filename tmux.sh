#!/bin/bash
# This should work whether you are already in a TMUX session or not...
# Irssi directory is assumed to be in the user's home dir

create_tmux_project() {
    tmux new-window -t $1:$2 -n $3
    tmux split-window -t $1:$2 -h -p 25
    tmux split-window -t $1:$2 -v -p 66
    tmux split-window -t $1:$2 -v -p 50
    tmux send-keys -t $1:$2 C+t
    tmux attach-session -t $1
}


if [ -z "$TMUX" ]
then
    tmux new-session -d -s home
    create_tmux_project home 2 lodp
fi
