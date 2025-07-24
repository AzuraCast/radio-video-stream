# AzuraCast Radio Video Stream

This is an example Liquidsoap script that can be included in AzuraCast that will allow you to stream your radio (alongside a video loop) to an RTMP destination, such as YouTube, etc. while writing the currently playing song across the screen dynamically.

Unlike previous versions of this project, this version does not require Docker modification and works within an existing AzuraCast installation.

**If you were using an older version of this project (with standalone Docker Compose configuration), it is no longer necessary to do this in order to keep a video stream running. For a majority of cases, you can remove the extra Docker configuration and replace it with this version of the project, which works entirely within a stock AzuraCast installation.**

## Using This Script

To use this script, you must be running at least AzuraCast 0.19.0 or a later Rolling Release version.

### Dependencies

Before using this script:
 - Upload a video file to a folder under your station's media library (in the example below, named "videostream"); a sample video loop is included in this repository for reference.
 - Choose a font to display Now Playing data and upload a TTF version of that font to the same folder.

You will also need:
 - An RTMP broadcast key from the service you wish to stream to (i.e. Twitch, YouTube)

### Installing

To use this script on your station:

- Log in to AzuraCast and click "Manage" next to your station.
- From the left sidebar, click "Broadcasting", then "Edit Liquidsoap Configuration".
- Scroll to the bottom-most open text area.
- Paste the contents of the [`video_stream.liq`](./video_stream.liq) file into that text area. (In newer versions of AzuraCast with the "Import Configuration" button on this page, you can just upload the `video_stream.liq` file and it will be set in the correct location.)
- Customize the station directory, RTMP key and font specifications.
- Click "Save Changes" at the bottom of the page.
- Click the yellow notice that pops up at the top left of the page to restart broadcasting, then click "Restart Broadcasting" on the next page.

### Uninstalling

To remove the script, just follow the same steps as above, but clearing out the text area instead. You can optionally remove the uploaded video and font files if needed.

### Updating AzuraCast

Be aware that when AzuraCast updates, sometimes we change the underlying version of Liquidsoap. Most of these changes don't affect scripts like this one, but some changes can cause custom scripts not to parse correctly and to fail to launch.

If you update and your station fails to come back online, we recommend the following:
- From the homepage, click "Manage" next to your station.
- Click "Logs" on the left sidebar.
- Click the "Liquidsoap application log".
- Scroll to the bottom to see what error it's reporting.

You can either attempt to resolve the error yourself or, if your station needs to be back online as soon as possible, temporarily remove the custom code from your station and restart broadcasting.

If this script is affected by a Liquidsoap version update, we encourage pull requests to this repository to help us resolve the issue.

## Project Support

This project is provided as-is with no warranty. We do not actively support this project; it's intended as an example for power users looking to extend AzuraCast with extra functionality.

Pull requests to improve the script are welcome. Other support can be obtained by creating an Issue or Discussion on this repository.
