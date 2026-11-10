@echo off
set "GH=C:\Program Files\GitHub CLI\gh.exe"
set "GIT=%LOCALAPPDATA%\Programs\MinGit\cmd\git.exe"

echo ========================================================
echo   WorkerFlow - Updating GitHub Repository
echo ========================================================
echo.

"%GH%" auth status >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [Step 1/3] Authorizing with GitHub...
    echo A one-time code will be copied to your clipboard.
    echo Your browser will open GitHub to verify.
    echo.
    "%GH%" auth login --web --clipboard -p https
)

echo [Step 2/3] Configuring Git Credentials...
"%GH%" auth setup-git

echo [Step 3/3] Pushing to https://github.com/mohitpxl/WorkerFlow (main)...
"%GIT%" push -u origin main

echo.
echo ========================================================
echo   ALL DONE! Repo is updated and Vercel will auto-deploy.
echo ========================================================
pause
