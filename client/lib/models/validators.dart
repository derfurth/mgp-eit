import 'package:form_field_validator/form_field_validator.dart';

final telephoneIndicatifValidator = EmptyOrMultiValidator([
  MinLengthValidator(2,
      errorText: "l'indicatif doit faire au moins 2 chiffres."),
  MaxLengthValidator(4,
      errorText: "l'indicatif doit faire moins de 4 chiffres."),
  NumericValidator(),
]);

final telephoneNumeroValidator = EmptyOrMultiValidator([
  PatternValidator(r'^([0-9]){9}$',
      errorText: "le numéro sans le 0 doit comporter neuf chiffres.")
]);

final telephoneValidator = EmptyOrMultiValidator([
  PatternValidator(r"(0|\+[0-9]){1,4}[ \t]{0,1}[0-9]([ \t]{0,1}[0-9]){8}",
      errorText: "le numéro sans le 0 doit comporter neuf chiffres.")
]);

final newPasswordValidator = MultiValidator([
  RequiredValidator(errorText: 'le mot de passe est obligatoire.'),
  MinLengthValidator(8,
      errorText: 'le mot de passe doit faire au moins 8 caractères.'),
  MaxLengthValidator(128,
      errorText: 'le mot de passe doit faire moins de 128 caractères.'),
  PatternValidator(r'[!@#$%^&*(),.?":{}|<>\-_]',
      errorText:
          r'le mot de passe doit au moins contenir un caractère spécial tel que !@#$%^&*(),.?":{}|<>-_.')
]);

final newUserMailValidator = MultiValidator([
  RequiredValidator(errorText: "L'adresse email est obligatoire."),
  EmailValidator(errorText: "L'adresse email n'est pas valide."),
]);

final yearValidator =
    PatternValidator(r'^\d{4}$', errorText: "l'année n'est pas valide");

final inseeValidator =
    PatternValidator(r'^\d{5,9}$', errorText: "le code Insee n'est pas valide");

final sinoeValidator =
    PatternValidator(r'^\d+$', errorText: "le code Sinoe n'est pas valide");

final sirenValidator = PatternValidator(
  r'^$|^\d{9}$',
  errorText: "le code Siren n'est pas valide",
);

final proseValidator = MultiValidator([
  MaxLengthValidator(
    4000,
    errorText: 'le texte doit faire moins de 4000 caractères.',
  ),
  NoMailValidator(),
  NoTelephoneValidator(),
]);

class NoMailValidator extends TextFieldValidator {
  final Pattern _emailPattern =
      r"((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))";

  NoMailValidator(
      {String errorText =
          'Ce champ ne doit pas comporter de données à caractère personnel. (email détecté)'})
      : super(errorText);

  @override
  bool isValid(String? value) =>
      value == null ? false : !hasMatch(_emailPattern.toString(), value);
}

class NoTelephoneValidator extends TextFieldValidator {
  final Pattern _phonePattern =
      r"(0|\+[0-9]){1,4}[ \t]{0,1}[0-9]([ \t]{0,1}[0-9]){8}";

  NoTelephoneValidator(
      {String errorText =
          'Ce champ ne doit pas comporter de données à caractère personnel. (numéro de téléphone détecté)'})
      : super(errorText);

  @override
  bool isValid(String? value) =>
      value == null ? false : !hasMatch(_phonePattern.toString(), value);
}

class NumericValidator extends TextFieldValidator {
  NumericValidator({String errorText = "Ce champ doit être un nombre."})
      : super(errorText);

  @override
  bool isValid(String? value) => isNumeric(value);

  bool isNumeric(String? value) {
    if (value == null) return false;
    try {
      num.parse(value);
      return true;
    } catch (_) {
      return false;
    }
  }
}

class IntegerValidator extends TextFieldValidator {
  IntegerValidator({String errorText = "Ce champ doit être un chiffre."})
      : super(errorText);

  @override
  bool isValid(String? value) => value == null ? false : isInteger(value);

  bool isInteger(String value) {
    try {
      int.parse(value);
      return true;
    } catch (_) {
      return false;
    }
  }
}

class EmptyOrMultiValidator extends MultiValidator {
  EmptyOrMultiValidator(super.validators);

  @override
  bool isValid(value) => value.toString().isEmpty || super.isValid(value);
}

class DurationValidator extends FieldValidator<Duration> {
  DurationValidator({String errorText = 'Ce champ doit être une durée.'})
      : super(errorText);

  @override
  bool isValid(Duration value) => true;
}

class DateTimeValidator extends FieldValidator<DateTime> {
  DateTimeValidator({String errorText = 'Ce champ doit être une date.'})
      : super(errorText);

  @override
  bool isValid(DateTime value) => true;
}

class AlwaysValidValidator<T> extends FieldValidator<T> {
  AlwaysValidValidator() : super('');

  @override
  bool isValid(_) => true;
}
