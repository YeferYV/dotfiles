@echo off
REM basename %1 | xargs -I var grep var C:\\Users\\yeste\\.cache\\lf_clean.log || pwsh -Command "lf -remote 'send redraw' && basename %1 > ~/.cache/lf_clean.log" &

REM lf -remote "send %id% redraw"
REM lf -remote "send %id% set cleaner ''"

sh C:\\Users\\yeste\\AppData\\Local\\lf\\lf_clean.sh %1 && exit 0 || exit 1
