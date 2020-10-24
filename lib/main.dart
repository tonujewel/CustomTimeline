import 'package:flutter/material.dart';
import 'package:flutter_step_indicator/HorizontalTimeline/ProgressTimelineTopTitle.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ProgressTimelineTopTitle screenProgress;

  List<SingleStateNew> allStages = [
    SingleStateNew(stateTitle: "Stage 1"),
    SingleStateNew(stateTitle: "Stage 2"),
    SingleStateNew(stateTitle: "Stage 3"),
    SingleStateNew(stateTitle: "Stage 4"),
    SingleStateNew(stateTitle: "Stage 5"),
    SingleStateNew(stateTitle: "Stage 6"),
    SingleStateNew(stateTitle: "Stage 7"),
    SingleStateNew(stateTitle: "Stage 8"),
  ];

  @override
  void initState() {
    screenProgress = new ProgressTimelineTopTitle(
      states: allStages,
      iconSize: 35,
      textStyle: TextStyle(color: Colors.blue, fontSize: 18),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: screenProgress,
            ),
            SizedBox(
              height: 90,
            ),
            FlatButton(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Goto Next Stage",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              color: Colors.green,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              onPressed: () {
                screenProgress.gotoNextStage();
              },
            ),
            SizedBox(
              height: 50,
            ),
            FlatButton(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Goto Previous Stage",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              color: Colors.green,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              onPressed: () {
                screenProgress.gotoPreviousStage();
              },
            ),
            SizedBox(
              height: 50,
            ),
            FlatButton(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Fail Current Stage",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              color: Colors.green,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              onPressed: () {
                screenProgress.failCurrentStage();
              },
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}