import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YouTubePlayerWidget extends StatefulWidget {
  @override
  State<YouTubePlayerWidget> createState() => _YouTubePlayerWidgetState();
}

class _YouTubePlayerWidgetState extends State<YouTubePlayerWidget> {
  final _controller = YoutubePlayerController(
    params: const YoutubePlayerParams(
        mute: false, enableCaption: false, showControls: true, loop: true),
  );

  final _formKey = GlobalKey<FormState>();

  final _textEditingContoroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  key: _formKey,
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        controller: _textEditingContoroller,
                        decoration:
                            InputDecoration(hintText: 'Enter the video ID'),
                      )),
                      ElevatedButton.icon(
                        onPressed: () {
                          _controller.loadVideoById(
                              videoId: _textEditingContoroller.text);
                        },
                        label: Text('Play'),
                        icon: Icon(Icons.play_arrow),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: YoutubePlayer(
                controller: _controller,
                aspectRatio: 16 / 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
