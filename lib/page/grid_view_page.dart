import 'package:flutter/material.dart';
import 'dart:math' as math;

class GridViewPage extends StatefulWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  _GridViewPage createState() => _GridViewPage();
}

class _GridViewPage extends State<GridViewPage> {
  int _columnsCount = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              '${_scrollController.hasClients ? _scrollController.position.pixels.toInt().toString() : 0} pixels'),
        ),
        body: GridView.builder(
            controller: _scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _columnsCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final gridItemColor =
                  Color((math.Random(index).nextDouble() * 0x00FFFFFF).toInt())
                      .withOpacity(1);
              final gridItemBrightness = gridItemColor.computeLuminance();
              return Stack(children: [
                Container(
                  color: gridItemColor,
                  child: Center(
                    child: Text(
                      index.toString(),
                      style: TextStyle(
                        fontSize: 42,
                        color: gridItemBrightness > 0.5
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Text(
                    gridItemColor
                        .toString()
                        .toUpperCase()
                        .substring(6, 16)
                        .replaceAll('0X', '#'),
                    style: TextStyle(
                      fontSize: 18,
                      color: gridItemBrightness > 0.5
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
              ]);
            }),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            heroTag: "grid_on",
            onPressed: () {
              if (_columnsCount < 10) {
                setState(() {
                  _columnsCount++;
                });
              }
            },
            child: Icon(Icons.grid_on, color: Colors.white),
          ),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            heroTag: "grid_off",
            onPressed: () {
              if (_columnsCount > 1) {
                setState(() {
                  _columnsCount--;
                });
              }
            },
            child: Icon(Icons.grid_off, color: Colors.white),
          ),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            heroTag: "arrow_upward",
            onPressed: () {
              _scrollController.animateTo(0,
                  duration: Duration(milliseconds: 600), curve: Curves.easeIn);
            },
            child: Icon(Icons.arrow_upward, color: Colors.white),
          ),
        ]));
  }
}
