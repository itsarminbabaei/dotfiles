# Guided branch creation with monorepo support
function gstart
    gum style "Guided Branch Creation" --foreground 212 --bold
    echo ""
    
    # Step 1: Branch Type Selection
    gum style "Step 1: Select Branch Type" --foreground 2 --bold
    set branch_type (gum choose "feature" "fix" "hotfix" "refactor" "chore" "docs" "test" "release" "perf" "style" "ci" "build")
    
    # Step 2: Show description for selected type
    switch $branch_type
        case "feature"
            gum style "Feature: New functionality, enhancements, or capabilities" --foreground 2
        case "fix"
            gum style "Fix: Bug fixes and issue resolutions" --foreground 1
        case "hotfix"
            gum style "Hotfix: Critical production fixes that need immediate deployment" --foreground 1 --bold
        case "refactor"
            gum style "Refactor: Code restructuring without changing functionality" --foreground 3
        case "chore"
            gum style "Chore: Maintenance, dependencies, tooling, and housekeeping" --foreground 6
        case "docs"
            gum style "Docs: Documentation updates and improvements" --foreground 4
        case "test"
            gum style "Test: Testing improvements, coverage, and test infrastructure" --foreground 5
        case "release"
            gum style "Release: Release preparation and version management" --foreground 212
        case "perf"
            gum style "Perf: Performance improvements and optimizations" --foreground 11
        case "style"
            gum style "Style: Code style, formatting, and linting changes" --foreground 13
        case "ci"
            gum style "CI: Continuous Integration and deployment pipeline changes" --foreground 14
        case "build"
            gum style "Build: Build system, bundling, and compilation changes" --foreground 9
    end
    
    echo ""
    
    # Step 3: App/Package Selection
    gum style "Step 2: Select App/Package" --foreground 2 --bold
    set app_package (gum choose "apps/agencies" "apps/api" "apps/dashboard" "apps/desktop" "apps/directories" "apps/docs" "apps/engine" "apps/website" "packages/app-store" "packages/cache" "packages/categories" "packages/data" "packages/db" "packages/desktop-client" "packages/documents" "packages/email" "packages/encryption" "packages/engine-client" "packages/events" "packages/import" "packages/inbox" "packages/invoice" "packages/jobs" "packages/kv" "packages/location" "packages/logger" "packages/notifications" "packages/supabase" "packages/travel" "packages/ui" "packages/utils" "root" "multiple")
    
    # Step 4: Feature Description
    echo ""
    gum style "Step 3: Describe the $branch_type" --foreground 2 --bold
    set feature_description (gum input --placeholder "Enter description (e.g., user-authentication, payment-integration, api-optimization)")
    
    if test -z "$feature_description"
        gum style "No description provided" --foreground 1
        return 1
    end
    
    # Step 5: Generate branch name
    set branch_name "$branch_type/$app_package/$feature_description"
    
    # Clean up branch name (replace spaces with hyphens, keep slashes)
    set branch_name (echo "$branch_name" | sed 's/ /-/g' | tr '[:upper:]' '[:lower:]')
    
    echo ""
    gum style "Generated Branch Name:" --foreground 212 --bold
    gum style "$branch_name" --foreground 2 --bold
    
    # Step 6: Confirmation
    echo ""
    if not gum confirm "Create branch: $branch_name?"
        gum style "Branch creation cancelled" --foreground 1
        return 1
    end
    
    # Step 7: Create branch
    gum spin --title "Creating branch..." -- git checkout main
    git pull origin main
    git checkout -b "$branch_name"
    
    # Store branch info
    if type -q skate
        skate set "current-branch" "$branch_name"
        skate set "current-branch-type" "$branch_type"
        skate set "current-app-package" "$app_package"
        skate set "branch-start-time" (date)
    end
    
    echo ""
    gum style "Branch created successfully!" --foreground 2 --bold
    gum style "Branch: $branch_name" --foreground 2
    gum style "Type: $branch_type" --foreground 3
    gum style "Scope: $app_package" --foreground 3
    gum style "Description: $feature_description" --foreground 3
end