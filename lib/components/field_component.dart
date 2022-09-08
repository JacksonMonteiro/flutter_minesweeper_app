import 'package:flutter/material.dart';
import 'package:minesweeper/models/field.dart';

class FieldComponent extends StatelessWidget {
  final Field field;
  final void Function(Field) onOpen;
  final void Function(Field) onToggleFlag;

  const FieldComponent({
    Key? key,
    required this.field,
    required this.onOpen,
    required this.onToggleFlag,
  }) : super(key: key);

  Widget _getContent() {
    int bombsQnt = field.minesQntd;

    if (field.isOpen && field.isMined && field.isExploded) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (field.isOpen && field.isMined) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (field.isOpen && field.minesQntd > 0) {
      return Image.asset('assets/images/aberto_$bombsQnt.jpeg');
    } else if (field.isMarked) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else if (field.isOpen) {
      return Image.asset('assets/images/aberto_0.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(field),
      onLongPress: () => onToggleFlag(field),
      child: _getContent(),
    );
  }
}
