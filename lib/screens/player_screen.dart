import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PlayerScreen extends StatefulWidget {
  final String videoUrl;
  final bool isShared;
  final String? roomId;
  
  const PlayerScreen({super.key, required this.videoUrl, required this.isShared, this.roomId});
  
  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late VideoPlayerController _vp;
  ChewieController? _cc;

  @override
  void initState() {
    super.initState();
    _vp = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))..initialize().then((_) {
      setState(() {
        _cc = ChewieController(
          videoPlayerController: _vp, 
          autoPlay: true, 
          looping: false,
          materialProgressColors: ChewieProgressColors(
            playedColor: widget.isShared ? Colors.purpleAccent : Colors.cyanAccent,
            handleColor: Colors.white,
            backgroundColor: Colors.white24,
            bufferedColor: Colors.white54,
          )
        );
      });
    });
  }

  @override
  void dispose() { _vp.dispose(); _cc?.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: widget.isShared ? AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Комната: \${widget.roomId}', style: const TextStyle(color: Colors.purpleAccent, fontWeight: FontWeight.bold)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ) : null,
      body: Center(
        child: _cc != null 
          ? Chewie(controller: _cc!) 
          : SpinKitOrbit(color: widget.isShared ? Colors.purpleAccent : Colors.cyanAccent),
      ),
    );
  }
}
