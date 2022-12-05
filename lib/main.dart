import 'package:flutter/material.dart';

void main() {
  runApp(const UnsplashRandomImage());
}

class UnsplashRandomImage extends StatelessWidget {
  const UnsplashRandomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unsplash Random Image',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const UnsplashRandomImagePage(title: 'Unsplash Random Image'),
    );
  }
}

class UnsplashRandomImagePage extends StatefulWidget {
  const UnsplashRandomImagePage({super.key, required this.title});
  final String title;

  @override
  State<UnsplashRandomImagePage> createState() => _UnsplashRandomImageState();
}

class _UnsplashRandomImageState extends State<UnsplashRandomImagePage> {
  int counter = 0;
  String _imageUrl = 'https://source.unsplash.com/random/';

  void _randomImage() {
    setState(() {
      _imageUrl = 'https://source.unsplash.com/random/$counter';
      counter++;
    });
  }

  Widget unsplash() {
    return Image.network(
      _imageUrl,
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _randomImage,
          child: unsplash(),
        ),
      ),
    );
  }
}
