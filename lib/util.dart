import "package:flutter/material.dart";

final _emptyPattern = RegExp(r"^\s+$");
final _whitespaceStartPattern = RegExp(r"^\s+");
const _nameMaxLength = 31;

Future<dynamic> navPush(BuildContext context, Widget Function(BuildContext) builder) =>
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: builder,
      ),
    );

Future<dynamic> navReplace(BuildContext context, Widget Function(BuildContext) builder) =>
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: builder,
      ),
    );

void navPop<T extends Object?>(BuildContext context, [T? result]) =>
    Navigator.of(context).pop(result);

String? nameValidator(String? value) {
  if (value == null || value.isEmpty || _emptyPattern.hasMatch(value)) {
    return "Имя не должно быть пустым";
  }
  if (_whitespaceStartPattern.hasMatch(value)) {
    return "Имя не должно начинаться с пробела";
  }
  if (value.length > _nameMaxLength) {
    return "Имя должно быть короче ${_nameMaxLength + 1} символов";
  }
  return null;
}
