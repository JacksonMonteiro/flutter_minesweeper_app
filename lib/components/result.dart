import 'package:flutter/material.dart';

class Result extends StatelessWidget implements PreferredSizeWidget {
  final bool? hasWin;
  final AppBar appBar;
  final void Function() onReset;

  Result({
    Key? key,
    required this.hasWin,
    required this.onReset,
    required this.appBar,
  }) : super(key: key);

  Color _getColor() {
    if (hasWin == null) {
      return Colors.yellow;
    } else if (hasWin == true) {
      return Colors.green[300]!;
    } else {
      return Colors.red[300]!;
    }
  }

  IconData _getIcon() {
    if (hasWin == null) {
      return Icons.sentiment_satisfied;
    } else if (hasWin == true) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: CircleAvatar(
          backgroundColor: _getColor(),
          child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: onReset,
              icon: Icon(
                _getIcon(),
                color: Colors.black,
                size: 35,
              )),
        ),
      )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
