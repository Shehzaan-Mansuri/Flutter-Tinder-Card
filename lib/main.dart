import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

void main()=> MyCustomWidget();
class MyCustomWidget extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    CardController controller; //Use this to trigger swap.
    return Scaffold(
      body: Center(
        child: Container(
          height: _width * 1.1,
          child: TinderSwapCard(
            swipeUp: true,
            swipeDown: true,
            orientation: AmassOrientation.BOTTOM,
            totalNum: 10,
            stackNum: 3,
            swipeEdge: 4,
            maxWidth: _width * .8,
            maxHeight: _width * .8,
            minWidth: _width * .6,
            minHeight: _width * .79,
            cardBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff3224AD), Color(0xffC26AD5)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.15),
                      offset: Offset(0, 5),
                      blurRadius: 40,
                    ),
                  ],
                ),
                child: Text(
                  'Swipe Anywhere...\nPage Index: ${index + 1}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(.7),
                    fontWeight: FontWeight.bold,
                    fontSize: _width / 17,
                  ),
                ),
              );
            },
            cardController: controller = CardController(),
            swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
              /// Get swiping card's alignment
              if (align.x < 0) {
                //Card is LEFT swiping
              } else if (align.x > 0) {
                //Card is RIGHT swiping
              }
            },
            swipeCompleteCallback:
                (CardSwipeOrientation orientation, int index) {
              /// Get orientation & index of swiped card!
            },
          ),
        ),
      ),
    );
  }
}