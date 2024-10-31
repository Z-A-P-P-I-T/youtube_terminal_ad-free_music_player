#!/bin/bash
# youtube_terminal_player.sh

# ASCII Header
echo "#############################################################"
echo "#                                                           #"
echo "#    ZZZZZ   .   AAA   .   PPPP      's                     #"
echo "#        Z      A   A      P   P                            #"
echo "#      Z        AAAAA      PPPP        Ad-Free              #"
echo "#    Z          A   A      P           YouTube Music Player #"
echo "#    ZZZZZ      A   A      P                                #"
echo "#                                                           #"
echo "#############################################################"
echo

# Check and install yt-dlp if not present
if ! command -v yt-dlp &> /dev/null; then
    echo "yt-dlp not found. Installing yt-dlp..."
    sudo apt update
    sudo apt install -y yt-dlp
    echo "yt-dlp installed successfully."
else
    echo "yt-dlp is already installed."
fi

# Check and install mpv if not present
if ! command -v mpv &> /dev/null; then
    echo "mpv not found. Installing mpv..."
    sudo apt install -y mpv
    echo "mpv installed successfully."
else
    echo "mpv is already installed."
fi

# Prompt for YouTube video URL
echo "Enter the YouTube video URL to play audio only:"
read video_url

# Fetch the audio URL without ads
audio_url=$(yt-dlp -f bestaudio --get-url "$video_url")

# Play audio in the terminal
mpv "$audio_url"
