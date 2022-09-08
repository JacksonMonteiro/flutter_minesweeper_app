import 'package:minesweeper/exceptions/explosion_exception.dart';

class Field {
  final int line;
  final int column;
  final List<Field> neighbors = [];

  bool _isOpen = false;
  bool _isMarked = false;
  bool _isMined = false;
  bool _isExploded = false;

  bool get isMined => _isMined;
  bool get isMarked => _isMarked;
  bool get isOpen => _isOpen;
  bool get isExploded => _isExploded;

  bool get isSolved {
    bool minedAndMarked = isMined && isMarked;
    bool secureAndOpened = !isMined && isOpen;
    return minedAndMarked || secureAndOpened;
  }

  bool get isProximitySafe => neighbors.every((neighbor) => !neighbor._isMined);

  int get minesQntd {
    return neighbors.where((neighbor) => neighbor.isMined).length;
  }

  Field({
    required this.line,
    required this.column,
  });

  void addNeighbor(Field neighbor) {
    final deltaLine = (line - neighbor.line).abs();
    final deltaColumn = (column - neighbor.column).abs();

    if (deltaLine == 0 && deltaColumn == 0) {
      return;
    }

    if (deltaLine <= 1 && deltaColumn <= 1) {
      neighbors.add(neighbor);
    }
  }

  void open() {
    if (_isOpen) return;

    _isOpen = true;

    if (_isMined) {
      _isExploded = true;
      throw ExplosionException();
    }

    if (isProximitySafe) {
      for (var neighbor in neighbors) {
        neighbor.open();
      }
    }
  }

  void showBombs() {
    if (_isMined) {
      _isOpen = true;
    }
  }

  void setBomb() {
    _isMined = true;
  }

  void toggleFlag() {
    _isMarked = !_isMarked;
  }

  void restart() {
    _isOpen = false;
    _isMarked = false;
    _isMined = false;
    _isExploded = false;
  }
}
