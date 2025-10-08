# Enhanced WIP commit with branch context
function gwip
    if test (count $argv) -eq 0
        set message (gum input --placeholder "Enter WIP message (e.g., 'working on user auth')")
        if test -z "$message"
            gum style "No message provided" --foreground 1
            return 1
        end
    else
        set message $argv[1]
    end
    
    # Get current branch
    set current_branch (git branch --show-current)
    
    if test -z "$current_branch"
        gum style "Not in a git repository" --foreground 1
        return 1
    end
    
    # Show what will be committed
    gum style "Changes to commit:" --foreground 2 --bold
    git status --porcelain
    
    echo ""
    gum style "Branch: $current_branch" --foreground 2
    gum style "Message: wip - $message" --foreground 3
    
    echo ""
    if not gum confirm "Create WIP commit?"
        gum style "WIP commit cancelled" --foreground 1
        return 1
    end
    
    # Create commit
    gum spin --title "Creating WIP commit..." -- git add .
    git commit -m "wip - $message"
    
    echo ""
    gum style "WIP commit created!" --foreground 2 --bold
    gum style "Message: wip - $message" --foreground 2
end