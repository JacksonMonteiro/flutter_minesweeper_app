import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:minesweeper/components/board_component.dart';
import 'package:minesweeper/components/field_component.dart';
import 'package:minesweeper/components/result.dart';
import 'package:minesweeper/exceptions/explosion_exception.dart';
import 'package:minesweeper/models/board.dart';
import 'package:minesweeper/models/field.dart';

class MinesweeperApp extends StatefulWidget {
  const MinesweeperApp({Key? key}) : super(key: key);

  @override
  State<MinesweeperApp> createState() => _MinesweeperAppState();
}

class _MinesweeperAppState extends State<MinesweeperApp> {
  bool? _hasWinned;
  final Board _board = Board(
    lines: 12,
    columns: 12,
    bombsQnt: 3,
  );

  void _reset() {
    setState(() {
      _hasWinned = null;
      _board.restart();
    });
  }

  void _open(Field field) {
    if (_hasWinned != null) {
      return;
    }

    setState(() {
      try {
        field.open();
        if (_board.isSolved) {
          _hasWinned = true;
        }
      } on ExplosionException {
        _hasWinned = false;
        _board.revealBombs();
      }
    });
  }

  void _toggleFlag(Field field) {
    if (_hasWinned != null) {
      return;
    }

    setState(() {
      field.toggleFlag();
      if (_board.isSolved) {
        _hasWinned = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Field field = Field(line: 0, column: 0);

    return Scaffold(
      appBar: Result(
        hasWin: _hasWinned,
        onReset: _reset,
        appBar: AppBar(),
      ),
      body: Container(
        child: BoardComponent(
          board: _board,
          onOpen: _open,
          onToggleFlag: _toggleFlag,
        ),
      ),
    );
  }
}
