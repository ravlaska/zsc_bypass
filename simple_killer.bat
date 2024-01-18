@echo off
:loop
for /f "tokens=1" %%i in ('tasklist ^| findstr "ZSA"') do (
    TASKKILL /F /IM %%i /T
)
goto loop
