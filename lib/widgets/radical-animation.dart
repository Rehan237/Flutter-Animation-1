import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' show radians;

class RadicalAnimation extends StatelessWidget {

  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translate;
  final Animation<double> rotate;

  RadicalAnimation({Key key, this.controller}):
      scale = Tween<double>(
        begin: 0,
        end: 1,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.ease
      )),
    translate = Tween<double>(
      begin: 0,
      end: 100,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn
    )),
    rotate = Tween<double>(
      begin: 0,
      end: 360,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.0, 0.7,
        curve: Curves.decelerate
      )
    )),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (ctx, widget) {
        return Transform.rotate(
          angle: radians(rotate.value),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              radicalOption(0, icon: Icons.backspace, color: Colors.red),
              radicalOption(45, icon: Icons.check, color: Colors.orange),
              radicalOption(90, icon: Icons.description, color: Colors.yellow),
              radicalOption(135, icon: Icons.email, color: Colors.green),
              radicalOption(180, icon: Icons.forward, color: Colors.blue),
              radicalOption(225, icon: Icons.group, color: Colors.indigo),
              radicalOption(270, icon: Icons.hot_tub, color: Colors.indigoAccent),
              radicalOption(315, icon: Icons.image, color: Colors.pink),
              radicalOption(360, icon: Icons.format_align_justify, color: Colors.pinkAccent),
              Transform.scale(
                scale: scale.value,
                child: FloatingActionButton(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.remove),
                  onPressed: _reverse,
                ),
              ),
              Transform.scale(
                scale: scale.value - 1,
                child: FloatingActionButton(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.add),
                  onPressed: _forward,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget radicalOption(double angle, {IconData icon, Color color}) {
    double rad = radians(angle);
    return Transform.translate(
      offset: Offset(translate.value * sin(rad), translate.value * cos(rad),),
      child: FloatingActionButton(
        child: Icon(icon),
        backgroundColor: color,
        onPressed: _reverse,
      ),
    );
  }

  void _forward() {
    controller.forward();
  }

  void _reverse() {
    controller.reverse();
  }
}
