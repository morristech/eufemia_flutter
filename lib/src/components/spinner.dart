import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Spinner extends StatefulWidget {
  final Color color;

  const Spinner({Key key, this.color}) : super(key: key);
  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1250),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: SvgPicture.asset(
        'lib/assets/icons/spinner.svg',
        package: 'eufemia',
        color: widget.color ?? Theme.of(context).brightness == Brightness.light
            ? Theme.of(context).accentColor
            : Colors.white,
      ),
    );
  }
}
