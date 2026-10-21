import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ShowcaseScreen extends StatefulWidget {
  const ShowcaseScreen({super.key});

  @override
  State<ShowcaseScreen> createState() => _ShowcaseScreenState();
}

class _ShowcaseScreenState extends State<ShowcaseScreen> {
  String? _activeDocId;
  late Stream<QuerySnapshot> _videosStream;

  @override
  void initState() {
    super.initState();
    _videosStream = FirebaseFirestore.instance.collection('Videos').snapshots();
  }

  String extractVideoId(String url) {
    RegExp regExp = RegExp(
        r'.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*');
    Match? match = regExp.firstMatch(url);
    return (match != null && match.group(1)?.length == 11) ? match.group(1)! : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alumni Videos & Showcase')),
      body: StreamBuilder<QuerySnapshot>(
        stream: _videosStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data?.docs ?? [];
          if (docs.isEmpty) return const Center(child: Text('No Videos Available'));

          return ListView.builder(
            key: const PageStorageKey('showcase_list_key'),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              final data = doc.data() as Map<String, dynamic>;
              final docId = doc.id;
              final youtubeUrl = data['youtubeUrl'] ?? '';
              final videoId = extractVideoId(youtubeUrl);

              final isPlaying = (_activeDocId == docId);

              return Card(
                key: ValueKey(docId),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                clipBehavior: Clip.antiAlias,
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isPlaying && videoId.isNotEmpty)
                      InlineYoutubePlayer(
                        videoId: videoId,
                        onEnded: () {
                          setState(() {
                            _activeDocId = null;
                          });
                        },
                      )
                    else
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          videoId.isNotEmpty
                              ? Image.network(
                            'https://img.youtube.com/vi/$videoId/hqdefault.jpg',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(height: 200, color: Colors.black12),
                          )
                              : Container(height: 200, color: Colors.black12),
                          IconButton(
                            iconSize: 64,
                            icon: const Icon(Icons.play_circle_fill, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                _activeDocId = docId;
                              });
                            },
                          ),
                        ],
                      ),
                    ListTile(
                      title: Text(
                        data['title'] ?? 'Untitled Video',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(data['speaker'] ?? ''),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class InlineYoutubePlayer extends StatefulWidget {
  final String videoId;
  final VoidCallback onEnded;

  const InlineYoutubePlayer({
    super.key,
    required this.videoId,
    required this.onEnded,
  });

  @override
  State<InlineYoutubePlayer> createState() => _InlineYoutubePlayerState();
}

class _InlineYoutubePlayerState extends State<InlineYoutubePlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      autoPlay: true,
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );

    _controller.listen((event) {
      if (event.playerState == PlayerState.ended) {
        widget.onEnded();
      }
    });
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      aspectRatio: 16 / 9,
    );
  }
}