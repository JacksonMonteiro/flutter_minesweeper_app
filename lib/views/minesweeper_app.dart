import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MinesweeperApp extends StatefulWidget {
  const MinesweeperApp({Key? key}) : super(key: key);

  @override
  State<MinesweeperApp> createState() => _MinesweeperAppState();
}

class _MinesweeperAppState extends State<MinesweeperApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minesweeper'),
      ),
      body: Container(
        child: Text('Minesweeper board'),
      ),
    );
  }
}
