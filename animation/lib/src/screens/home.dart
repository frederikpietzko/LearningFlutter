import 'package:flutter/material.dart';
import '../widgets/cat.dart';
import 'dart:math';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;

  Animation<double> boxAnimation;
  AnimationController boxController;

  initState() {
    super.initState();

    boxController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    boxAnimation = Tween(begin: pi * .6, end: pi * .65).animate(CurvedAnimation(
      parent: boxController,
      curve: Curves.easeInOut,
    ));
    boxAnimation.addStatusListener((AnimationStatus status) {
      status == AnimationStatus.completed
          ? boxController.reverse()
          : status == AnimationStatus.dismissed
              ? boxController.forward()
              : null;
    });
    boxController.forward();

    catController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    catAnimation = Tween(begin: -35.0, end: -82.0).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      ),
    );
  }

  Widget buildAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Positioned(
          child: child,
          top: catAnimation.value,
          right: 0.0,
          left: 0.0,
        );
      },
      child: Cat(),
    );
  }

  Widget buildBox() {
    return Container(
      height: 200.0,
      width: 200.0,
      color: Colors.brown,
    );
  }

  onTap() {
    if (catController.status == AnimationStatus.completed) {
      catController.reverse();
      boxController.forward();
    } else if (catController.status == AnimationStatus.dismissed) {
      catController.forward();
      boxController.stop();
    }
  }

  Widget buildLeftFlap() {
    return Positioned(
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          height: 10.0,
          width: 125.0,
          color: Colors.brown,
        ),
        builder: (context, child) {
          return Transform.rotate(
            child: child,
            angle: boxAnimation.value,
            alignment: Alignment.topLeft,
          );
        },
      ),
      left: 5.0,
      top: 3.0,
    );
  }

  Widget buildRightFlap() {
    return Positioned(
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          height: 10.0,
          width: 125.0,
          color: Colors.brown,
        ),
        builder: (context, child) {
          return Transform.rotate(
            child: child,
            angle: -boxAnimation.value,
            alignment: Alignment.topRight,
          );
        },
      ),
      right: 5.0,
      top: 3.0,
    );
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation!'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            buildAnimation(),
            GestureDetector(
              onTap: onTap,
              child: buildBox(),
            ),
            buildLeftFlap(),
            buildRightFlap()
          ],
          overflow: Overflow.visible,
        ),
      ),
    );
  }
}
