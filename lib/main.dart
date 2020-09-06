import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Save Cach index'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  int i;

  List<Widget> _listPage = [
    PageOne(),
    PageTwo(),
  ];

  List<BottomNavigationBarItem> _listNavigation = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      title: Text('Business'),
    ),
  ];

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    i = 0;
    _pageController = new PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        allowImplicitScrolling: true,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: _onPageChanged,
        controller:  _pageController,
        children:_listPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _listNavigation,
        currentIndex: i,
        selectedItemColor: Colors.red[300],
        onTap: _onItemCLick,
      ),
    );
  }

  void _onItemCLick(int index) {
    _pageController.animateToPage(index, duration: Duration(milliseconds: 1), curve: Curves.ease);
  }

  void _onPageChanged(int value) {
    setState(() {
      this.i = value;
    });
  }
}


class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne>{
  Random random = Random();

  @override
  @mustCallSuper
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        addAutomaticKeepAlives: false,
        itemBuilder: (context, index) =>
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              color: Color.fromARGB(
                  255, random.nextInt(255), random.nextInt(255),
                  random.nextInt(255)),
              height: 70,
              child: Center(
                child: Text('Quân $index'),
              ),
            ),
        itemCount: 50,
      ),
    );
  }

}

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo>{
  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height,
      child: ListView.separated(
        physics: BouncingScrollPhysics() ,
        addAutomaticKeepAlives: false,
        separatorBuilder: (context, index) => SizedBox(height: 15),
        itemBuilder: (context, index) =>
            Container(
              height: 70,
              child: Card(
                child: Center(
                  child: Text('Quân $index'),
                ),
              ),
            ),
        itemCount: 50,
      ),
    );
  }

}

