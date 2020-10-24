import 'package:flutter/material.dart';
import 'package:flutter_step_indicator/HorizontalTimeline/ProgressTimelineTopTitle.dart';
import 'package:timeline_tile/timeline_tile.dart';

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
    SingleStateNew(stateTitle: "Stage 3"),
    SingleStateNew(stateTitle: "Stage 3"),

  ];

  List appSteps = [
    'Configure',
    'Code',
    'Test',
    'Deploy',
    'Scale',
  ];
  int currentStep = 4;
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
            Container(
              constraints: const BoxConstraints(maxHeight: 100),
              color: Colors.white,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  TimelineTile(
                    axis: TimelineAxis.horizontal,
                    alignment: TimelineAlign.center,
                    isFirst: true,
                    indicatorStyle: const IndicatorStyle(
                      height: 20,
                      color: Colors.blue,
                    ),
                    beforeLineStyle: const LineStyle(
                      color: Colors.blue,
                      thickness: 3,
                    ),
                    startChild: Text(("Order Placed")),
                  ), TimelineTile(
                    axis: TimelineAxis.horizontal,
                    alignment: TimelineAlign.center,
                    isFirst: false,
                    indicatorStyle: const IndicatorStyle(
                      height: 20,
                      color: Colors.blue,
                    ),
                    beforeLineStyle: const LineStyle(
                      color: Colors.blue,
                      thickness: 3,
                    ),
                    startChild: Text(("Order Placed")),
                  ),
                  TimelineTile(
                    axis: TimelineAxis.horizontal,
                    alignment: TimelineAlign.center,
                    isLast: true,
                    beforeLineStyle: const LineStyle(
                      color: Colors.blue,
                      thickness: 6,
                    ),
                    indicatorStyle: const IndicatorStyle(
                      height: 20,
                      color: Colors.blue,
                    ),
                    endChild: Container(
                      constraints: const BoxConstraints(
                        minWidth: 80,
                      ),
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              constraints: const BoxConstraints(maxHeight: 120),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color:  Colors.blue),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: appSteps.length,
                itemBuilder: (BuildContext context, int index) {
                  var beforeLineStyle = const LineStyle(
                    thickness: 20,
                    color: Color(0xFFD4D4D4),
                  );

                  LineStyle afterLineStyle;
                  if (index <= currentStep) {
                    beforeLineStyle = const LineStyle(
                      thickness: 20,
                      color: Color(0xFF9F92E2),
                    );
                  }

                  if (index == currentStep) {
                    afterLineStyle = const LineStyle(
                      thickness: 20,
                      color: Color(0xFFD4D4D4),
                    );
                  }

                  final isFirst = index == 0;
                  final isLast = index == appSteps.length - 1;
                  var indicatorX = 0.5;
                  if (isFirst) {
                    indicatorX = 0.3;
                  } else if (isLast) {
                    indicatorX = 0.7;
                  }

                  return TimelineTile(
                    axis: TimelineAxis.horizontal,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.8,
                    isFirst: isFirst,
                    isLast: isLast,
                    beforeLineStyle: beforeLineStyle,
                    afterLineStyle: afterLineStyle,
                    hasIndicator: index <= currentStep || isLast,
                    indicatorStyle: IndicatorStyle(
                      width: 20,
                      height: 20,
                      indicatorXY: indicatorX,
                      color: const Color(0xFFD4D4D4),
                      indicator: index <= currentStep ? const _IndicatorApp() : null,
                    ),
                    startChild: Container(
                      constraints: const BoxConstraints(minWidth: 120),
                      margin: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/app/$index.png', height: 40),
                          const SizedBox(width: 8),
                          Text(
                            appSteps[index],
                            // style: GoogleFonts.sniglet(
                            //   fontSize: 14,
                            //   color: index <= currentStep
                            //       ? const Color(0xFF9F92E2)
                            //       : const Color(0xFFD4D4D4),
                            // ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class _IndicatorApp extends StatelessWidget {
  const _IndicatorApp();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF9F92E2),
      ),
      child: Center(
        child: Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}