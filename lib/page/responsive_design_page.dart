import 'package:flutter/material.dart';
import 'dart:math' as math;

class ResponsiveDesignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
        title: Text("さまざまなデバイスに対応する"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final longerSide = math.max(constraints.maxHeight, constraints.maxWidth);
      final isPortrait = constraints.maxWidth < constraints.maxHeight;
      if (longerSide < 450) {
        return _Layout();
      } else {
        return _Layout();
      }
    });
  }
}

class _Layout extends StatelessWidget {
  const _Layout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isPortait = height > width;
    return Center(
      child: Column(
        children: [
          //固定サイズじゃレスポンシブに対応できない
          // const SizedBox(
          //   height: 60,
          // ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              "Flutter is Google UI toolkit, Flutter is Google UI toolkit, Flutter is Google UI toolkit",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.85,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //固定サイズじゃレスポンシブに対応できない
          // const SizedBox(
          //   height: 60,
          // ),
          Spacer(),
          if (isPortait)
            FlutterLogo(
              size: height * 0.3,
            ),
          //固定サイズじゃレスポンシブに対応できない
          // const SizedBox(
          //   height: 60,
          // ),
          if (isPortait) Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              "Fast Development Paint your app, Fast Development Paint your app, Fast Development Paint your app",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                height: 1.85,
              ),
            ),
          ),
          //固定サイズじゃレスポンシブに対応できない
          // const SizedBox(
          //   height: 60,
          // ),
          Spacer(),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 650,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: SizedBox(
                height: 42,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(color: Colors.white),
                    primary: Theme.of(context).toggleableActiveColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "get started",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //固定サイズじゃレスポンシブに対応できない
          // const SizedBox(
          //   height: 60,
          // ),
          Spacer(),
        ],
      ),
    );
  }
}
