import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HeroImage {
  String title;
  String url;
  HeroImage(this.title, this.url);

  static List<HeroImage> heroImages = [
    HeroImage("Bear", "https://picsum.photos/200/300?Bear"),
    HeroImage("Tiger", "https://picsum.photos/200/300?Tiger"),
    HeroImage("Turtle", "https://picsum.photos/200/300?Turtle"),
    HeroImage("Dolphin", "https://picsum.photos/200/300?Dolphin"),
    HeroImage("Butterfly", "https://picsum.photos/200/300?Butterfly"),
    HeroImage("Rose", "https://picsum.photos/200/300?Rose"),
    HeroImage("Sunflower", "https://picsum.photos/200/300?Sunflower"),
    HeroImage("Rabbit", "https://picsum.photos/200/300?bear?Rabbit"),
  ];
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({required this.url, Key? key}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => Container(
        color: Colors.grey[200],
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      fit: BoxFit.cover,
    );
  }
}

class HeroFromPage extends StatelessWidget {
  const HeroFromPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Animation"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 4,
        ),
        padding: EdgeInsets.all(8),
        shrinkWrap: true,
        itemCount: HeroImage.heroImages.length,
        itemBuilder: (context, index) => HeroImage.heroImages
            .map(
              (heroImage) => Hero(
                tag: heroImage.title,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HeroToPage(heroImage: heroImage),
                      ),
                    );
                  },
                  child: ImageWidget(url: heroImage.url),
                ),
              ),
            )
            .toList()[index],
      ),
    );
  }
}

class HeroToPage extends StatelessWidget {
  const HeroToPage({required this.heroImage, Key? key}) : super(key: key);
  final HeroImage heroImage;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: Text(heroImage.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Hero(
            tag: heroImage.title,
            // child: Center(
            child: Container(
              constraints: BoxConstraints.expand(),
              child: ImageWidget(
                url: heroImage.url,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
