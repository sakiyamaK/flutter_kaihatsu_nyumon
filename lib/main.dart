import 'package:flutter/material.dart';
import 'page/sliver_app_bar_page.dart';
import 'page/responsive_design_page.dart';
import 'page/grid_view_page.dart';
import 'page/shrinkable_footer_page.dart';
import 'page/hero_page.dart';
import 'page/transition_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter開発入門',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavigationPage(),
    );
  }
}

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            ElevatedButton(
              child: Text('2-4 GridViewPage'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GridViewPage(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text('2-5 SliverAppBarPage'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SliverAppBarPage(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text('2-6 ShrinkableFooterPage'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShrinkableFooterPage(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text('2-7 ResponsiveDesignPage'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResponsiveDesignPage(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text('3-3 HeroPage'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HeroFromPage(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text('3-4 TransitionPage'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransitionPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
