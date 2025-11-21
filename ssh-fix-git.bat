@echo off
echo Connecting to Hostinger SSH...
echo.
echo Commands that will be executed:
echo 1. cd public_html
echo 2. git config pull.rebase true
echo 3. git pull origin main
echo.
echo Password: Italia2018!123
echo.
pause
ssh -p 65002 u811529511@153.92.11.84 "cd public_html && git config pull.rebase true && git pull origin main"
echo.
echo Done! Press any key to exit...
pause
