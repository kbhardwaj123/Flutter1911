import 'package:flutter/material.dart';

class AnimatedWidgetView extends StatefulWidget {
  AnimatedWidgetView({Key key}) : super(key: key);

  @override
  _AnimatedWidgetViewState createState() => _AnimatedWidgetViewState();
}

class _AnimatedWidgetViewState extends State<AnimatedWidgetView> 
with TickerProviderStateMixin{
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(
        seconds: 3
      ),
      vsync: this,
    );
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GrowingContainer(controller: controller),
      )
    );
  }
}

class GrowingContainer extends AnimatedWidget {
   GrowingContainer({AnimationController controller})
  : super(listenable: Tween<double>(begin: 0,end: 200).animate(controller));

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return Scaffold(
      body: Center(
        child: Container(
          height: animation.value,
          width: animation.value,
          color: Colors.red,
        ),
      ),
    );
  }
}