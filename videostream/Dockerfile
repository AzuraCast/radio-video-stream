FROM phusion/baseimage:0.11

# Set time zone
ENV TZ="UTC"
RUN echo $TZ > /etc/timezone \
    # Avoid ERROR: invoke-rc.d: policy-rc.d denied execution of start.
    && sed -i "s/^exit 101$/exit 0/" /usr/sbin/policy-rc.d

# Install essential packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends apt-transport-https \
        ca-certificates curl software-properties-common ffmpeg ttf-ubuntu-font-family \
    && rm -rf /var/lib/apt/lists/*

# Create azuracast user.
RUN adduser --home /var/azuracast --disabled-password --gecos "" azuracast \
    && usermod -aG docker_env azuracast \
    && mkdir -p /var/azuracast/videostream \
    && chown -R azuracast:azuracast /var/azuracast \
    && echo 'azuracast ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Copy example files.
WORKDIR /var/azuracast/videostream

COPY . .

RUN chmod a+x broadcast.sh

ENV VS_VBR="1500k" \
    VS_FPS="24" \
    VS_QUALITY="superfast" \
    VS_RTMP_SERVER="rtmp://a.rtmp.youtube.com/live2" \
    VS_FONT_FILE="/usr/share/fonts/truetype/ubuntu/Ubuntu-B.ttf" \
    VS_TEXT_SOURCE="/var/azuracast/videostream/example.txt" \
    VS_TEXT_SIZE="55" \
    VS_TEXT_BOX="1" \
    VS_TEXT_BOX_COLOR="black@0.5" \
    VS_TEXT_BORDER_W="20" \
    VS_TEXT_X="100" \
    VS_TEXT_Y="350" \
    VS_AUDIO_SOURCE="http://stations:8000/radio.mp3" \
    VS_VIDEO_SOURCE="/var/azuracast/videostream/example.mp4"

USER azuracast
CMD ["/var/azuracast/videostream/broadcast.sh"]
