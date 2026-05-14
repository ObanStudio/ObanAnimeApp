import 'package:flutter/material.dart';
import 'player_screen.dart';

class WatchTogetherScreen extends StatefulWidget {
  const WatchTogetherScreen({super.key});
  @override
  State<WatchTogetherScreen> createState() => _WatchTogetherScreenState();
}

class _WatchTogetherScreenState extends State<WatchTogetherScreen> {
  final _roomController = TextEditingController();
  final _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('CO-OP MODE', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.purpleAccent)),
              const Text('Смотри аниме вместе с друзьями', style: TextStyle(color: Colors.white54)),
              const SizedBox(height: 30),
              TextField(
                controller: _roomController,
                decoration: InputDecoration(
                  hintText: 'ID Комнаты (например: Oban123)',
                  filled: true,
                  fillColor: Colors.white10,
                  prefixIcon: const Icon(Icons.meeting_room, color: Colors.purpleAccent),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.purpleAccent)),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _urlController,
                decoration: InputDecoration(
                  hintText: 'Ссылка на видео...',
                  filled: true,
                  fillColor: Colors.white10,
                  prefixIcon: const Icon(Icons.link, color: Colors.purpleAccent),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.purpleAccent)),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.sync),
                  label: const Text('ВОЙТИ В КОМНАТУ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purpleAccent, 
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                  ),
                  onPressed: () {
                    if (_urlController.text.isNotEmpty && _roomController.text.isNotEmpty) {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => PlayerScreen(
                        videoUrl: _urlController.text, 
                        isShared: true,
                        roomId: _roomController.text,
                      )));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
