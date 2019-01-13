import 'package:flutter/material.dart';
import 'dart:math';
import 'TextSequenceManager.dart';

void main() => runApp(MyApp());

final String _fontName = "PlayfairDisplay-BlackItalic.ttf";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomMaterialApp();
  }
}

class CustomMaterialApp extends StatelessWidget {
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Words Without Meaning',
      theme: ThemeData(primarySwatch: Colors.grey, fontFamily: _fontName),
      home: MainPage(title: "Words Without Meaning"),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  final _kArrowColor = Colors.black.withOpacity(0.8);
//  final String _fontName = "PlayfairDisplay-BlackItalic.ttf";

  void _clearPages() {
    if (null != _pages) {
      if (_pages.length > 0) {
        _pages.clear();
      }
    }
  }

  List<Widget> _pages = <Widget>[];
  void _buildList() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    //TODO: change this to prop
    for (var i = 0; i < 99; i++)
    {
      List<String> tmpList = TextSequenceGenerator.getRandomSequence();
      var tmpPoem = tmpList[0];
      var tmpPattern = tmpList[1];
      print("pattern: " + tmpPattern);
      var tmpPoemLength = tmpPoem.length;
      var tmpSize = getXWidth(screenWidth, screenHeight, tmpPoemLength);

      _pages.add(
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: new ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  tmpPoem,
                  style: new TextStyle(
                    fontFamily: _fontName,
                    letterSpacing: (-1*(tmpSize/12)),
                    fontSize: tmpSize,
                    fontWeight: FontWeight.bold,
                    height: .65,
                  ),
                ),
                Text(tmpPattern),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _clearPages();
    _buildList();
    return Scaffold(
      body: IconTheme(
        data: IconThemeData(color: _kArrowColor),
        child: Stack(
          children: <Widget>[
            PageView.builder(
              onPageChanged: pageChanged,
              physics: new AlwaysScrollableScrollPhysics(),
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
              },
            ),
// uncomment for pagination dots...
//            Positioned(
//              bottom: 0.0,
//              left: 0.0,
//              right: 0.0,
//              child: new Container(
//                color: Colors.grey[800].withOpacity(0.5),
//                padding: const EdgeInsets.all(20.0),
//                child: new Center(
//                  child: new DotsIndicator(
//                    controller: _controller,
//                    itemCount: _pages.length,
//                    onPageSelected: (int page) {
//                      _controller.animateToPage(
//                        page,
//                        duration: _kDuration,
//                        curve: _kCurve,
//                      );
//                    },
//                  ),
//                ),
//              ),
//            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateNewSequence,
        tooltip: 'Generate new sequence',
        child: Icon(Icons.autorenew),
      ),
    );
  }

  _generateNewSequence()
  {
    setState(() {
      _clearPages();
      _buildList();
    });
  }

  double getXWidth(double w, double h, int n) {
    var hi = max(w, h);
    var lo = 0.0;
    while ((hi - lo).abs() > 0.000001) {
      var mid = (lo + hi) / 2.0;
      var midval = (w / mid).floor() * (h / mid).floor();

      if (midval >= n) {
        lo = mid;
      } else if (midval < n) {
        hi = mid;
      }
    }
    return min(w / (w / lo).floor(), h / (h / lo).floor());
  }


  void pageChanged(int pPageNumber) {
    print("page number: " + pPageNumber.toString());
  }
}
