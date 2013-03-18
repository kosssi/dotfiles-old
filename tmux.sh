#!/bin/bash

create_tmux_project() {
    tmux new-window -t $1:$2 -n $3
    tmux send-keys -t $1:$2 "cd $4; clear" C-m
    tmux split-window -t $1:$2 -h -p 25
    tmux send-keys -t $1:$2 "cd $4; clear" C-m
    tmux split-window -t $1:$2 -v -p 66
    tmux send-keys -t $1:$2 "cd $4; clear" C-m
    tmux split-window -t $1:$2 -v -p 50
    tmux send-keys -t $1:$2 "cd $4; clear" C-m
    tmux attach-session -t $1
}

create_tmux_project_nbi() {
    create_tmux_project home 2 nbi ~/dev/projects/nosBelIdees
}

create_tmux_project_lodp() {
    create_tmux_project home 2 lodp ~/dev/projects/lesoiseauxdepassage
}

create_tmux_project_fatumfatras() {
    create_tmux_project home 2 fatumfatras ~/dev/projects/fatumfatras
}

if [ -z "$TMUX" ]
then
    tmux new-session -d -s home

    # pro
    if [ $USER = 'simonc' ]
    then
        create_tmux_project_nbi
    fi

    # perso
    if [ $USER = 'kosssi' ]
    then
        create_tmux_project_lodp
        create_tmux_project_fatumfatras
    fi
fi
