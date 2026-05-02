#!/bin/bash

# Start the Django development server in the background
python3 manage.py runserver &
SERVER_PID=$!

# Wait a moment to ensure the server has started
sleep 3

# Open the project in the default web browser (Linux)
if command -v xdg-open &> /dev/null; then
    xdg-open http://127.0.0.1:8000/
elif command -v sensible-browser &> /dev/null; then
    sensible-browser http://127.0.0.1:8000/
elif command -v python3 &> /dev/null; then
    python3 -m webbrowser "http://127.0.0.1:8000/"
else
    echo "Could not find a browser to open http://127.0.0.1:8000/"
fi

# Wait for the server process to continue running in foreground (so the script doesn't exit immediately and kill it)
echo "Server is running. Press Ctrl+C to stop."
wait $SERVER_PID
