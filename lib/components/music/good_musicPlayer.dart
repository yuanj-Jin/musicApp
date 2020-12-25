import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

typedef void OnError(Exception exception);

// const kUrl ="https://www.mediacollege.com/downloads/sound-effects/nature/forest/rainforest-ambient.mp3";
const kUrl="https://audio04.dmhmusic.com/71_53_T10053164475_128_4_1_0_sdk-cpm/cn/0207/M00/B3/7B/ChR4614lffeASm3mADyQqKDljVU679.mp3?xcode=33d068b891fb227577dbced768efe85028b6c91";
// const kUrl="http://m801.music.126.net/20201225175001/64992a07a81658526ac7de72e47f0e9b/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/5258591663/61bf/33cf/e6a5/da47602351f7f71aea8c1e88de587411.mp3";
// const kUrl="http://m801.music.126.net/20201225175001/64992a07a81658526ac7de72e47f0e9b/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/5258591663/61bf/33cf/e6a5/da47602351f7f71aea8c1e88de587411.mp3";
// const kUrl="http://audio04.dmhmusic.com/71_53_T10051735467_128_4_4_0_sdk-cpm/cn/0103/M00/10/9E/ChR45F8hc6uAQMKxAAdXW5KJ7-Q433.mp3?xcode=68bcb56c33c51d0077dea52d6ecac63c61070c1";
// const kUrl="";

enum PlayerState { stopped, playing, paused }

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  Duration duration;
  Duration position;

  AudioPlayer audioPlayer;

  String localFilePath;

  PlayerState playerState = PlayerState.stopped;

  get isPlaying => playerState == PlayerState.playing;
  get isPaused => playerState == PlayerState.paused;

  get durationText =>
      duration != null ? duration.toString().split('.').first : '';

  get positionText =>
      position != null ? position.toString().split('.').first : '';

  bool isMuted = false;

  StreamSubscription _positionSubscription;
  StreamSubscription _audioPlayerStateSubscription;

  @override
  void initState() {
    super.initState();
    initAudioPlayer();
  }

  @override
  void dispose() {
    _positionSubscription.cancel();
    _audioPlayerStateSubscription.cancel();
    audioPlayer.stop();
    super.dispose();
  }

  void initAudioPlayer() {
    audioPlayer = AudioPlayer();
    _positionSubscription = audioPlayer.onAudioPositionChanged
        .listen((p) => setState(() => position = p));
    _audioPlayerStateSubscription =
        audioPlayer.onPlayerStateChanged.listen((s) {
          if (s == AudioPlayerState.PLAYING) {
            setState(() => duration = audioPlayer.duration);
          } else if (s == AudioPlayerState.STOPPED) {
            onComplete();
            setState(() {
              position = duration;
            });
          }
        }, onError: (msg) {
          setState(() {
            playerState = PlayerState.stopped;
            duration = Duration(seconds: 0);
            position = Duration(seconds: 0);
          });
        });
  }

  Future play() async {
    await audioPlayer.play(kUrl);
    setState(() {
      playerState = PlayerState.playing;
    });
  }

  Future _playLocal() async {
    await audioPlayer.play(localFilePath, isLocal: true);
    setState(() => playerState = PlayerState.playing);
  }

  Future pause() async {
    await audioPlayer.pause();
    setState(() => playerState = PlayerState.paused);
  }

  Future stop() async {
    await audioPlayer.stop();
    setState(() {
      playerState = PlayerState.stopped;
      position = Duration();
    });
  }

  Future mute(bool muted) async {
    await audioPlayer.mute(muted);
    setState(() {
      isMuted = muted;
    });
  }

  void onComplete() {
    setState(() => playerState = PlayerState.stopped);
  }

  Future<Uint8List> _loadFileBytes(String url, {OnError onError}) async {
    Uint8List bytes;
    try {
      bytes = await readBytes(url);
    } on ClientException {
      rethrow;
    }
    return bytes;
  }

  Future _loadFile() async {
    final bytes = await _loadFileBytes(kUrl,
        onError: (Exception exception) =>
            print('_loadFile => exception $exception'));

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/audio.mp3');

    await file.writeAsBytes(bytes);
    if (await file.exists())
      setState(() {
        localFilePath = file.path;
      });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return
      Container(
          decoration: BoxDecoration(//歌词背景
            image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"),
                fit: BoxFit.cover
            ),
          ),
          child: Center(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Material(child: _buildPlayer()),
                  if (!kIsWeb)
                    localFilePath != null ? Text(localFilePath) : Container(),
                  if (!kIsWeb)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            onPressed: () => _loadFile(),
                            child: Text('Download'),
                          ),
                          if (localFilePath != null)
                            RaisedButton(
                              onPressed: () => _playLocal(),
                              child: Text('play local'),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          )
      );
  }

  Widget _buildPlayer() => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
    ),
    // padding: EdgeInsets.all(50.0),
    child: Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Row(mainAxisSize: MainAxisSize.min, children: [
          IconButton(
            onPressed: isPlaying ? null : () => play(),
            iconSize: 42.0,
            icon: Icon(Icons.play_circle_filled),
            color: Colors.purple,
          ),
          IconButton(
            onPressed: isPlaying ? () => pause() : null,
            iconSize: 42.0,
            icon: Icon(Icons.pause_circle_filled),
            color: Colors.purple,
          ),
          IconButton(
            onPressed: isPlaying || isPaused ? () => stop() : null,
            iconSize: 42.0,
            icon: Icon(Icons.stop_circle_sharp),
            color: Colors.purple,
          ),
        ]),
        if (duration != null)
          Slider(
              value: position?.inMilliseconds?.toDouble() ?? 0.0,
              onChanged: (double value) {
                return audioPlayer.seek((value / 1000).roundToDouble());
              },
              min: 0.0,
              max: duration.inMilliseconds.toDouble()),
        if (position != null) _buildMuteButtons(),
        if (position != null) _buildProgressView()
      ],
    ),
  );

  Row _buildProgressView() => Row(mainAxisSize: MainAxisSize.min, children: [
    Padding(
      padding: EdgeInsets.all(12.0),
      child: CircularProgressIndicator(
        value: position != null && position.inMilliseconds > 0
            ? (position?.inMilliseconds?.toDouble() ?? 0.0) /
            (duration?.inMilliseconds?.toDouble() ?? 0.0)
            : 0.0,
        valueColor: AlwaysStoppedAnimation(Colors.cyan),
        backgroundColor: Colors.grey.shade400,
      ),
    ),
    Text(
      position != null
          ? "${positionText ?? ''} / ${durationText ?? ''}"
          : duration != null ? durationText : '',
      style: TextStyle(fontSize: 24.0),
    )
  ]);

  Row _buildMuteButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        if (!isMuted)
          FlatButton.icon(
            onPressed: () => mute(true),
            icon: Icon(
              Icons.headset_off,
              color: Colors.cyan,
            ),
            label: Text('Mute', style: TextStyle(color: Colors.cyan)),
          ),
        if (isMuted)
          FlatButton.icon(
            onPressed: () => mute(false),
            icon: Icon(Icons.headset, color: Colors.cyan),
            label: Text('Unmute', style: TextStyle(color: Colors.cyan)),
          ),
      ],
    );
  }
}
