import 'dart:math';

import 'package:minesweeper/models/field.dart';

class Board {
  final int lines;
  final int columns;
  final int bombsQnt;
  final List<Field> _fields = [];

  List<Field> get fields => _fields;
  bool get isSolved {
    return _fields.every((field) => field.isSolved);
  }

  Board({required this.lines, required this.columns, required this.bombsQnt}) {
    _createFields();
    _relateNeighbors();
    _sortMines();
  }

  void _createFields() {
    for (int line = 0; line < lines; line++) {
      for (int column = 0; column < columns; column++) {
        _fields.add(Field(line: line, column: column));
      }
    }
  }

  void _relateNeighbors() {
    for (var field in _fields) {
      for (var neighbor in _fields) {
        field.addNeighbor(neighbor);
      }
    }
  }

  void _sortMines() {
    int sorteds = 0;

    if (bombsQnt > (lines * columns)) {
      return;
    }

    while (sorteds < bombsQnt) {
      int i = Random().nextInt(_fields.length);

      if (!_fields[i].isMined) {
        sorteds++;
        _fields[i].setBomb();
      }
    }
  }

  void restart() {
    _fields.forEach((field) => field.restart());
    _sortMines();
  }

  void revealBombs() {
    _fields.forEach((field) => field.showBombs());
  }
}
