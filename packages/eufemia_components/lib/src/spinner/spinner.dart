import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eufemia/eufemia.dart';

class Spinner extends StatefulWidget {
  final Color color;

  const Spinner({Key key, this.color}) : super(key: key);

  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1250),
    );

    animation = Tween<double>(begin: 0, end: 1).animate(controller);

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.repeat();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    return RotationTransition(
      turns: animation,
      child: SvgPicture.asset(
        'lib/assets/icons/spinner.svg',
        package: 'eufemia',
        color: widget.color ?? palette.secondary,
      ),
    );
  }
}
