import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

void main() {
  runApp(MyApp());
}

EventBus eventBus = EventBus();
class Counter {
  String text;
  Counter(this.text);
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Widget> _pages = [MyHomePage(), SearchPage(),MinePage()];
  int _currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("demo"),
        ),
        body: IndexedStack(
          index: this._currentIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
            BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("搜索")),
            BottomNavigationBarItem(icon: Icon(Icons.people), title: Text("我")),
          ],
          onTap: (index) {
            setState(() {
              this._currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){ eventBus.fire(Counter("count"));
        print("123wetrqw");},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
  return _SearchState();
  }
}

class _SearchState extends State<SearchPage> {
  int _count = 0;
  var _countEvent;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   this._countEvent = eventBus.on<Counter>().listen((event) {
      setState(() {
        this._count += 1;
        print("sdfasd");
      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this._countEvent.cancel();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${this._count}',
                style: Theme.of(context).textTheme.headline4)
          ],
        ),
      ),
    );
  }
}

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MineState();
  }
}

class _MineState extends State<MinePage> {
  int _count = 0;
  var _countEvent;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._countEvent = eventBus.on<Counter>().listen((event) {
      setState(() {
        this._count += 1;
      });
    });
  }
//  @override
//  void dispose() {
//    // TODO: implement dispose
//    super.dispose();
//    this._countEvent.cancel();
//  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${this._count}',
                style: Theme.of(context).textTheme.headline4)
          ],
        ),
      ),
    );
  }

}
