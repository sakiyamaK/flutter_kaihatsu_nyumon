import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SliverAppBarPage(),
    );
  }
}

class SliverAppBarPage extends StatefulWidget {
  const SliverAppBarPage({Key? key}) : super(key: key);

  @override
  _SliverAppBarPageState createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  double _textScale = 1.0;
  bool _isLarge = false;

  void _toggleLargeFont(bool isLarge) {
    _textScale = isLarge ? 1.2 : 1.0;
    setState(() {
      _isLarge = isLarge;
    });
  }

  Widget _createSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.blueAccent.withOpacity(0.3),
      floating: true,
      pinned: true,
      snap: false,
      expandedHeight: 180,
      toolbarHeight: 60,
      flexibleSpace: FlexibleSpaceBar(
        title: Text("記事カテゴリー"),
        background: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Image.network(
                "https://picsum.photos/650/940",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  stops: [0.5, 1],
                  colors: [
                    Colors.grey.withOpacity(0),
                    Colors.black38,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createSliverListBody() {
    Widget sliverSwitchWidget = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("文字を大きく"),
        Switch(value: _isLarge, onChanged: _toggleLargeFont),
      ],
    );

    Widget sliverSubInfoWidget = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sept. 29 2021',
          style: GoogleFonts.lato(),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.share,
            color: Colors.blueAccent,
          ),
        ),
      ],
    );

    Widget userInfoWidget = Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.red,
          radius: 28,
          child: CircleAvatar(
            backgroundImage:
                const NetworkImage("https://picsum.photos/650/940"),
            radius: 26,
            backgroundColor: Colors.grey[200],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("山田太郎"),
              Text(
                "ITジャーナリストだよおおおおおん",
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        const Icon(
          Icons.favorite_border,
          color: Colors.blueAccent,
        ),
        const SizedBox(
          width: 5.0,
        ),
        const Text('350'),
        const SizedBox(
          width: 16.0,
        ),
        const Icon(
          Icons.comment,
          color: Colors.blueAccent,
        ),
        const SizedBox(
          width: 5.0,
        ),
        const Text('25'),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sliverSwitchWidget,
        sliverSubInfoWidget,
        Text('記事タイトル記事タイトル記事タイトル記事タイトル記事タイトル記事タイトル'),
        Divider(
          height: 30,
          thickness: 1,
          color: Colors.blueAccent,
        ),
        userInfoWidget,
        SizedBox(height: 20),
        Text("""
新聞記事には六つの要素が含まれており、それを5W1Hと呼びます。
いつ（WHEN）、どこで（WHERE）、だれが（WHO）、何を（WHAT）、なぜ（WHY）、どのように（HOW）――がそろっていれば、過不足のない記事といえます。
もうひとつの新聞記事の特徴は、「逆三角形」で作られていることです。
一般の文章は「起承転結」といった具合に経緯をたどって結論を最後に書くことが多いのですが、
新聞記事はまっ先に結論を書き、その後に説明を加えていきます。
的確にニュースのポイントを読者に伝えることができるだけでなく、
記事を短くする場合も後ろから削っていけば重要な結論を落とさずにすみます。
短い記事は別として、新聞記事には見出し、リード（前文）、本文があります。
見出しは、記事の内容を一目で伝えるいわばタイトルです。
記事を書いた記者ではなく、第一読者である整理記者がつけます。
「見出しがつかないのは記事が悪いから」といわれるのは、見出しは記事のエッセンスを言葉に凝縮するからです。
思わずひざをたたくようなうまい見出しは、新聞の魅力のひとつでしょう。
リードは本文を簡潔にまとめたもので、数行のなかに本文のエッセンスが込められています。
""")
      ],
    );
  }

  Widget _createSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: _createSliverListBody(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: _textScale),
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              _createSliverAppBar(),
              _createSliverList(),
            ],
          ),
        ));
  }
}
