@echo off
chdir %~dp0
call cygwin_setup.bat
chdir ..
%CYGWIN_TTY% --hold always /usr/bin/bash ^
  ./scripts/start_in_shell.sh -f -s

