import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShrinkableFooterPage extends StatefulWidget {
  const ShrinkableFooterPage({Key? key}) : super(key: key);

  @override
  State<ShrinkableFooterPage> createState() => _ShrinkableFooterPageState();
}

class _ShrinkableFooterPageState extends State<ShrinkableFooterPage> {
  final _scrollController = ScrollController();
  bool isHidding = false;

  void _listenScroll() {
    _scrollController.addListener(() {
      isHidding = _scrollController.position.userScrollDirection ==
          ScrollDirection.reverse;
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _listenScroll();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ListView(
            controller: _scrollController,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16, right: 50),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  color: Color(0xFFFEEAE6),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 70),
                    Text(
                      "スクロールに応じて\n縮むよ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF442C2E),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Image.network("https://picsum.photos/200"),
              const SizedBox(
                height: 20.0,
              ),
              Image.network("https://picsum.photos/200/200"),
              const SizedBox(
                height: 20.0,
              ),
              Image.network("https://picsum.photos/200/100"),
              const SizedBox(
                height: 20.0,
              ),
              Image.network("https://picsum.photos/200/300"),
              const SizedBox(
                height: 20.0,
              ),
              Image.network("https://picsum.photos/200/400"),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: _BottomNavigationBar(isHidding: isHidding),
          )
        ],
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  _BottomNavigationBar({required this.isHidding});

  final bool isHidding;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: isHidding ? 32 : 60,
      color: Color(0xFFFEEAE6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        child: Row(
          children: [
            _IconTextItem(
                deviceWidth: width,
                isHidding: isHidding,
                icon: Icons.home,
                title: "home"),
            _IconTextItem(
                deviceWidth: width,
                isHidding: isHidding,
                icon: Icons.star,
                title: "Favorite"),
            _IconTextItem(
                deviceWidth: width,
                isHidding: isHidding,
                icon: Icons.favorite,
                title: "Like"),
            _IconTextItem(
                deviceWidth: width,
                isHidding: isHidding,
                icon: Icons.settings,
                title: "Menu"),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }
}

class _IconTextItem extends StatelessWidget {
  const _IconTextItem({
    Key? key,
    required this.deviceWidth,
    required this.isHidding,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final double deviceWidth;
  final bool isHidding;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.25 * (deviceWidth - 32),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Icon(
              icon,
              color: Color(0xFF442C2E),
              size: 24,
            ),
          ),
          AnimatedOpacity(
            opacity: isHidding ? 0 : 1,
            curve: Curves.easeInQuart,
            duration: Duration(milliseconds: 120),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
