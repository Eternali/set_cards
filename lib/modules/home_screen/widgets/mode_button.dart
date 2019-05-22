import 'package:flutter/material.dart';

class ModeButton extends StatefulWidget {

  IconData icon;
  String title;
  Function onPressed;

  ModeButton({ this.icon, this.title, this.onPressed, Key key }) : super(key: key);

  _ModeButtonState createState() => _ModeButtonState();

}

class _ModeButtonState extends State<ModeButton> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(18),
      // decoration: BoxDecoration(
      //   color: Colors.white10,
      //   borderRadius: BorderRadius.circular(28),
      //   border: Border.all(color: Colors.white30, width: 3),
      // ),
      child: InkWell(
        onTap: widget.onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 6),
              child: Icon(widget.icon, color: Colors.white70, size: 32),
            ),
            Text(
              widget.title.toUpperCase(),
              style: theme.textTheme.display1.copyWith(
                fontSize: 24,
                letterSpacing: 1.2,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

}