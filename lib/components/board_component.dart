import 'package:flutter/material.dart';
import 'package:minesweeper/components/field_component.dart';
import 'package:minesweeper/models/board.dart';
import 'package:minesweeper/models/field.dart';

class BoardComponent extends StatelessWidget {
  final Board board;
  final void Function(Field) onOpen;
  final void Function(Field) onToggleFlag;

  const BoardComponent({
    Key? key,
    required this.board,
    required this.onOpen,
    required this.onToggleFlag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: board.columns,
        children: board.fields
            .map(
              (field) => FieldComponent(
                field: field,
                onOpen: onOpen,
                onToggleFlag: onToggleFlag,
              ),
            )
            .toList(),
      ),
    );
  }
}
