import 'package:flutter/material.dart';
import 'my_nested_scroll_view.dart' as My;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: My.NestedScrollView(
          physics: const BouncingScrollPhysics(parent: const AlwaysScrollableScrollPhysics()),
          headerSliverBuilder: (BuildContext c, bool f) => <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 200.0,
              stretch: true,
              stretchTriggerOffset: 1.0,
              title: const Text('SliverAppBar stretch'),
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  stretchModes: [StretchMode.blurBackground, StretchMode.zoomBackground],
                  background: Image.asset(
                    'assets/take_down.jpg',
                    fit: BoxFit.cover,
                  )),
            )
          ],
          // IMPORTANT: allow app bar to stretch
          stretchHeaderSlivers: true,
          body: Column(
            children: [
              TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'Tab 1'),
                  Tab(text: 'Tab 2'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _myListView(1),
                    _myListView(2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _myListView(int index) => ListView.builder(
    // Stores tabview state
    key: PageStorageKey<String>('Tab$index'),
    physics: const BouncingScrollPhysics(parent: const AlwaysScrollableScrollPhysics()),
        itemBuilder: (BuildContext c, int i) {
          return Container(
            alignment: Alignment.center,
            color: i % 2 == 0 ? Colors.black12 : null,
            height: 60.0,
            child: Text('Tab$index: ListView$i'),
          );
        },
        itemCount: 50,
      );
}
