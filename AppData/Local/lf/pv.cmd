@echo off
pwsh C:\\Users\\yeste\\AppData\\Local\\lf\\pv.ps1 %1

:: file -b --mime-type %1 |^
:: awk "/image*/ { print \"wezterm imgcat\" }; /text*/ { print \"bat --color=always\" }" |^
:: tr -d '\r' |^
:: xargs -I_ pwsh -Command _ %1

