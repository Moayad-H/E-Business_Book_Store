import 'package:flutter/material.dart';
import 'package:flutter_epub_viewer/flutter_epub_viewer.dart';
import 'package:iconsax/iconsax.dart';

class EpubViewScreen extends StatefulWidget {
  EpubViewScreen();
  @override
  _EpubViewScreenState createState() => _EpubViewScreenState();
}

class _EpubViewScreenState extends State<EpubViewScreen> {
  final Color _accentColor = Color.fromARGB(255, 105, 104, 104);
  final epubController = EpubController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Iconsax.arrow_left, color: Colors.grey[600]),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: Icon(Iconsax.save_add, color: Colors.grey[600]),
          ),
        ],
      ),
      body: SafeArea(
        child: EpubViewer(
          epubSource: EpubSource.fromUrl(
            'https://github.com/IDPF/epub3-samples/releases/download/20230704/accessible_epub_3.epub',
          ),
          epubController: epubController,
          displaySettings: EpubDisplaySettings(
            fontSize: 16,
            theme: EpubTheme.light(),
            flow: EpubFlow.scrolled,
            snap: true,
          ),
          onChaptersLoaded: (chapters) {
            // Handle chapters loaded
          },
          onEpubLoaded: () async {
            // Handle epub loaded
          },
          onRelocated: (value) {
            // Handle page change
          },
          onTextSelected: (epubTextSelection) {
            // Handle text selection
          },
        ),
      ),
    );
  }
}
