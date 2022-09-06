import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/models/board.dart';

main() {
  test('Must have win game', () {
    Board board = Board(lines: 2, columns: 2, bombsQnt: 0);

    board.fields[0].setBomb();
    board.fields[3].setBomb();

    board.fields[0].toggleFlag();
    board.fields[1].open();
    board.fields[2].open();
    board.fields[3].toggleFlag();

    expect(board.isSolved, isTrue);
  });
}
