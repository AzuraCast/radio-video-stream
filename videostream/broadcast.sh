#!/usr/bin/env bash

source /etc/container_environment.sh

ffmpeg \
    -re -f lavfi -i "movie=filename=${VS_VIDEO_SOURCE}:loop=0, setpts=N/(FRAME_RATE*TB)" \
    -thread_queue_size 512 -i "${VS_AUDIO_SOURCE}" \
    -map 0:v:0 -map 1:a:0 \
    -map_metadata:g 1:g \
    -vf drawtext="fontfile=${VS_FONT_FILE}: fontsize=${VS_TEXT_SIZE}: \
     box=${VS_TEXT_BOX}: boxcolor=${VS_TEXT_BOX_COLOR}: boxborderw=${VS_TEXT_BORDER_W}: \
     textfile=${VS_TEXT_SOURCE}: reload=1: fontcolor=white@0.8: x=${VS_TEXT_X}: y=${VS_TEXT_Y}" \
    -vcodec libx264 -pix_fmt yuv420p -preset ${VS_QUALITY} -r ${VS_FPS} -g $((${VS_FPS} * 2)) -b:v ${VS_VBR} \
    -acodec libmp3lame -ar 44100 -threads 6 -qscale:v 3 -b:a 320000 -bufsize 512k \
    -f flv "${VS_RTMP_SERVER}"
