// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'snippets.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EntrepriseSnippet _$EntrepriseSnippetFromJson(Map<String, dynamic> json) {
  return _EntrepriseSnippet.fromJson(json);
}

/// @nodoc
mixin _$EntrepriseSnippet {
  Entreprise get entreprise => throw _privateConstructorUsedError;
  List<Etablissement> get etablissements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntrepriseSnippetCopyWith<EntrepriseSnippet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntrepriseSnippetCopyWith<$Res> {
  factory $EntrepriseSnippetCopyWith(
          EntrepriseSnippet value, $Res Function(EntrepriseSnippet) then) =
      _$EntrepriseSnippetCopyWithImpl<$Res, EntrepriseSnippet>;
  @useResult
  $Res call({Entreprise entreprise, List<Etablissement> etablissements});

  $EntrepriseCopyWith<$Res> get entreprise;
}

/// @nodoc
class _$EntrepriseSnippetCopyWithImpl<$Res, $Val extends EntrepriseSnippet>
    implements $EntrepriseSnippetCopyWith<$Res> {
  _$EntrepriseSnippetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entreprise = null,
    Object? etablissements = null,
  }) {
    return _then(_value.copyWith(
      entreprise: null == entreprise
          ? _value.entreprise
          : entreprise // ignore: cast_nullable_to_non_nullable
              as Entreprise,
      etablissements: null == etablissements
          ? _value.etablissements
          : etablissements // ignore: cast_nullable_to_non_nullable
              as List<Etablissement>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EntrepriseCopyWith<$Res> get entreprise {
    return $EntrepriseCopyWith<$Res>(_value.entreprise, (value) {
      return _then(_value.copyWith(entreprise: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EntrepriseSnippetImplCopyWith<$Res>
    implements $EntrepriseSnippetCopyWith<$Res> {
  factory _$$EntrepriseSnippetImplCopyWith(_$EntrepriseSnippetImpl value,
          $Res Function(_$EntrepriseSnippetImpl) then) =
      __$$EntrepriseSnippetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Entreprise entreprise, List<Etablissement> etablissements});

  @override
  $EntrepriseCopyWith<$Res> get entreprise;
}

/// @nodoc
class __$$EntrepriseSnippetImplCopyWithImpl<$Res>
    extends _$EntrepriseSnippetCopyWithImpl<$Res, _$EntrepriseSnippetImpl>
    implements _$$EntrepriseSnippetImplCopyWith<$Res> {
  __$$EntrepriseSnippetImplCopyWithImpl(_$EntrepriseSnippetImpl _value,
      $Res Function(_$EntrepriseSnippetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entreprise = null,
    Object? etablissements = null,
  }) {
    return _then(_$EntrepriseSnippetImpl(
      entreprise: null == entreprise
          ? _value.entreprise
          : entreprise // ignore: cast_nullable_to_non_nullable
              as Entreprise,
      etablissements: null == etablissements
          ? _value._etablissements
          : etablissements // ignore: cast_nullable_to_non_nullable
              as List<Etablissement>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EntrepriseSnippetImpl implements _EntrepriseSnippet {
  _$EntrepriseSnippetImpl(
      {required this.entreprise,
      required final List<Etablissement> etablissements})
      : _etablissements = etablissements;

  factory _$EntrepriseSnippetImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntrepriseSnippetImplFromJson(json);

  @override
  final Entreprise entreprise;
  final List<Etablissement> _etablissements;
  @override
  List<Etablissement> get etablissements {
    if (_etablissements is EqualUnmodifiableListView) return _etablissements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_etablissements);
  }

  @override
  String toString() {
    return 'EntrepriseSnippet(entreprise: $entreprise, etablissements: $etablissements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntrepriseSnippetImpl &&
            (identical(other.entreprise, entreprise) ||
                other.entreprise == entreprise) &&
            const DeepCollectionEquality()
                .equals(other._etablissements, _etablissements));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, entreprise,
      const DeepCollectionEquality().hash(_etablissements));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EntrepriseSnippetImplCopyWith<_$EntrepriseSnippetImpl> get copyWith =>
      __$$EntrepriseSnippetImplCopyWithImpl<_$EntrepriseSnippetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntrepriseSnippetImplToJson(
      this,
    );
  }
}

abstract class _EntrepriseSnippet implements EntrepriseSnippet {
  factory _EntrepriseSnippet(
          {required final Entreprise entreprise,
          required final List<Etablissement> etablissements}) =
      _$EntrepriseSnippetImpl;

  factory _EntrepriseSnippet.fromJson(Map<String, dynamic> json) =
      _$EntrepriseSnippetImpl.fromJson;

  @override
  Entreprise get entreprise;
  @override
  List<Etablissement> get etablissements;
  @override
  @JsonKey(ignore: true)
  _$$EntrepriseSnippetImplCopyWith<_$EntrepriseSnippetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContactSnippet _$ContactSnippetFromJson(Map<String, dynamic> json) {
  return _ContactSnippet.fromJson(json);
}

/// @nodoc
mixin _$ContactSnippet {
  Contact get contact => throw _privateConstructorUsedError;
  Personne get personne => throw _privateConstructorUsedError;
  EntrepriseSnippet get entreprise => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactSnippetCopyWith<ContactSnippet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactSnippetCopyWith<$Res> {
  factory $ContactSnippetCopyWith(
          ContactSnippet value, $Res Function(ContactSnippet) then) =
      _$ContactSnippetCopyWithImpl<$Res, ContactSnippet>;
  @useResult
  $Res call({Contact contact, Personne personne, EntrepriseSnippet entreprise});

  $ContactCopyWith<$Res> get contact;
  $PersonneCopyWith<$Res> get personne;
  $EntrepriseSnippetCopyWith<$Res> get entreprise;
}

/// @nodoc
class _$ContactSnippetCopyWithImpl<$Res, $Val extends ContactSnippet>
    implements $ContactSnippetCopyWith<$Res> {
  _$ContactSnippetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contact = null,
    Object? personne = null,
    Object? entreprise = null,
  }) {
    return _then(_value.copyWith(
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact,
      personne: null == personne
          ? _value.personne
          : personne // ignore: cast_nullable_to_non_nullable
              as Personne,
      entreprise: null == entreprise
          ? _value.entreprise
          : entreprise // ignore: cast_nullable_to_non_nullable
              as EntrepriseSnippet,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res> get contact {
    return $ContactCopyWith<$Res>(_value.contact, (value) {
      return _then(_value.copyWith(contact: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PersonneCopyWith<$Res> get personne {
    return $PersonneCopyWith<$Res>(_value.personne, (value) {
      return _then(_value.copyWith(personne: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EntrepriseSnippetCopyWith<$Res> get entreprise {
    return $EntrepriseSnippetCopyWith<$Res>(_value.entreprise, (value) {
      return _then(_value.copyWith(entreprise: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContactSnippetImplCopyWith<$Res>
    implements $ContactSnippetCopyWith<$Res> {
  factory _$$ContactSnippetImplCopyWith(_$ContactSnippetImpl value,
          $Res Function(_$ContactSnippetImpl) then) =
      __$$ContactSnippetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Contact contact, Personne personne, EntrepriseSnippet entreprise});

  @override
  $ContactCopyWith<$Res> get contact;
  @override
  $PersonneCopyWith<$Res> get personne;
  @override
  $EntrepriseSnippetCopyWith<$Res> get entreprise;
}

/// @nodoc
class __$$ContactSnippetImplCopyWithImpl<$Res>
    extends _$ContactSnippetCopyWithImpl<$Res, _$ContactSnippetImpl>
    implements _$$ContactSnippetImplCopyWith<$Res> {
  __$$ContactSnippetImplCopyWithImpl(
      _$ContactSnippetImpl _value, $Res Function(_$ContactSnippetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contact = null,
    Object? personne = null,
    Object? entreprise = null,
  }) {
    return _then(_$ContactSnippetImpl(
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact,
      personne: null == personne
          ? _value.personne
          : personne // ignore: cast_nullable_to_non_nullable
              as Personne,
      entreprise: null == entreprise
          ? _value.entreprise
          : entreprise // ignore: cast_nullable_to_non_nullable
              as EntrepriseSnippet,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactSnippetImpl implements _ContactSnippet {
  _$ContactSnippetImpl(
      {required this.contact,
      required this.personne,
      required this.entreprise});

  factory _$ContactSnippetImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactSnippetImplFromJson(json);

  @override
  final Contact contact;
  @override
  final Personne personne;
  @override
  final EntrepriseSnippet entreprise;

  @override
  String toString() {
    return 'ContactSnippet(contact: $contact, personne: $personne, entreprise: $entreprise)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactSnippetImpl &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.personne, personne) ||
                other.personne == personne) &&
            (identical(other.entreprise, entreprise) ||
                other.entreprise == entreprise));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contact, personne, entreprise);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactSnippetImplCopyWith<_$ContactSnippetImpl> get copyWith =>
      __$$ContactSnippetImplCopyWithImpl<_$ContactSnippetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactSnippetImplToJson(
      this,
    );
  }
}

abstract class _ContactSnippet implements ContactSnippet {
  factory _ContactSnippet(
      {required final Contact contact,
      required final Personne personne,
      required final EntrepriseSnippet entreprise}) = _$ContactSnippetImpl;

  factory _ContactSnippet.fromJson(Map<String, dynamic> json) =
      _$ContactSnippetImpl.fromJson;

  @override
  Contact get contact;
  @override
  Personne get personne;
  @override
  EntrepriseSnippet get entreprise;
  @override
  @JsonKey(ignore: true)
  _$$ContactSnippetImplCopyWith<_$ContactSnippetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnimateurSnippet _$AnimateurSnippetFromJson(Map<String, dynamic> json) {
  return _AnimateurSnippet.fromJson(json);
}

/// @nodoc
mixin _$AnimateurSnippet {
  Animateur get animateur => throw _privateConstructorUsedError;
  Personne get personne => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnimateurSnippetCopyWith<AnimateurSnippet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimateurSnippetCopyWith<$Res> {
  factory $AnimateurSnippetCopyWith(
          AnimateurSnippet value, $Res Function(AnimateurSnippet) then) =
      _$AnimateurSnippetCopyWithImpl<$Res, AnimateurSnippet>;
  @useResult
  $Res call({Animateur animateur, Personne personne});

  $AnimateurCopyWith<$Res> get animateur;
  $PersonneCopyWith<$Res> get personne;
}

/// @nodoc
class _$AnimateurSnippetCopyWithImpl<$Res, $Val extends AnimateurSnippet>
    implements $AnimateurSnippetCopyWith<$Res> {
  _$AnimateurSnippetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animateur = null,
    Object? personne = null,
  }) {
    return _then(_value.copyWith(
      animateur: null == animateur
          ? _value.animateur
          : animateur // ignore: cast_nullable_to_non_nullable
              as Animateur,
      personne: null == personne
          ? _value.personne
          : personne // ignore: cast_nullable_to_non_nullable
              as Personne,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnimateurCopyWith<$Res> get animateur {
    return $AnimateurCopyWith<$Res>(_value.animateur, (value) {
      return _then(_value.copyWith(animateur: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PersonneCopyWith<$Res> get personne {
    return $PersonneCopyWith<$Res>(_value.personne, (value) {
      return _then(_value.copyWith(personne: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnimateurSnippetImplCopyWith<$Res>
    implements $AnimateurSnippetCopyWith<$Res> {
  factory _$$AnimateurSnippetImplCopyWith(_$AnimateurSnippetImpl value,
          $Res Function(_$AnimateurSnippetImpl) then) =
      __$$AnimateurSnippetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Animateur animateur, Personne personne});

  @override
  $AnimateurCopyWith<$Res> get animateur;
  @override
  $PersonneCopyWith<$Res> get personne;
}

/// @nodoc
class __$$AnimateurSnippetImplCopyWithImpl<$Res>
    extends _$AnimateurSnippetCopyWithImpl<$Res, _$AnimateurSnippetImpl>
    implements _$$AnimateurSnippetImplCopyWith<$Res> {
  __$$AnimateurSnippetImplCopyWithImpl(_$AnimateurSnippetImpl _value,
      $Res Function(_$AnimateurSnippetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animateur = null,
    Object? personne = null,
  }) {
    return _then(_$AnimateurSnippetImpl(
      animateur: null == animateur
          ? _value.animateur
          : animateur // ignore: cast_nullable_to_non_nullable
              as Animateur,
      personne: null == personne
          ? _value.personne
          : personne // ignore: cast_nullable_to_non_nullable
              as Personne,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimateurSnippetImpl implements _AnimateurSnippet {
  _$AnimateurSnippetImpl({required this.animateur, required this.personne});

  factory _$AnimateurSnippetImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimateurSnippetImplFromJson(json);

  @override
  final Animateur animateur;
  @override
  final Personne personne;

  @override
  String toString() {
    return 'AnimateurSnippet(animateur: $animateur, personne: $personne)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimateurSnippetImpl &&
            (identical(other.animateur, animateur) ||
                other.animateur == animateur) &&
            (identical(other.personne, personne) ||
                other.personne == personne));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, animateur, personne);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimateurSnippetImplCopyWith<_$AnimateurSnippetImpl> get copyWith =>
      __$$AnimateurSnippetImplCopyWithImpl<_$AnimateurSnippetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimateurSnippetImplToJson(
      this,
    );
  }
}

abstract class _AnimateurSnippet implements AnimateurSnippet {
  factory _AnimateurSnippet(
      {required final Animateur animateur,
      required final Personne personne}) = _$AnimateurSnippetImpl;

  factory _AnimateurSnippet.fromJson(Map<String, dynamic> json) =
      _$AnimateurSnippetImpl.fromJson;

  @override
  Animateur get animateur;
  @override
  Personne get personne;
  @override
  @JsonKey(ignore: true)
  _$$AnimateurSnippetImplCopyWith<_$AnimateurSnippetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CoAnimateurSnippet _$CoAnimateurSnippetFromJson(Map<String, dynamic> json) {
  return _CoAnimateurSnippet.fromJson(json);
}

/// @nodoc
mixin _$CoAnimateurSnippet {
  @JsonKey(name: 'co_animateur')
  CoAnimateur get coAnimateur => throw _privateConstructorUsedError;
  Personne get personne => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoAnimateurSnippetCopyWith<CoAnimateurSnippet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoAnimateurSnippetCopyWith<$Res> {
  factory $CoAnimateurSnippetCopyWith(
          CoAnimateurSnippet value, $Res Function(CoAnimateurSnippet) then) =
      _$CoAnimateurSnippetCopyWithImpl<$Res, CoAnimateurSnippet>;
  @useResult
  $Res call(
      {@JsonKey(name: 'co_animateur') CoAnimateur coAnimateur,
      Personne personne});

  $CoAnimateurCopyWith<$Res> get coAnimateur;
  $PersonneCopyWith<$Res> get personne;
}

/// @nodoc
class _$CoAnimateurSnippetCopyWithImpl<$Res, $Val extends CoAnimateurSnippet>
    implements $CoAnimateurSnippetCopyWith<$Res> {
  _$CoAnimateurSnippetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coAnimateur = null,
    Object? personne = null,
  }) {
    return _then(_value.copyWith(
      coAnimateur: null == coAnimateur
          ? _value.coAnimateur
          : coAnimateur // ignore: cast_nullable_to_non_nullable
              as CoAnimateur,
      personne: null == personne
          ? _value.personne
          : personne // ignore: cast_nullable_to_non_nullable
              as Personne,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CoAnimateurCopyWith<$Res> get coAnimateur {
    return $CoAnimateurCopyWith<$Res>(_value.coAnimateur, (value) {
      return _then(_value.copyWith(coAnimateur: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PersonneCopyWith<$Res> get personne {
    return $PersonneCopyWith<$Res>(_value.personne, (value) {
      return _then(_value.copyWith(personne: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CoAnimateurSnippetImplCopyWith<$Res>
    implements $CoAnimateurSnippetCopyWith<$Res> {
  factory _$$CoAnimateurSnippetImplCopyWith(_$CoAnimateurSnippetImpl value,
          $Res Function(_$CoAnimateurSnippetImpl) then) =
      __$$CoAnimateurSnippetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'co_animateur') CoAnimateur coAnimateur,
      Personne personne});

  @override
  $CoAnimateurCopyWith<$Res> get coAnimateur;
  @override
  $PersonneCopyWith<$Res> get personne;
}

/// @nodoc
class __$$CoAnimateurSnippetImplCopyWithImpl<$Res>
    extends _$CoAnimateurSnippetCopyWithImpl<$Res, _$CoAnimateurSnippetImpl>
    implements _$$CoAnimateurSnippetImplCopyWith<$Res> {
  __$$CoAnimateurSnippetImplCopyWithImpl(_$CoAnimateurSnippetImpl _value,
      $Res Function(_$CoAnimateurSnippetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coAnimateur = null,
    Object? personne = null,
  }) {
    return _then(_$CoAnimateurSnippetImpl(
      coAnimateur: null == coAnimateur
          ? _value.coAnimateur
          : coAnimateur // ignore: cast_nullable_to_non_nullable
              as CoAnimateur,
      personne: null == personne
          ? _value.personne
          : personne // ignore: cast_nullable_to_non_nullable
              as Personne,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoAnimateurSnippetImpl implements _CoAnimateurSnippet {
  _$CoAnimateurSnippetImpl(
      {@JsonKey(name: 'co_animateur') required this.coAnimateur,
      required this.personne});

  factory _$CoAnimateurSnippetImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoAnimateurSnippetImplFromJson(json);

  @override
  @JsonKey(name: 'co_animateur')
  final CoAnimateur coAnimateur;
  @override
  final Personne personne;

  @override
  String toString() {
    return 'CoAnimateurSnippet(coAnimateur: $coAnimateur, personne: $personne)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoAnimateurSnippetImpl &&
            (identical(other.coAnimateur, coAnimateur) ||
                other.coAnimateur == coAnimateur) &&
            (identical(other.personne, personne) ||
                other.personne == personne));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, coAnimateur, personne);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoAnimateurSnippetImplCopyWith<_$CoAnimateurSnippetImpl> get copyWith =>
      __$$CoAnimateurSnippetImplCopyWithImpl<_$CoAnimateurSnippetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoAnimateurSnippetImplToJson(
      this,
    );
  }
}

abstract class _CoAnimateurSnippet implements CoAnimateurSnippet {
  factory _CoAnimateurSnippet(
      {@JsonKey(name: 'co_animateur') required final CoAnimateur coAnimateur,
      required final Personne personne}) = _$CoAnimateurSnippetImpl;

  factory _CoAnimateurSnippet.fromJson(Map<String, dynamic> json) =
      _$CoAnimateurSnippetImpl.fromJson;

  @override
  @JsonKey(name: 'co_animateur')
  CoAnimateur get coAnimateur;
  @override
  Personne get personne;
  @override
  @JsonKey(ignore: true)
  _$$CoAnimateurSnippetImplCopyWith<_$CoAnimateurSnippetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AtelierSnippet _$AtelierSnippetFromJson(Map<String, dynamic> json) {
  return _AtelierSnippet.fromJson(json);
}

/// @nodoc
mixin _$AtelierSnippet {
  Atelier get atelier => throw _privateConstructorUsedError;
  List<ContactSnippet> get participants => throw _privateConstructorUsedError;
  List<AnimateurSnippet> get animateurs => throw _privateConstructorUsedError;
  @JsonKey(name: 'co_animateurs')
  List<CoAnimateurSnippet> get coAnimateurs =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AtelierSnippetCopyWith<AtelierSnippet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AtelierSnippetCopyWith<$Res> {
  factory $AtelierSnippetCopyWith(
          AtelierSnippet value, $Res Function(AtelierSnippet) then) =
      _$AtelierSnippetCopyWithImpl<$Res, AtelierSnippet>;
  @useResult
  $Res call(
      {Atelier atelier,
      List<ContactSnippet> participants,
      List<AnimateurSnippet> animateurs,
      @JsonKey(name: 'co_animateurs') List<CoAnimateurSnippet> coAnimateurs});

  $AtelierCopyWith<$Res> get atelier;
}

/// @nodoc
class _$AtelierSnippetCopyWithImpl<$Res, $Val extends AtelierSnippet>
    implements $AtelierSnippetCopyWith<$Res> {
  _$AtelierSnippetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? atelier = null,
    Object? participants = null,
    Object? animateurs = null,
    Object? coAnimateurs = null,
  }) {
    return _then(_value.copyWith(
      atelier: null == atelier
          ? _value.atelier
          : atelier // ignore: cast_nullable_to_non_nullable
              as Atelier,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<ContactSnippet>,
      animateurs: null == animateurs
          ? _value.animateurs
          : animateurs // ignore: cast_nullable_to_non_nullable
              as List<AnimateurSnippet>,
      coAnimateurs: null == coAnimateurs
          ? _value.coAnimateurs
          : coAnimateurs // ignore: cast_nullable_to_non_nullable
              as List<CoAnimateurSnippet>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AtelierCopyWith<$Res> get atelier {
    return $AtelierCopyWith<$Res>(_value.atelier, (value) {
      return _then(_value.copyWith(atelier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AtelierSnippetImplCopyWith<$Res>
    implements $AtelierSnippetCopyWith<$Res> {
  factory _$$AtelierSnippetImplCopyWith(_$AtelierSnippetImpl value,
          $Res Function(_$AtelierSnippetImpl) then) =
      __$$AtelierSnippetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Atelier atelier,
      List<ContactSnippet> participants,
      List<AnimateurSnippet> animateurs,
      @JsonKey(name: 'co_animateurs') List<CoAnimateurSnippet> coAnimateurs});

  @override
  $AtelierCopyWith<$Res> get atelier;
}

/// @nodoc
class __$$AtelierSnippetImplCopyWithImpl<$Res>
    extends _$AtelierSnippetCopyWithImpl<$Res, _$AtelierSnippetImpl>
    implements _$$AtelierSnippetImplCopyWith<$Res> {
  __$$AtelierSnippetImplCopyWithImpl(
      _$AtelierSnippetImpl _value, $Res Function(_$AtelierSnippetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? atelier = null,
    Object? participants = null,
    Object? animateurs = null,
    Object? coAnimateurs = null,
  }) {
    return _then(_$AtelierSnippetImpl(
      atelier: null == atelier
          ? _value.atelier
          : atelier // ignore: cast_nullable_to_non_nullable
              as Atelier,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<ContactSnippet>,
      animateurs: null == animateurs
          ? _value._animateurs
          : animateurs // ignore: cast_nullable_to_non_nullable
              as List<AnimateurSnippet>,
      coAnimateurs: null == coAnimateurs
          ? _value._coAnimateurs
          : coAnimateurs // ignore: cast_nullable_to_non_nullable
              as List<CoAnimateurSnippet>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AtelierSnippetImpl implements _AtelierSnippet {
  _$AtelierSnippetImpl(
      {required this.atelier,
      required final List<ContactSnippet> participants,
      required final List<AnimateurSnippet> animateurs,
      @JsonKey(name: 'co_animateurs')
      required final List<CoAnimateurSnippet> coAnimateurs})
      : _participants = participants,
        _animateurs = animateurs,
        _coAnimateurs = coAnimateurs;

  factory _$AtelierSnippetImpl.fromJson(Map<String, dynamic> json) =>
      _$$AtelierSnippetImplFromJson(json);

  @override
  final Atelier atelier;
  final List<ContactSnippet> _participants;
  @override
  List<ContactSnippet> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  final List<AnimateurSnippet> _animateurs;
  @override
  List<AnimateurSnippet> get animateurs {
    if (_animateurs is EqualUnmodifiableListView) return _animateurs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_animateurs);
  }

  final List<CoAnimateurSnippet> _coAnimateurs;
  @override
  @JsonKey(name: 'co_animateurs')
  List<CoAnimateurSnippet> get coAnimateurs {
    if (_coAnimateurs is EqualUnmodifiableListView) return _coAnimateurs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coAnimateurs);
  }

  @override
  String toString() {
    return 'AtelierSnippet(atelier: $atelier, participants: $participants, animateurs: $animateurs, coAnimateurs: $coAnimateurs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AtelierSnippetImpl &&
            (identical(other.atelier, atelier) || other.atelier == atelier) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            const DeepCollectionEquality()
                .equals(other._animateurs, _animateurs) &&
            const DeepCollectionEquality()
                .equals(other._coAnimateurs, _coAnimateurs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      atelier,
      const DeepCollectionEquality().hash(_participants),
      const DeepCollectionEquality().hash(_animateurs),
      const DeepCollectionEquality().hash(_coAnimateurs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AtelierSnippetImplCopyWith<_$AtelierSnippetImpl> get copyWith =>
      __$$AtelierSnippetImplCopyWithImpl<_$AtelierSnippetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AtelierSnippetImplToJson(
      this,
    );
  }
}

abstract class _AtelierSnippet implements AtelierSnippet {
  factory _AtelierSnippet(
          {required final Atelier atelier,
          required final List<ContactSnippet> participants,
          required final List<AnimateurSnippet> animateurs,
          @JsonKey(name: 'co_animateurs')
          required final List<CoAnimateurSnippet> coAnimateurs}) =
      _$AtelierSnippetImpl;

  factory _AtelierSnippet.fromJson(Map<String, dynamic> json) =
      _$AtelierSnippetImpl.fromJson;

  @override
  Atelier get atelier;
  @override
  List<ContactSnippet> get participants;
  @override
  List<AnimateurSnippet> get animateurs;
  @override
  @JsonKey(name: 'co_animateurs')
  List<CoAnimateurSnippet> get coAnimateurs;
  @override
  @JsonKey(ignore: true)
  _$$AtelierSnippetImplCopyWith<_$AtelierSnippetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FicheSnippet _$FicheSnippetFromJson(Map<String, dynamic> json) {
  return _FicheSnippet.fromJson(json);
}

/// @nodoc
mixin _$FicheSnippet {
  Fiche get fiche => throw _privateConstructorUsedError;
  ContactSnippet get contact => throw _privateConstructorUsedError;
  Flux get flux => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FicheSnippetCopyWith<FicheSnippet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FicheSnippetCopyWith<$Res> {
  factory $FicheSnippetCopyWith(
          FicheSnippet value, $Res Function(FicheSnippet) then) =
      _$FicheSnippetCopyWithImpl<$Res, FicheSnippet>;
  @useResult
  $Res call({Fiche fiche, ContactSnippet contact, Flux flux});

  $FicheCopyWith<$Res> get fiche;
  $ContactSnippetCopyWith<$Res> get contact;
  $FluxCopyWith<$Res> get flux;
}

/// @nodoc
class _$FicheSnippetCopyWithImpl<$Res, $Val extends FicheSnippet>
    implements $FicheSnippetCopyWith<$Res> {
  _$FicheSnippetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fiche = null,
    Object? contact = null,
    Object? flux = null,
  }) {
    return _then(_value.copyWith(
      fiche: null == fiche
          ? _value.fiche
          : fiche // ignore: cast_nullable_to_non_nullable
              as Fiche,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as ContactSnippet,
      flux: null == flux
          ? _value.flux
          : flux // ignore: cast_nullable_to_non_nullable
              as Flux,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FicheCopyWith<$Res> get fiche {
    return $FicheCopyWith<$Res>(_value.fiche, (value) {
      return _then(_value.copyWith(fiche: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactSnippetCopyWith<$Res> get contact {
    return $ContactSnippetCopyWith<$Res>(_value.contact, (value) {
      return _then(_value.copyWith(contact: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FluxCopyWith<$Res> get flux {
    return $FluxCopyWith<$Res>(_value.flux, (value) {
      return _then(_value.copyWith(flux: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FicheSnippetImplCopyWith<$Res>
    implements $FicheSnippetCopyWith<$Res> {
  factory _$$FicheSnippetImplCopyWith(
          _$FicheSnippetImpl value, $Res Function(_$FicheSnippetImpl) then) =
      __$$FicheSnippetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fiche fiche, ContactSnippet contact, Flux flux});

  @override
  $FicheCopyWith<$Res> get fiche;
  @override
  $ContactSnippetCopyWith<$Res> get contact;
  @override
  $FluxCopyWith<$Res> get flux;
}

/// @nodoc
class __$$FicheSnippetImplCopyWithImpl<$Res>
    extends _$FicheSnippetCopyWithImpl<$Res, _$FicheSnippetImpl>
    implements _$$FicheSnippetImplCopyWith<$Res> {
  __$$FicheSnippetImplCopyWithImpl(
      _$FicheSnippetImpl _value, $Res Function(_$FicheSnippetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fiche = null,
    Object? contact = null,
    Object? flux = null,
  }) {
    return _then(_$FicheSnippetImpl(
      fiche: null == fiche
          ? _value.fiche
          : fiche // ignore: cast_nullable_to_non_nullable
              as Fiche,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as ContactSnippet,
      flux: null == flux
          ? _value.flux
          : flux // ignore: cast_nullable_to_non_nullable
              as Flux,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FicheSnippetImpl implements _FicheSnippet {
  _$FicheSnippetImpl(
      {required this.fiche, required this.contact, required this.flux});

  factory _$FicheSnippetImpl.fromJson(Map<String, dynamic> json) =>
      _$$FicheSnippetImplFromJson(json);

  @override
  final Fiche fiche;
  @override
  final ContactSnippet contact;
  @override
  final Flux flux;

  @override
  String toString() {
    return 'FicheSnippet(fiche: $fiche, contact: $contact, flux: $flux)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FicheSnippetImpl &&
            (identical(other.fiche, fiche) || other.fiche == fiche) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.flux, flux) || other.flux == flux));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fiche, contact, flux);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FicheSnippetImplCopyWith<_$FicheSnippetImpl> get copyWith =>
      __$$FicheSnippetImplCopyWithImpl<_$FicheSnippetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FicheSnippetImplToJson(
      this,
    );
  }
}

abstract class _FicheSnippet implements FicheSnippet {
  factory _FicheSnippet(
      {required final Fiche fiche,
      required final ContactSnippet contact,
      required final Flux flux}) = _$FicheSnippetImpl;

  factory _FicheSnippet.fromJson(Map<String, dynamic> json) =
      _$FicheSnippetImpl.fromJson;

  @override
  Fiche get fiche;
  @override
  ContactSnippet get contact;
  @override
  Flux get flux;
  @override
  @JsonKey(ignore: true)
  _$$FicheSnippetImplCopyWith<_$FicheSnippetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FluxSnippet _$FluxSnippetFromJson(Map<String, dynamic> json) {
  return _FluxSnippet.fromJson(json);
}

/// @nodoc
mixin _$FluxSnippet {
  Flux get flux => throw _privateConstructorUsedError;
  ContactSnippet get contact => throw _privateConstructorUsedError;
  List<AnimateurSnippet> get animateurs => throw _privateConstructorUsedError;
  @JsonKey(name: 'co_animateurs')
  List<CoAnimateurSnippet> get coAnimateurs =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FluxSnippetCopyWith<FluxSnippet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FluxSnippetCopyWith<$Res> {
  factory $FluxSnippetCopyWith(
          FluxSnippet value, $Res Function(FluxSnippet) then) =
      _$FluxSnippetCopyWithImpl<$Res, FluxSnippet>;
  @useResult
  $Res call(
      {Flux flux,
      ContactSnippet contact,
      List<AnimateurSnippet> animateurs,
      @JsonKey(name: 'co_animateurs') List<CoAnimateurSnippet> coAnimateurs});

  $FluxCopyWith<$Res> get flux;
  $ContactSnippetCopyWith<$Res> get contact;
}

/// @nodoc
class _$FluxSnippetCopyWithImpl<$Res, $Val extends FluxSnippet>
    implements $FluxSnippetCopyWith<$Res> {
  _$FluxSnippetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flux = null,
    Object? contact = null,
    Object? animateurs = null,
    Object? coAnimateurs = null,
  }) {
    return _then(_value.copyWith(
      flux: null == flux
          ? _value.flux
          : flux // ignore: cast_nullable_to_non_nullable
              as Flux,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as ContactSnippet,
      animateurs: null == animateurs
          ? _value.animateurs
          : animateurs // ignore: cast_nullable_to_non_nullable
              as List<AnimateurSnippet>,
      coAnimateurs: null == coAnimateurs
          ? _value.coAnimateurs
          : coAnimateurs // ignore: cast_nullable_to_non_nullable
              as List<CoAnimateurSnippet>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FluxCopyWith<$Res> get flux {
    return $FluxCopyWith<$Res>(_value.flux, (value) {
      return _then(_value.copyWith(flux: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactSnippetCopyWith<$Res> get contact {
    return $ContactSnippetCopyWith<$Res>(_value.contact, (value) {
      return _then(_value.copyWith(contact: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FluxSnippetImplCopyWith<$Res>
    implements $FluxSnippetCopyWith<$Res> {
  factory _$$FluxSnippetImplCopyWith(
          _$FluxSnippetImpl value, $Res Function(_$FluxSnippetImpl) then) =
      __$$FluxSnippetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Flux flux,
      ContactSnippet contact,
      List<AnimateurSnippet> animateurs,
      @JsonKey(name: 'co_animateurs') List<CoAnimateurSnippet> coAnimateurs});

  @override
  $FluxCopyWith<$Res> get flux;
  @override
  $ContactSnippetCopyWith<$Res> get contact;
}

/// @nodoc
class __$$FluxSnippetImplCopyWithImpl<$Res>
    extends _$FluxSnippetCopyWithImpl<$Res, _$FluxSnippetImpl>
    implements _$$FluxSnippetImplCopyWith<$Res> {
  __$$FluxSnippetImplCopyWithImpl(
      _$FluxSnippetImpl _value, $Res Function(_$FluxSnippetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flux = null,
    Object? contact = null,
    Object? animateurs = null,
    Object? coAnimateurs = null,
  }) {
    return _then(_$FluxSnippetImpl(
      flux: null == flux
          ? _value.flux
          : flux // ignore: cast_nullable_to_non_nullable
              as Flux,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as ContactSnippet,
      animateurs: null == animateurs
          ? _value._animateurs
          : animateurs // ignore: cast_nullable_to_non_nullable
              as List<AnimateurSnippet>,
      coAnimateurs: null == coAnimateurs
          ? _value._coAnimateurs
          : coAnimateurs // ignore: cast_nullable_to_non_nullable
              as List<CoAnimateurSnippet>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FluxSnippetImpl implements _FluxSnippet {
  _$FluxSnippetImpl(
      {required this.flux,
      required this.contact,
      required final List<AnimateurSnippet> animateurs,
      @JsonKey(name: 'co_animateurs')
      required final List<CoAnimateurSnippet> coAnimateurs})
      : _animateurs = animateurs,
        _coAnimateurs = coAnimateurs;

  factory _$FluxSnippetImpl.fromJson(Map<String, dynamic> json) =>
      _$$FluxSnippetImplFromJson(json);

  @override
  final Flux flux;
  @override
  final ContactSnippet contact;
  final List<AnimateurSnippet> _animateurs;
  @override
  List<AnimateurSnippet> get animateurs {
    if (_animateurs is EqualUnmodifiableListView) return _animateurs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_animateurs);
  }

  final List<CoAnimateurSnippet> _coAnimateurs;
  @override
  @JsonKey(name: 'co_animateurs')
  List<CoAnimateurSnippet> get coAnimateurs {
    if (_coAnimateurs is EqualUnmodifiableListView) return _coAnimateurs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coAnimateurs);
  }

  @override
  String toString() {
    return 'FluxSnippet(flux: $flux, contact: $contact, animateurs: $animateurs, coAnimateurs: $coAnimateurs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FluxSnippetImpl &&
            (identical(other.flux, flux) || other.flux == flux) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            const DeepCollectionEquality()
                .equals(other._animateurs, _animateurs) &&
            const DeepCollectionEquality()
                .equals(other._coAnimateurs, _coAnimateurs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      flux,
      contact,
      const DeepCollectionEquality().hash(_animateurs),
      const DeepCollectionEquality().hash(_coAnimateurs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FluxSnippetImplCopyWith<_$FluxSnippetImpl> get copyWith =>
      __$$FluxSnippetImplCopyWithImpl<_$FluxSnippetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FluxSnippetImplToJson(
      this,
    );
  }
}

abstract class _FluxSnippet implements FluxSnippet {
  factory _FluxSnippet(
          {required final Flux flux,
          required final ContactSnippet contact,
          required final List<AnimateurSnippet> animateurs,
          @JsonKey(name: 'co_animateurs')
          required final List<CoAnimateurSnippet> coAnimateurs}) =
      _$FluxSnippetImpl;

  factory _FluxSnippet.fromJson(Map<String, dynamic> json) =
      _$FluxSnippetImpl.fromJson;

  @override
  Flux get flux;
  @override
  ContactSnippet get contact;
  @override
  List<AnimateurSnippet> get animateurs;
  @override
  @JsonKey(name: 'co_animateurs')
  List<CoAnimateurSnippet> get coAnimateurs;
  @override
  @JsonKey(ignore: true)
  _$$FluxSnippetImplCopyWith<_$FluxSnippetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SynergieSnippet _$SynergieSnippetFromJson(Map<String, dynamic> json) {
  return _SynergieSnippet.fromJson(json);
}

/// @nodoc
mixin _$SynergieSnippet {
  Synergie get synergie => throw _privateConstructorUsedError;
  List<Flux> get flux => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SynergieSnippetCopyWith<SynergieSnippet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SynergieSnippetCopyWith<$Res> {
  factory $SynergieSnippetCopyWith(
          SynergieSnippet value, $Res Function(SynergieSnippet) then) =
      _$SynergieSnippetCopyWithImpl<$Res, SynergieSnippet>;
  @useResult
  $Res call({Synergie synergie, List<Flux> flux});

  $SynergieCopyWith<$Res> get synergie;
}

/// @nodoc
class _$SynergieSnippetCopyWithImpl<$Res, $Val extends SynergieSnippet>
    implements $SynergieSnippetCopyWith<$Res> {
  _$SynergieSnippetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? synergie = null,
    Object? flux = null,
  }) {
    return _then(_value.copyWith(
      synergie: null == synergie
          ? _value.synergie
          : synergie // ignore: cast_nullable_to_non_nullable
              as Synergie,
      flux: null == flux
          ? _value.flux
          : flux // ignore: cast_nullable_to_non_nullable
              as List<Flux>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SynergieCopyWith<$Res> get synergie {
    return $SynergieCopyWith<$Res>(_value.synergie, (value) {
      return _then(_value.copyWith(synergie: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SynergieSnippetImplCopyWith<$Res>
    implements $SynergieSnippetCopyWith<$Res> {
  factory _$$SynergieSnippetImplCopyWith(_$SynergieSnippetImpl value,
          $Res Function(_$SynergieSnippetImpl) then) =
      __$$SynergieSnippetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Synergie synergie, List<Flux> flux});

  @override
  $SynergieCopyWith<$Res> get synergie;
}

/// @nodoc
class __$$SynergieSnippetImplCopyWithImpl<$Res>
    extends _$SynergieSnippetCopyWithImpl<$Res, _$SynergieSnippetImpl>
    implements _$$SynergieSnippetImplCopyWith<$Res> {
  __$$SynergieSnippetImplCopyWithImpl(
      _$SynergieSnippetImpl _value, $Res Function(_$SynergieSnippetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? synergie = null,
    Object? flux = null,
  }) {
    return _then(_$SynergieSnippetImpl(
      synergie: null == synergie
          ? _value.synergie
          : synergie // ignore: cast_nullable_to_non_nullable
              as Synergie,
      flux: null == flux
          ? _value._flux
          : flux // ignore: cast_nullable_to_non_nullable
              as List<Flux>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SynergieSnippetImpl implements _SynergieSnippet {
  _$SynergieSnippetImpl(
      {required this.synergie, required final List<Flux> flux})
      : _flux = flux;

  factory _$SynergieSnippetImpl.fromJson(Map<String, dynamic> json) =>
      _$$SynergieSnippetImplFromJson(json);

  @override
  final Synergie synergie;
  final List<Flux> _flux;
  @override
  List<Flux> get flux {
    if (_flux is EqualUnmodifiableListView) return _flux;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flux);
  }

  @override
  String toString() {
    return 'SynergieSnippet(synergie: $synergie, flux: $flux)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SynergieSnippetImpl &&
            (identical(other.synergie, synergie) ||
                other.synergie == synergie) &&
            const DeepCollectionEquality().equals(other._flux, _flux));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, synergie, const DeepCollectionEquality().hash(_flux));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SynergieSnippetImplCopyWith<_$SynergieSnippetImpl> get copyWith =>
      __$$SynergieSnippetImplCopyWithImpl<_$SynergieSnippetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SynergieSnippetImplToJson(
      this,
    );
  }
}

abstract class _SynergieSnippet implements SynergieSnippet {
  factory _SynergieSnippet(
      {required final Synergie synergie,
      required final List<Flux> flux}) = _$SynergieSnippetImpl;

  factory _SynergieSnippet.fromJson(Map<String, dynamic> json) =
      _$SynergieSnippetImpl.fromJson;

  @override
  Synergie get synergie;
  @override
  List<Flux> get flux;
  @override
  @JsonKey(ignore: true)
  _$$SynergieSnippetImplCopyWith<_$SynergieSnippetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
