import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:minesweeper/components/result.dart';

class MinesweeperApp extends StatefulWidget {
  const MinesweeperApp({Key? key}) : super(key: key);

  @override
  State<MinesweeperApp> createState() => _MinesweeperAppState();
}

class _MinesweeperAppState extends State<MinesweeperApp> {
  void _reset() {
    print("Has restarted the game");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Result(
        hasWin: null,
        onReset: _reset,
        appBar: AppBar(),
      ),
      body: Container(
        child: Text('Minesweeper board'),
      ),
    );
  }
}
