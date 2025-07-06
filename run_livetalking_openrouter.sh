#!/bin/bash

# Exit on error
set -e

# Activate venv if exists
if [ -d "venv" ]; then
    source venv/bin/activate
else
    echo "Python venv not found! Please create it first."
    exit 1
fi

# Prompt for API key if not set
if [ -z "$OPENAI_API_KEY" ]; then
    read -sp "Enter your OpenRouter API key: " OPENAI_API_KEY
    echo
    export OPENAI_API_KEY
fi

# Set base URL for OpenRouter
export OPENAI_BASE_URL="https://openrouter.ai/api/v1"

# Run the app with desired arguments
python app.py --transport webrtc --model wav2lip --avatar_id wav2lip256_avatar1 