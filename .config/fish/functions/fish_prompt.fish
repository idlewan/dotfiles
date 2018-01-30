#-------------  PROMPT AND TERMINAL-RELATED  --------------
set BLACK_FG (tput setaf 16)
set GREEN_FG (tput setaf 34)
set GREEN_BG (tput setab 34)
set ORANGE_BG (tput setab 3)
set ORANGE_FG (tput setaf 3)
set YELLOW_FG (tput setaf 220)
set YELLOW_BG (tput setab 220)
set RESET (tput sgr0)
set BOLD (tput bold)
set REVERSE (tput rev)

function fish_prompt
    set -l dir (pwd)
    set -l dir (string replace "/home/wan/" "~/" $dir)
    echo $BLACK_FG$ORANGE_BG (/usr/bin/hostname)$ORANGE_FG$YELLOW_BG$BOLD$BLACK_FG$dir$RESET$YELLOW_FG" "
end
