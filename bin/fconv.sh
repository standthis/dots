#!/bin/bash
for f in *.$1; do ffmpeg -i "$f" "${f%.1}.flac"; done

