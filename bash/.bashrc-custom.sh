#Bash shell prompt setup

function _build_prompt {
    local error_state="$?"
    local blue_bg='\[\033[48;5;33m\]' # Blue background
    local gray_bg='\[\033[48;5;240m\]' # Gray background
    local green_bg='\[\033[48;5;2m\]'
    local white_fg='\[\033[38;5;15m\]' # White text
    local blue_fg='\[\033[38;5;33m\]' # Blue text
    local gray_fg='\[\033[38;5;240m\]' # Gray text
    local lightgray_fg='\[\033[38;5;255m\]' #Light gray text
    local green_fg='\[\033[38;5;2m\]'
    local red_fg='\[\033[38;5;1m\]' #Red text
    local bold='\[\033[1m\]'
    local reset='\[\033[0m\]'              # Reset all styles
    local sep=""                          # Triangle separator (requires Nerd Font)

    local branch=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
    local git_info=""
    
    if [ "$branch" ]; then
        status=""
        # Check for uncommitted changes
        if ! git diff --quiet 2>/dev/null; then
            status="*"
        fi
        # Check for untracked files
        if [ -n "$(git ls-files --others --exclude-standard 2>/dev/null)" ]; then
            status="${status}+"
        fi
        # Check for staged changes
        if ! git diff --cached --quiet 2>/dev/null; then
            status="${status}^"
        fi
        git_info="${branch}${status}"
    fi

    export PS1=""
    if [[ "${error_state}" -ne "0" ]]; then
        PS1+="${blue_bg}${bold}${red_fg}[${error_state}]${reset}" 
    fi
    PS1+="${blue_bg}${white_fg}\u@\h ${blue_fg}${gray_bg}${sep}${lightgray_fg} \w "
    if [[ -n "${git_info}" ]]; then # we are in a git repo
        PS1+="${gray_fg}${green_bg}${sep}${white_fg} ${git_info} ${reset}${green_fg}${sep}${reset}"
    else
        PS1+="${reset}${gray_fg}${sep}${reset}"
    fi 
}

export PROMPT_COMMAND=_build_prompt

