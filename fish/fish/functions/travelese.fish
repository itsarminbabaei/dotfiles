# Enhanced tmux session for Travelese development
function travelese
    set session_name "travelese"

    # Show beautiful startup message with Travelese branding
    gum style "Starting Travelese Development Session" --foreground 212 --bold
    echo ""
    echo "      ████████╗██████╗  █████╗ ██╗   ██╗███████╗██╗     ███████╗███████╗███████╗"
    echo "      ╚══██╔══╝██╔══██╗██╔══██╗██║   ██║██╔════╝██║     ██╔════╝██╔════╝██╔════╝"
    echo "         ██║   ██████╔╝███████║██║   ██║█████╗  ██║     █████╗  ███████╗█████╗  "
    echo "         ██║   ██╔══██╗██╔══██║╚██╗ ██╔╝██╔══╝  ██║     ██╔══╝  ╚════██║██╔══╝  "
    echo "         ██║   ██║  ██║██║  ██║ ╚████╔╝ ███████╗███████╗███████╗███████║███████╗"
    echo "         ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝"
    echo ""
    
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
    
    # Window 2: nvim with enhanced setup
    tmux new-window -t $session_name:2 -n "nvim" -c "/Users/itsarminbabaei/dev/travelese"
    tmux send-keys -t $session_name:nvim 'nvim' C-m
    
    # Window 3: Development shell
    tmux new-window -t $session_name:3 -n "dev"
    tmux send-keys -t $session_name:dev "cd /Users/itsarminbabaei/dev/travelese" Enter
    
    # Window 4: API testing and development
    tmux new-window -t $session_name:4 -n "api"
    tmux send-keys -t $session_name:api "cd /Users/itsarminbabaei/dev/travelese" Enter
    
    # Window 5: Database (Supabase)
    tmux new-window -t $session_name:5 -n "db"
    tmux send-keys -t $session_name:db "cd /Users/itsarminbabaei/dev/travelese/apps/api" Enter
    tmux send-keys -t $session_name:db "sleep 30" Enter
    tmux send-keys -t $session_name:db "supabase status" Enter
    
    # Set up window navigation
    tmux select-window -t $session_name:dev
    
    # Show session summary
    echo ""
    gum style "Tmux session created with 6 windows:" --foreground 2 --bold
    gum style "  1. monitor - System monitoring (tiptop)" --foreground 3
    gum style "  2. nvim - Code editor with enhanced setup" --foreground 3
    gum style "  3. dev - Development shell (starts with gmorning)" --foreground 3
    gum style "  4. api - API testing and development" --foreground 3
    gum style "  5. db - Database (Supabase)" --foreground 3
    echo ""
    gum style "Starting in 'dev' window..." --foreground 212 --bold
    

    # Attach to session
    tmux attach-session -t $session_name
end
