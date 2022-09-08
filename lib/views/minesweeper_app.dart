import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:minesweeper/components/field_component.dart';
import 'package:minesweeper/components/result.dart';
import 'package:minesweeper/exceptions/explosion_exception.dart';
import 'package:minesweeper/models/field.dart';

class MinesweeperApp extends StatefulWidget {
  const MinesweeperApp({Key? key}) : super(key: key);

  @override
  State<MinesweeperApp> createState() => _MinesweeperAppState();
}

class _MinesweeperAppState extends State<MinesweeperApp> {
  void _reset() {
    print("Has restarted the game");
  }

  void _open(Field field) {
    print("Open...");
  }

  void _toggleFlag(Field field) {
    print("Flag toggled");
  }

  @override
  Widget build(BuildContext context) {
    Field field = Field(line: 0, column: 0);

    return Scaffold(
      appBar: Result(
        hasWin: null,
        onReset: _reset,
        appBar: AppBar(),
      ),
      body: Container(
        child: FieldComponent(
          field: field,
          onOpen: _open,
          onToggleFlag: _toggleFlag,
        ),
      ),
    );
  }
}
