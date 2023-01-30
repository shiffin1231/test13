import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  final double _height;
  final bool _showIcon;
  final IconData _icon;

  const HeaderWidget(this._height,this._showIcon,this._icon, {Key? key}) : super(key: key);

  @override
 _HeaderWidgetState createState() => _HeaderWidgetState(_height,_showIcon,_icon);
}

class _HeaderWidgetState extends State<HeaderWidget> {
  double _height;
  bool _showIcon;
  IconData _icon;
  _HeaderWidgetState(this._height,this._showIcon,this._icon);

  @override
  Widget build(BuildContext context) {
    double width =MediaQuery
    .of(context)
    .size
    .width;

    return Container(
      child: Stack(

      ),
    );
  }
}
