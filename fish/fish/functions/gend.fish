# Enhanced end of day with branch info
function gend
    # Get current branch info
    set current_branch (git branch --show-current)
    
    if test -z "$current_branch"
        gum style "Not in a git repository" --foreground 1
        return 1
    end
    
    # Try to get branch info from skate
    if type -q skate
        set branch_type (skate get "current-branch-type")
        set app_package (skate get "current-app-package")
    end
    
    # Extract info from branch name if skate doesn't have it
    if test -z "$branch_type"
        set branch_type (echo "$current_branch" | cut -d'/' -f1)
    end
    
    if test -z "$app_package"
        set app_package (echo "$current_branch" | cut -d'/' -f2 | cut -d'-' -f1-2)
    end
    
    # Show current status
    gum style "End of Day Summary" --foreground 212 --bold
    echo ""
    gum style "Branch: $current_branch" --foreground 2
    gum style "Type: $branch_type" --foreground 3
    gum style "Scope: $app_package" --foreground 3
    echo ""
    
    # Show git status
    gum style "Current Changes:" --foreground 2 --bold
    git status --porcelain
    
    echo ""
    
    # Confirm end of day commit
    if not gum confirm "Create end of day commit and push?"
        gum style "End of day cancelled" --foreground 1
        return 1
    end
    
    # Commit and push with style
    gum spin --title "Creating end of day commit..." -- git add .
    git commit -m "wip - $current_branch - end of day"
    git push origin "$current_branch"
    
    # Store end of day info
    if type -q skate
        skate set "last-end-time" (date)
        skate set "last-branch" "$current_branch"
    end
    
    echo ""
    gum style "End of day commit pushed!" --foreground 2 --bold
    gum style "Branch: $current_branch" --foreground 2
end