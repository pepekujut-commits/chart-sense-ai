@echo off
echo 🚀 Starting ChartSense AI Professional...
echo.
echo 1. Installing dependencies (if needed)...
call npm install
echo.
echo 2. Starting secure backend on http://localhost:3001...
echo.
echo IMPORTANT: Make sure you have your API key in the .env file!
echo.
node server.js
pause
