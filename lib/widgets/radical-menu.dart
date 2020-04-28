import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/radical-animation.dart';

class RadicalMenu extends StatefulWidget {
  @override
  _RadicalMenuState createState() => _RadicalMenuState();
}

class _RadicalMenuState extends State<RadicalMenu> with SingleTickerProviderStateMixin {

  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 900));
  }

  @override
  Widget build(BuildContext context) {
    return RadicalAnimation(controller: controller,);
  }
}
