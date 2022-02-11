#!/bin/bash
if ! [ -x "$(command -v ffmpeg)" ]; then
  echo -e '\033[31m Error: ffmpeg is not installed. \033[0m' >&2
  echo -e '\033[32m you can install ffmpeg by type command "sudo apt-get install ffmpeg" \033[0m' >&2
  exit 1
fi
ffmpeg  -i $1 -vf "fps=10,scale=620:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 $2
