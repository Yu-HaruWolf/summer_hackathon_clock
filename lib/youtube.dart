import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YouTubePlayerWidget extends StatelessWidget {
  final _controller = YoutubePlayerController(
    params: const YoutubePlayerParams(
        mute: false, enableCaption: false, showControls: true, loop: true),
  );

  final _formKey = GlobalKey<FormState>();
  final _textEditingContoroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.cueVideoById(videoId: '7BCtC6D7Nuk');
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: YoutubePlayer(
                controller: _controller,
                aspectRatio: 16 / 9,
              ),
            ),
            Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: _textEditingContoroller,
                    )),
                    ElevatedButton.icon(
                      onPressed: () {
                        _controller.loadVideoById(
                            videoId: _textEditingContoroller.text);
                      },
                      label: Text('Send'),
                      icon: Icon(Icons.send),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
