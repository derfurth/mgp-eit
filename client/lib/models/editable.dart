import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mgp_client/models/validators.dart';
import 'package:mgp_client/styled_widgets/wrapper.dart';

extension ToFormField on Field<String?> {
  TextFormField toTextFormField({maxLines = 1}) => TextFormField(
        decoration: InputDecoration(
          labelText: label,
          filled: true,
        ),
        initialValue: value,
        validator: validator.call,
        onChanged: update,
        maxLines: maxLines,
      );
}

/// Represent a form field
class Field<T> {
  final String label;
  final FieldValidator<T> validator;
  final Function(T value) _update;
  final T Function() _get;

  const Field({
    required this.label,
    required this.validator,
    required T Function() get,
    required void Function(T) update,
  })  : _get = get,
        _update = update;

  T get value => _get();

  void update(T value) {
    if (validator.isValid(value)) _update(value);
  }
}

class Choice {
  final String value;
  final String label;

  Choice({required this.value, required this.label});
}

class MultipleChoiceField extends Field<List<String>> {
  MultipleChoiceField({
    required label,
    required super.get,
    required super.update,
  }) : super(
          label: label,
          validator: AlwaysValidValidator<List<String>>(),
        );

  Wrapper toChoiceChips(Iterable<Choice> choices) => Wrapper(
        size: .5,
        children: [
          for (final choice in choices)
            ChoiceChip(
              label: Text(choice.label),
              selected: value.contains(choice.value),
              onSelected: (bool selected) {
                final choices = value.toList();
                if (choices.contains(choice.value)) {
                  choices.remove(choice.value);
                } else {
                  choices.add(choice.value);
                }
                update(choices);
              },
            ),
        ],
      );
}

/// A change notifier with [update]
class Editable<T> extends ChangeNotifier implements ValueListenable<T> {
  T _value;

  Editable(this._value);

  void update(T value, {bool notify = true}) {
    if (_value != value) {
      _value = value;
      if (notify) notifyListeners();
    }
  }

  @override
  T get value => _value;
}
