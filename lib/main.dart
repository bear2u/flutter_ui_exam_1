import 'package:flutter/material.dart';

import 'item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  get list => getWidgets();

  List<Widget> getWidgets() {
    List<Widget> list = [];
    final item1 = Item(title: '맥도날드', content: '맥도날드는 맛있다',
        imgSrc: "https://media-cdn.tripadvisor.com/media/photo-s/0f/b2/5f/35/this-is-what-kfc-is-famous.jpg");
    final item2 = Item(title: '롯데리아', content: '맥도날드는 맛있다',
        imgSrc: "https://media-cdn.tripadvisor.com/media/photo-s/0f/b2/5f/35/this-is-what-kfc-is-famous.jpg");
    final item3 = Item(title: 'KFC', content: '맥도날드는 맛있다', imgSrc: "https://media-cdn.tripadvisor.com/media/photo-s/0f/b2/5f/35/this-is-what-kfc-is-famous.jpg");

    list.add(new ItemWidget(item: item1));
    list.add(new ItemWidget(item: item2));
    list.add(new ItemWidget(item: item3));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return list[index];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ItemWidget extends StatelessWidget {
  Item item;

  ItemWidget({
    Key key,
    this.item
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Image.network(item.imgSrc),
            ),
            flex: 3,
          ),
          new FormWidget(item: item)
        ],
      ),
    );
  }
}

class FormWidget extends StatelessWidget {
  Item item;

  FormWidget({
    Key key,
    this.item
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(item.title),
            Text(item.content),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  child: Text('button1'),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Text('button2'),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
      flex: 7,
    );
  }
}
