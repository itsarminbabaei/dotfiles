# Enhanced branch cleanup with intelligent review
function gcleanup
    gum style "Enhanced Branch Cleanup" --foreground 212 --bold
    echo ""
    
    # Show current branch status
    gum style "Current Branch Status:" --foreground 2 --bold
    git branch -a | head -20
    
    echo ""
    gum style "Analyzing branches..." --foreground 3 --bold
    
    # Get merged branches (excluding main and beta)
    set merged_branches (git branch --merged main | grep -v "main" | grep -v "beta" | sed 's/^[ \t]*//' | tr '\n' ' ')
    set unmerged_branches (git branch --no-merged main | sed 's/^[ \t]*//' | tr '\n' ' ')
    
    echo ""
    gum style "Merged Branches (Safe to delete):" --foreground 2 --bold
    if test -n "$merged_branches"
        for branch in $merged_branches
            echo "  • $branch"
        end
    else
        echo "  No merged branches to clean up"
    end
    
    echo ""
    gum style "Unmerged Branches (Keep for review):" --foreground 3 --bold
    if test -n "$unmerged_branches"
        for branch in $unmerged_branches
            echo "  • $branch"
        end
    else
        echo "  No unmerged branches"
    end
    
    echo ""
    if test -n "$merged_branches"
        gum style "Cleanup Options:" --foreground 212 --bold
        set cleanup_choice (gum choose "Delete All Merged" "Selective Delete" "Review Each Branch" "Skip Cleanup")
        
        switch $cleanup_choice
            case "Delete All Merged"
                if gum confirm "Delete all $(echo "$merged_branches" | wc -l) merged branches?"
                    for branch in $merged_branches
                        git branch -d "$branch"
                    end
                    gum style "Cleaned up $(echo "$merged_branches" | wc -l) merged branches" --foreground 2 --bold
                else
                    gum style "Cleanup cancelled" --foreground 1
                end
                
            case "Selective Delete"
                set branches_to_delete (echo "$merged_branches" | gum choose --no-limit)
                if test -n "$branches_to_delete"
                    if gum confirm "Delete selected branches?"
                        # Split the selected branches (gum choose returns space-separated)
                        for branch in (echo "$branches_to_delete" | tr ' ' '\n')
                            git branch -d "$branch"
                            gum style "Deleted: $branch" --foreground 2
                        end
                    end
                else
                    gum style "No branches selected" --foreground 1
                end
                
            case "Review Each Branch"
                for branch in $merged_branches
                    echo ""
                    gum style "Reviewing: $branch" --foreground 3 --bold
                    
                    # Show last commit info
                    set last_commit (git log --oneline -1 "$branch")
                    set commit_date (git log -1 --format=%cd --date=short "$branch")
                    echo "  Last commit: $last_commit"
                    echo "  Date: $commit_date"
                    
                    if gum confirm "Delete branch: $branch?"
                        git branch -d "$branch"
                        gum style "Deleted: $branch" --foreground 2
                    else
                        gum style "Kept: $branch" --foreground 3
                    end
                end
                
            case "Skip Cleanup"
                gum style "Cleanup skipped" --foreground 3
        end
    else
        gum style "No cleanup needed - all branches are up to date!" --foreground 2 --bold
    end
    
    echo ""
    gum style "Unmerged Branch Review:" --foreground 212 --bold
    if test -n "$unmerged_branches"
        gum style "These branches have unmerged changes:" --foreground 3
        for branch in $unmerged_branches
            echo "  • $branch"
        end
        echo ""
        if gum confirm "Review unmerged branches in detail?"
            for branch in $unmerged_branches
                echo ""
                gum style "Branch: $branch" --foreground 3 --bold
                set commits_ahead (git rev-list --count main.."$branch")
                set commits_behind (git rev-list --count "$branch"..main)
                echo "  Commits ahead of main: $commits_ahead"
                echo "  Commits behind main: $commits_behind"
                
                if test $commits_ahead -gt 0
                    echo "  Recent commits:"
                    git log --oneline -3 "$branch" | sed 's/^/    /'
                end
            end
        end
    else
        gum style "No unmerged branches - everything is clean!" --foreground 2 --bold
    end
    
    echo ""
    gum style "Cleanup Summary:" --foreground 212 --bold
    set remaining_branches (git branch | grep -v "main" | wc -l)
    echo "  Remaining branches: $remaining_branches"
    echo "  Current branch: $(git branch --show-current)"
    
    if test -n "$merged_branches"
        set deleted_count (echo "$merged_branches" | wc -l)
        gum style "Cleanup complete! Repository is now cleaner." --foreground 2 --bold
    end
end
