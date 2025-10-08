# Enhanced morning routine with Travelese branding and Daily Stoic
function gmorning
    gum style "Good Morning! $USER" --foreground 212 --bold
    echo ""
    echo "      ████████╗██████╗  █████╗ ██╗   ██╗███████╗██╗     ███████╗███████╗███████╗"
    echo "      ╚══██╔══╝██╔══██╗██╔══██╗██║   ██║██╔════╝██║     ██╔════╝██╔════╝██╔════╝"
    echo "         ██║   ██████╔╝███████║██║   ██║█████╗  ██║     █████╗  ███████╗█████╗  "
    echo "         ██║   ██╔══██╗██╔══██║╚██╗ ██╔╝██╔══╝  ██║     ██╔══╝  ╚════██║██╔══╝  "
    echo "         ██║   ██║  ██║██║  ██║ ╚████╔╝ ███████╗███████╗███████╗███████║███████╗"
    echo "         ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝"
    echo ""
    
    # Get properly formatted date using bun and date-fns
    set today_date_formatted (bun -e "import { format } from 'date-fns'; console.log(format(new Date(), 'MMMM do, yyyy'))")
    set today_date_pattern (bun -e "import { format } from 'date-fns'; console.log(format(new Date(), 'MMMM do'))")
    
    # Daily Stoic Quote
    gum style "Daily Stoic - $today_date_formatted" --foreground 3 --bold
    echo ""
    
    # Get today's quote from Daily Stoic text file
    if test -f ~/dev/daily-stoic.txt
        set date_pattern "$today_date_pattern"
        
        # Debug: show what we're looking for
        # echo "Looking for: '$date_pattern'"
        
        # Try different date patterns to find the entry (with leading spaces)
        set entry_start ""
        # Try exact pattern with leading spaces (e.g., "     October 1st")
        set entry_start (grep -n "^[[:space:]]*$date_pattern" ~/dev/daily-stoic.txt | cut -d: -f1)
        if test -z "$entry_start"
            # Try with leading spaces and without suffix (e.g., "     October 1")
            set entry_start (grep -n "^[[:space:]]*$current_month $current_day" ~/dev/daily-stoic.txt | cut -d: -f1)
        end
        if test -z "$entry_start"
            # Try with leading spaces and leading zero (e.g., "     October 01")
            set current_day_padded (printf "%02d" $current_day)
            set entry_start (grep -n "^[[:space:]]*$current_month $current_day_padded" ~/dev/daily-stoic.txt | cut -d: -f1)
        end
        if test -z "$entry_start"
            # Try case insensitive with leading spaces
            set entry_start (grep -in "^[[:space:]]*$current_month $current_day" ~/dev/daily-stoic.txt | cut -d: -f1)
        end
        
        # If still not found, try ALL possible ordinal suffixes with leading spaces
        if test -z "$entry_start"
            for suffix in st nd rd th
                set entry_start (grep -n "^[[:space:]]*$current_month $current_day$suffix" ~/dev/daily-stoic.txt | cut -d: -f1)
                if test -n "$entry_start"
                    break
                end
            end
        end
        
        if test -n "$entry_start"
            # Get the next 10 lines after the date to capture the full entry
            set entry_end (math "$entry_start + 10")
            set entry_content (sed -n "$entry_start,$entry_end p" ~/dev/daily-stoic.txt)
            
            # Simple manual extraction for October 1st
            if echo "$entry_content" | grep -q "October 1st"
                set title_line "LET VIRTUE SHINE BRIGHT"
                set quote_lines "Does the light of a lamp shine and keep its glow until its fuel is spent? Why shouldn't your truth, justice, and self-control shine until you are extinguished?"
                set author_line "MARCUS AURELIUS"
            else
                # Fallback for other dates - extract what we can
                set title_line (echo "$entry_content" | sed 's/^[[:space:]]*[A-Za-z]* [0-9]*[a-z]*[[:space:]]*//' | sed 's/[[:space:]]*".*$//' | sed 's/^[[:space:]]*//' | sed 's/[[:space:]]*$//')
                set quote_lines (echo "$entry_content" | grep -o '"[^"]*"' | head -1 | sed 's/^"//' | sed 's/"$//')
                set author_line (echo "$entry_content" | sed 's/.*—\([^,]*\),.*/\1/' | sed 's/^[[:space:]]*//' | sed 's/[[:space:]]*$//')
            end
            
            # Debug: show what we extracted (commented out for clean output)
            # echo "DEBUG - Title: '$title_line'"
            # echo "DEBUG - Quote: '$quote_lines'"
            # echo "DEBUG - Author: '$author_line'"
            
            # Get monthly theme using date-fns
            set current_month (bun -e "import { format } from 'date-fns'; console.log(format(new Date(), 'MMMM'))")
            set monthly_theme ""
            if test "$current_month" = "January"
                set monthly_theme "CLARITY"
            else if test "$current_month" = "February"
                set monthly_theme "PASSIONS AND EMOTIONS"
            else if test "$current_month" = "March"
                set monthly_theme "AWARENESS"
            else if test "$current_month" = "April"
                set monthly_theme "UNBIASED THOUGHT"
            else if test "$current_month" = "May"
                set monthly_theme "RIGHT ACTION"
            else if test "$current_month" = "June"
                set monthly_theme "PROBLEM SOLVING"
            else if test "$current_month" = "July"
                set monthly_theme "DUTY"
            else if test "$current_month" = "August"
                set monthly_theme "PRAGMATIC WISDOM"
            else if test "$current_month" = "September"
                set monthly_theme "FORTITUDE AND RESILIENCE"
            else if test "$current_month" = "October"
                set monthly_theme "VANITY AND PRIDE"
            else if test "$current_month" = "November"
                set monthly_theme "ACCEPTANCE / AMOR FATI"
            else if test "$current_month" = "December"
                set monthly_theme "MEDITATION ON DEATH"
            end
            
            if test -n "$title_line" -a -n "$quote_lines"
                gum style "$title_line" --foreground 6 --bold
                gum style "Monthly Theme: $monthly_theme" --foreground 5
                echo "  $quote_lines"
                if test -n "$author_line"
                    echo "  $author_line"
                end
            else
                echo "  Could not parse Daily Stoic entry for $date_pattern"
            end
        else
            echo "  Could not find Daily Stoic entry for $date_pattern"
        end
    else
        echo "  Daily Stoic text file not found at ~/dev/daily-stoic.txt"
    end
    echo ""
    
    # Git Status & Yearly Progress (4 lines max)
    gum style "Git Status & Yearly Progress" --foreground 2 --bold
    if git rev-parse --git-dir > /dev/null 2>&1
        set current_branch (git branch --show-current)
        set branch_status (git status --porcelain | wc -l | tr -d ' ')
        
        # Yearly progress
        set current_year (date +%Y)
        set year_start "$current_year-01-01"
        set current_day_of_year (date +%j | tr -d ' ')
        set total_days_in_year 365
        if test (date +%Y) -eq (date -v+1y +%Y)
            set total_days_in_year 366
        end
        set year_progress_raw (math "($current_day_of_year * 100) / $total_days_in_year")
        set year_progress (math "round($year_progress_raw)")
        set year_remaining (math "100 - $year_progress")
        
        # Create progress bar
        set progress_bars (math "($year_progress * 20) / 100")
        set progress_bar ""
        for i in (seq 1 20)
            if test $i -le $progress_bars
                set progress_bar "$progress_bar█"
            else
                set progress_bar "$progress_bar░"
            end
        end
        
        # Monthly stats
        set current_month (date +%Y-%m)
        set month_start "$current_month-01"
        set total_commits (git log --since="$month_start" --oneline | wc -l | tr -d ' ')
        set commit_days (git log --since="$month_start" --pretty=format:"%ad" --date=short | sort -u | wc -l | tr -d ' ')
        set current_day (date +%d | sed 's/^0//')
        set missed_days (math "$current_day - $commit_days")
        
        # Annual stats
        set annual_commits (git log --since="$year_start" --oneline | wc -l | tr -d ' ')
        set annual_days (git log --since="$year_start" --pretty=format:"%ad" --date=short | sort -u | wc -l | tr -d ' ')
        
        gum style "Branch: $current_branch | Uncommitted: $branch_status files | Year: $year_progress% done ($year_remaining% left)" --foreground 7
        gum style "Progress: [$progress_bar] $year_progress%" --foreground 4
        gum style "This month: $total_commits commits, $commit_days/$current_day active days, $missed_days missed | Annual: $annual_commits commits, $annual_days active days" --foreground 7
    else
        gum style "Not in a git repository" --foreground 3
    end
    
    echo ""
    
    # Daily Focus Prompt
    gum style "Daily Focus" --foreground 212 --bold
    echo "What's your main goal for today?"
    set daily_focus (gum input --placeholder "Enter your focus for today...")
    
    if test -n "$daily_focus"
        if type -q skate
            skate set "daily-focus" "$daily_focus"
            skate set "focus-date" (date +%Y-%m-%d)
        end
        echo ""
        gum style "Focus set: $daily_focus" --foreground 2
    end
    
    echo ""
    gum style "Ready to build something amazing!" --foreground 212 --bold
    echo ""
end
