import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedCard extends StatefulWidget {
  final String title;
  final int columnCount;
  final int position;
  final VoidCallback onPressed;
  final IconData icon;
  final Color iconColor;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color textColor;

  const AnimatedCard({
    Key key,
    @required this.title,
    @required this.columnCount,
    @required this.position,
    @required this.onPressed,
    this.icon,
    this.width,
    this.height,
    this.iconColor,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
  })  : assert(columnCount != null),
        assert(title != null),
        assert(position != null),
        super(key: key);
  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      columnCount: widget.columnCount,
      position: widget.position,
      duration: const Duration(milliseconds: 375),
      child: ScaleAnimation(
        scale: 0.5,
        child: FadeInAnimation(
          child: Container(
            child: RaisedButton(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(widget.icon, size: 100.0, color: widget.iconColor),
                  Text(widget.title,
                      style: TextStyle(fontSize: 18, color: widget.textColor)),
                ],
              ),
              color: widget.backgroundColor,
              onPressed: widget.onPressed,
            ),
            width: widget.width,
            height: widget.height,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4.0,
                  offset: const Offset(0.0, 4.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
