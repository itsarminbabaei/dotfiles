# Enhanced morning routine with Travelese branding and Daily Stoic

function gmorning
    # --- Configuration ---
    set daily_stoic_file ~/dev/daily-stoic.txt

    # --- Main ---
    _gmorning_header
    _gmorning_stoic_quote $daily_stoic_file
    _gmorning_git_status
    _gmorning_daily_focus
    _gmorning_footer
end

# --- Helper Functions ---

function _gmorning_header
    gum style "Good Morning! $USER" --foreground 212 --bold
    printf "\n"
    printf "      ████████╗██████╗  █████╗ ██╗   ██╗███████╗██╗     ███████╗███████╗███████╗\n"
    printf "      ╚══██╔══╝██╔══██╗██╔══██╗██║   ██║██╔════╝██║     ██╔════╝██╔════╝██╔════╝\n"
    printf "         ██║   ██████╔╝███████║██║   ██║█████╗  ██║     █████╗  ███████╗█████╗  \n"
    printf "         ██║   ██╔══██╗██╔══██║╚██╗ ██╔╝██╔══╝  ██║     ██╔══╝  ╚════██║██╔══╝  \n"
    printf "         ██║   ██║  ██║██║  ██║ ╚████╔╝ ███████╗███████╗███████╗███████║███████╗\n"
    printf "         ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝\n"
    printf "\n"
end

function _gmorning_stoic_quote
    set -l file $argv[1]
    set -l today_date_formatted (bun -e "import { format } from 'date-fns'; console.log(format(new Date(), 'MMMM do, yyyy'))")
    set -l today_date_pattern (bun -e "import { format } from 'date-fns'; console.log(format(new Date(), 'MMMM do'))")

    gum style "Daily Stoic - $today_date_formatted" --foreground 3 --bold
    echo ""

    if not test -f $file
        echo "  Daily Stoic text file not found at $file"
        return 1
    end

    # Use awk to find the entry and extract the relevant lines.
    # This is more robust than the previous grep/sed pipeline.
    set -l entry (awk -v date="$today_date_pattern" ' 
        BEGIN { p = 0 }
        $0 ~ date { p = 1 }
        p > 0 && p <= 11 { print; p++ }
    ' $file)

    if test -z "$entry"
        echo "  Could not find Daily Stoic entry for $today_date_pattern"
        return 1
    end

    # Extract title, quote, and author
    set -l title (echo "$entry" | sed -n '2p' | string trim)
    set -l quote (echo "$entry" | sed -n '4p' | string trim)
    set -l author (echo "$entry" | sed -n '6p' | string trim)

    if test -n "$title" -a -n "$quote"
        set -l current_month (bun -e "import { format } from 'date-fns'; console.log(format(new Date(), 'MMMM'))")
        set -l monthly_theme (_gmorning_get_monthly_theme $current_month)

        gum style "$title" --foreground 6 --bold
        gum style "Monthly Theme: $monthly_theme" --foreground 5
        echo "  $quote"
        if test -n "$author"
            echo "  $author"
        end
    else
        echo "  Could not parse Daily Stoic entry for $today_date_pattern"
    end
    echo ""
end

function _gmorning_get_monthly_theme
    set -l month $argv[1]
    switch $month
        case January
            echo "CLARITY"
        case February
            echo "PASSIONS AND EMOTIONS"
        case March
            echo "AWARENESS"
        case April
            echo "UNBIASED THOUGHT"
        case May
            echo "RIGHT ACTION"
        case June
            echo "PROBLEM SOLVING"
        case July
            echo "DUTY"
        case August
            echo "PRAGMATIC WISDOM"
        case September
            echo "FORTITUDE AND RESILIENCE"
        case October
            echo "VANITY AND PRIDE"
        case November
            echo "ACCEPTANCE / AMOR FATI"
        case December
            echo "MEDITATION ON DEATH"
    end
end

function _gmorning_git_status
    gum style "Git Status & Yearly Progress" --foreground 2 --bold
    if git rev-parse --git-dir >/dev/null 2>&1
        set -l current_branch (git branch --show-current)
        set -l branch_status (git status --porcelain | wc -l | string trim)

        # Yearly progress
        set -l year_progress (bun -e "import { getDayOfYear } from 'date-fns'; console.log(Math.round(getDayOfYear(new Date()) / 3.65))" | string match -r '\d+')
        set -l year_remaining (math 100 - $year_progress)
        set -l progress_bar (_gmorning_create_progress_bar $year_progress)

        # Monthly stats
        set -l month_start (bun -e "import { startOfMonth, format } from 'date-fns'; console.log(format(startOfMonth(new Date()), 'yyyy-MM-dd'))")
        set -l total_commits (git log --since="$month_start" --oneline | wc -l | string trim)
        set -l commit_days (git log --since="$month_start" --pretty=format:"%ad" --date=short | sort -u | wc -l | string trim)
        set -l current_day (bun -e "import { getDate } from 'date-fns'; console.log(getDate(new Date()))")
        set -l missed_days (math $current_day - $commit_days)

        # Annual stats
        set -l year_start (bun -e "import { startOfYear, format } from 'date-fns'; console.log(format(startOfYear(new Date()), 'yyyy-MM-dd'))")
        set -l annual_commits (git log --since="$year_start" --oneline | wc -l | string trim)
        set -l annual_days (git log --since="$year_start" --pretty=format:"%ad" --date=short | sort -u | wc -l | string trim)

        gum style "Branch: $current_branch | Uncommitted: $branch_status files | Year: $year_progress% done ($year_remaining% left)" --foreground 7
        gum style "Progress: [$progress_bar] $year_progress%" --foreground 4
        gum style "This month: $total_commits commits, $commit_days/$current_day active days, $missed_days missed | Annual: $annual_commits commits, $annual_days active days" --foreground 7
    else
        gum style "Not in a git repository" --foreground 3
    end
    echo ""
end

function _gmorning_create_progress_bar
    set -l percentage $argv[1]
    set -l num_bars (math "round($percentage * 20 / 100)")
    set -l progress_bar ""
    for i in (seq 1 20)
        if test $i -le $num_bars
            set progress_bar "$progress_bar█"
        else
            set progress_bar "$progress_bar░"
        end
    end
    echo $progress_bar
end

function _gmorning_daily_focus
    gum style "Daily Focus" --foreground 212 --bold
    echo "What's your main goal for today?"
    set -l daily_focus (gum input --placeholder "Enter your focus for today...")

    if test -n "$daily_focus"
        if type -q skate
            skate set "daily-focus" "$daily_focus"
            skate set "focus-date" (bun -e "import { format } from 'date-fns'; console.log(format(new Date(), 'yyyy-MM-dd'))")
        end
        echo ""
        gum style "Focus set: $daily_focus" --foreground 2
    end
end

function _gmorning_footer
    echo ""
    gum style "Ready to build something amazing!" --foreground 212 --bold
    echo ""
end
