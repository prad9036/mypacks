#!/bin/bash

up() {
    if [ -z "$1" ]; then
        echo "Usage: up <file> [password]"
        return 1
    fi
    if [ ! -f "$1" ]; then
        echo "❌ File not found: $1"
        return 1
    fi
    if [ -n "$2" ]; then
        curl -s -F "file=@\"$1\"" -F "password=$2" https://pradbot.pythonanywhere.com/upload
    else
        curl -s -F "file=@\"$1\"" https://pradbot.pythonanywhere.com/upload
    fi
}

dl() {
    if [ -z "$1" ]; then
        echo "Usage: dl <short_code> [password]"
        return 1
    fi
    if [ -n "$2" ]; then
        curl -s -J -O -F "password=$2" "https://pradbot.pythonanywhere.com/d/$1"
    else
        curl -s -J -O "https://pradbot.pythonanywhere.com/d/$1"
    fi
}
