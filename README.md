# AzuraCast Radio Video Stream

This is an example script that can be attached to AzuraCast and will allow you to stream your radio (alongside a video loop) to an RTMP destination, such as YouTube, etc.

## Using This Project

This guide assumes you have already completed a Docker installation of AzuraCast and installed it in the recommended directory (`/var/azuracast`). If you have installed it elsewhere, modify your directories below accordingly.

### Clone the Repository

Run the following commands on your host to clone this repository:

```bash
mkdir -p /tmp/ac_videostream
git clone https://github.com/AzuraCast/radio-video-stream.git /tmp/ac_videostream
mv /tmp/ac_videostream/videostream /var/azuracast/videostream
mv /tmp/ac_videostream/docker-compose.override.yml /var/azuracast/docker-compose.override.yml
```

### Customize Environment Variables

This repository includes a default video and example text, but you will likely want to customize the environment variables to suit your server. You will also **need to provide your RTMP (YouTube, etc) credentials for the video stream to work**.

The environment variables are listed in `/var/azuracast/docker-compose.override.yml`. Open this file in your editor of choice and customize it before building and running the container.

### Build and Start Container

To build and start the new Docker container, you can run:

```bash
cd /var/azuracast
docker-compose build videostream
docker-compose up -d
```