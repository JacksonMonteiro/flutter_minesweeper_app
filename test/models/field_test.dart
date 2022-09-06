import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/models/field.dart';

main() {
  group('Field Test', () {
    test('Must have field with explosion', () {
      Field field = Field(line: 0, column: 0);
      field.setBomb();
      expect(field.open, throwsException);
    });

    test('Must have without explode', () {
      Field field = Field(line: 0, column: 0);
      field.open();
      expect(field.isOpen, isTrue);
    });

    test('Must have add No Neighbor', () {
      Field baseField = Field(line: 0, column: 0);
      Field neighborField = Field(line: 1, column: 3);
      baseField.addNeighbor(neighborField);
      expect(baseField.neighbors.isEmpty, isTrue);
    });

    test('Must have add Neighbor', () {
      Field baseField = Field(line: 3, column: 3);
      Field neighborField = Field(line: 3, column: 4);
      Field neighborField2 = Field(line: 2, column: 2);
      Field neighborField3 = Field(line: 4, column: 4);

      baseField.addNeighbor(neighborField);
      baseField.addNeighbor(neighborField2);
      baseField.addNeighbor(neighborField3);

      expect(baseField.neighbors.length, 3);
    });
  });
}
