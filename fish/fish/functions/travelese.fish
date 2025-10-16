# Enhanced tmux session for Travelese development
function travelese
    set session_name "travelese"
    
    # Check if session already exists
    if tmux has-session -t $session_name 2>/dev/null
        gum style "Session '$session_name' already exists" --foreground 3
        if gum confirm "Attach to existing session?"
            tmux attach-session -t $session_name
            return
        else
            gum style "Cancelled" --foreground 1
            return
        end
    end
    
    # Create new tmux session
    gum spin --title "Creating tmux session..." -- tmux new-session -d -s $session_name
    
    # Window 1: System monitoring with tiptop
    tmux rename-window -t $session_name:1 "monitor"
    tmux send-keys -t $session_name:1 'tiptop' C-m
    
    # Window 2: nvim from ~/dev
    tmux new-window -t $session_name:2 -n "nvim" -c "$HOME/dev"
    tmux send-keys -t $session_name:nvim 'nvim' C-m
    
    # Window 3: CLI
    tmux new-window -t $session_name:3 -n "cli"
    
    # Attach to session
    tmux attach-session -t $session_name
end
