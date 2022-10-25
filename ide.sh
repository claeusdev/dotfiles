SESSION=dev

#create new session and window
tmux new-session -d -s $SESSION
tmux new-window -t $SESSION:1 -n 'webserver'

#create new window and cd into work folder
tmux select-window -t $SESSION:1
tmux split-window -h
tmux send-keys "work" C-m

# attach to session and window
tmux attach -t $SESSION
