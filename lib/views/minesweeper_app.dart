import 'package:flutter/material.dart';
import 'package:minesweeper/components/board_component.dart';
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
  Board? _board;

  void _reset() {
    setState(() {
      _hasWinned = null;
      _board?.restart();
    });
  }

  void _open(Field field) {
    if (_hasWinned != null) {
      return;
    }

    setState(() {
      try {
        field.open();
        if (_board!.isSolved) {
          _hasWinned = true;
        }
      } on ExplosionException {
        _hasWinned = false;
        _board!.revealBombs();
      }
    });
  }

  void _toggleFlag(Field field) {
    if (_hasWinned != null) {
      return;
    }

    setState(() {
      field.toggleFlag();
      if (_board!.isSolved) {
        _hasWinned = true;
      }
    });
  }

  Board _getBoard(double width, double height) {
    if (_board == null) {
      int columnQnt = 15;
      double fieldSize = width / columnQnt;
      int linesQnt = (height / fieldSize).floor();
      _board = Board(
        columns: columnQnt,
        lines: linesQnt,
        bombsQnt: ((linesQnt + columnQnt) / 2).floor(),
      );
    }

    return _board as Board;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Result(
        hasWin: _hasWinned,
        onReset: _reset,
        appBar: AppBar(),
      ),
      body: Container(
        color: Colors.grey,
        child: LayoutBuilder(
          builder: (context, constraints) => BoardComponent(
            board: _getBoard(constraints.maxWidth, constraints.maxHeight),
            onOpen: _open,
            onToggleFlag: _toggleFlag,
          ),
        ),
      ),
    );
  }
}
