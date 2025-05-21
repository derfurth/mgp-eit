// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'donnees.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Personne _$PersonneFromJson(Map<String, dynamic> json) {
  return _Personne.fromJson(json);
}

/// @nodoc
mixin _$Personne {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'demarche_id')
  String get demarcheId => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String get prenom => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get telephone => throw _privateConstructorUsedError;
  bool get limited => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;

  /// Serializes this Personne to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Personne
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonneCopyWith<Personne> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonneCopyWith<$Res> {
  factory $PersonneCopyWith(Personne value, $Res Function(Personne) then) =
      _$PersonneCopyWithImpl<$Res, Personne>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'demarche_id') String demarcheId,
      String nom,
      String prenom,
      String email,
      String telephone,
      bool limited,
      bool deleted});
}

/// @nodoc
class _$PersonneCopyWithImpl<$Res, $Val extends Personne>
    implements $PersonneCopyWith<$Res> {
  _$PersonneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Personne
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? demarcheId = null,
    Object? nom = null,
    Object? prenom = null,
    Object? email = null,
    Object? telephone = null,
    Object? limited = null,
    Object? deleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      prenom: null == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      telephone: null == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String,
      limited: null == limited
          ? _value.limited
          : limited // ignore: cast_nullable_to_non_nullable
              as bool,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonneImplCopyWith<$Res>
    implements $PersonneCopyWith<$Res> {
  factory _$$PersonneImplCopyWith(
          _$PersonneImpl value, $Res Function(_$PersonneImpl) then) =
      __$$PersonneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'demarche_id') String demarcheId,
      String nom,
      String prenom,
      String email,
      String telephone,
      bool limited,
      bool deleted});
}

/// @nodoc
class __$$PersonneImplCopyWithImpl<$Res>
    extends _$PersonneCopyWithImpl<$Res, _$PersonneImpl>
    implements _$$PersonneImplCopyWith<$Res> {
  __$$PersonneImplCopyWithImpl(
      _$PersonneImpl _value, $Res Function(_$PersonneImpl) _then)
      : super(_value, _then);

  /// Create a copy of Personne
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? demarcheId = null,
    Object? nom = null,
    Object? prenom = null,
    Object? email = null,
    Object? telephone = null,
    Object? limited = null,
    Object? deleted = null,
  }) {
    return _then(_$PersonneImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      prenom: null == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      telephone: null == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String,
      limited: null == limited
          ? _value.limited
          : limited // ignore: cast_nullable_to_non_nullable
              as bool,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonneImpl extends _Personne {
  const _$PersonneImpl(
      {required this.id,
      @JsonKey(name: 'demarche_id') required this.demarcheId,
      this.nom = '',
      this.prenom = '',
      this.email = '',
      this.telephone = '',
      this.limited = false,
      this.deleted = false})
      : super._();

  factory _$PersonneImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonneImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'demarche_id')
  final String demarcheId;
  @override
  @JsonKey()
  final String nom;
  @override
  @JsonKey()
  final String prenom;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String telephone;
  @override
  @JsonKey()
  final bool limited;
  @override
  @JsonKey()
  final bool deleted;

  @override
  String toString() {
    return 'Personne(id: $id, demarcheId: $demarcheId, nom: $nom, prenom: $prenom, email: $email, telephone: $telephone, limited: $limited, deleted: $deleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonneImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.demarcheId, demarcheId) ||
                other.demarcheId == demarcheId) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.limited, limited) || other.limited == limited) &&
            (identical(other.deleted, deleted) || other.deleted == deleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, demarcheId, nom, prenom,
      email, telephone, limited, deleted);

  /// Create a copy of Personne
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonneImplCopyWith<_$PersonneImpl> get copyWith =>
      __$$PersonneImplCopyWithImpl<_$PersonneImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonneImplToJson(
      this,
    );
  }
}

abstract class _Personne extends Personne {
  const factory _Personne(
      {required final String id,
      @JsonKey(name: 'demarche_id') required final String demarcheId,
      final String nom,
      final String prenom,
      final String email,
      final String telephone,
      final bool limited,
      final bool deleted}) = _$PersonneImpl;
  const _Personne._() : super._();

  factory _Personne.fromJson(Map<String, dynamic> json) =
      _$PersonneImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'demarche_id')
  String get demarcheId;
  @override
  String get nom;
  @override
  String get prenom;
  @override
  String get email;
  @override
  String get telephone;
  @override
  bool get limited;
  @override
  bool get deleted;

  /// Create a copy of Personne
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonneImplCopyWith<_$PersonneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Administrateur _$AdministrateurFromJson(Map<String, dynamic> json) {
  return _Administrateur.fromJson(json);
}

/// @nodoc
mixin _$Administrateur {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String get prenom => throw _privateConstructorUsedError;

  /// Serializes this Administrateur to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Administrateur
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdministrateurCopyWith<Administrateur> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdministrateurCopyWith<$Res> {
  factory $AdministrateurCopyWith(
          Administrateur value, $Res Function(Administrateur) then) =
      _$AdministrateurCopyWithImpl<$Res, Administrateur>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      String nom,
      String prenom});
}

/// @nodoc
class _$AdministrateurCopyWithImpl<$Res, $Val extends Administrateur>
    implements $AdministrateurCopyWith<$Res> {
  _$AdministrateurCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Administrateur
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? nom = null,
    Object? prenom = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      prenom: null == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdministrateurImplCopyWith<$Res>
    implements $AdministrateurCopyWith<$Res> {
  factory _$$AdministrateurImplCopyWith(_$AdministrateurImpl value,
          $Res Function(_$AdministrateurImpl) then) =
      __$$AdministrateurImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      String nom,
      String prenom});
}

/// @nodoc
class __$$AdministrateurImplCopyWithImpl<$Res>
    extends _$AdministrateurCopyWithImpl<$Res, _$AdministrateurImpl>
    implements _$$AdministrateurImplCopyWith<$Res> {
  __$$AdministrateurImplCopyWithImpl(
      _$AdministrateurImpl _value, $Res Function(_$AdministrateurImpl) _then)
      : super(_value, _then);

  /// Create a copy of Administrateur
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? nom = null,
    Object? prenom = null,
  }) {
    return _then(_$AdministrateurImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      prenom: null == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdministrateurImpl extends _Administrateur {
  const _$AdministrateurImpl(
      {required this.id,
      @JsonKey(name: 'user_id') this.userId,
      this.nom = '',
      this.prenom = ''})
      : super._();

  factory _$AdministrateurImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdministrateurImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey()
  final String nom;
  @override
  @JsonKey()
  final String prenom;

  @override
  String toString() {
    return 'Administrateur(id: $id, userId: $userId, nom: $nom, prenom: $prenom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdministrateurImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.prenom, prenom) || other.prenom == prenom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, nom, prenom);

  /// Create a copy of Administrateur
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdministrateurImplCopyWith<_$AdministrateurImpl> get copyWith =>
      __$$AdministrateurImplCopyWithImpl<_$AdministrateurImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdministrateurImplToJson(
      this,
    );
  }
}

abstract class _Administrateur extends Administrateur {
  const factory _Administrateur(
      {required final String id,
      @JsonKey(name: 'user_id') final String? userId,
      final String nom,
      final String prenom}) = _$AdministrateurImpl;
  const _Administrateur._() : super._();

  factory _Administrateur.fromJson(Map<String, dynamic> json) =
      _$AdministrateurImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  String get nom;
  @override
  String get prenom;

  /// Create a copy of Administrateur
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdministrateurImplCopyWith<_$AdministrateurImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Animateur _$AnimateurFromJson(Map<String, dynamic> json) {
  return _Animateur.fromJson(json);
}

/// @nodoc
mixin _$Animateur {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'demarche_id')
  String get demarcheId => throw _privateConstructorUsedError;
  @JsonKey(name: 'personne_id')
  String get personneId => throw _privateConstructorUsedError;

  /// Serializes this Animateur to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Animateur
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimateurCopyWith<Animateur> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimateurCopyWith<$Res> {
  factory $AnimateurCopyWith(Animateur value, $Res Function(Animateur) then) =
      _$AnimateurCopyWithImpl<$Res, Animateur>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'personne_id') String personneId});
}

/// @nodoc
class _$AnimateurCopyWithImpl<$Res, $Val extends Animateur>
    implements $AnimateurCopyWith<$Res> {
  _$AnimateurCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Animateur
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? demarcheId = null,
    Object? personneId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      personneId: null == personneId
          ? _value.personneId
          : personneId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimateurImplCopyWith<$Res>
    implements $AnimateurCopyWith<$Res> {
  factory _$$AnimateurImplCopyWith(
          _$AnimateurImpl value, $Res Function(_$AnimateurImpl) then) =
      __$$AnimateurImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'personne_id') String personneId});
}

/// @nodoc
class __$$AnimateurImplCopyWithImpl<$Res>
    extends _$AnimateurCopyWithImpl<$Res, _$AnimateurImpl>
    implements _$$AnimateurImplCopyWith<$Res> {
  __$$AnimateurImplCopyWithImpl(
      _$AnimateurImpl _value, $Res Function(_$AnimateurImpl) _then)
      : super(_value, _then);

  /// Create a copy of Animateur
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? demarcheId = null,
    Object? personneId = null,
  }) {
    return _then(_$AnimateurImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      personneId: null == personneId
          ? _value.personneId
          : personneId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimateurImpl implements _Animateur {
  const _$AnimateurImpl(
      {required this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'demarche_id') required this.demarcheId,
      @JsonKey(name: 'personne_id') this.personneId = ''});

  factory _$AnimateurImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimateurImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'demarche_id')
  final String demarcheId;
  @override
  @JsonKey(name: 'personne_id')
  final String personneId;

  @override
  String toString() {
    return 'Animateur(id: $id, userId: $userId, demarcheId: $demarcheId, personneId: $personneId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimateurImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.demarcheId, demarcheId) ||
                other.demarcheId == demarcheId) &&
            (identical(other.personneId, personneId) ||
                other.personneId == personneId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, demarcheId, personneId);

  /// Create a copy of Animateur
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimateurImplCopyWith<_$AnimateurImpl> get copyWith =>
      __$$AnimateurImplCopyWithImpl<_$AnimateurImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimateurImplToJson(
      this,
    );
  }
}

abstract class _Animateur implements Animateur {
  const factory _Animateur(
      {required final String id,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'demarche_id') required final String demarcheId,
      @JsonKey(name: 'personne_id') final String personneId}) = _$AnimateurImpl;

  factory _Animateur.fromJson(Map<String, dynamic> json) =
      _$AnimateurImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'demarche_id')
  String get demarcheId;
  @override
  @JsonKey(name: 'personne_id')
  String get personneId;

  /// Create a copy of Animateur
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimateurImplCopyWith<_$AnimateurImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CoAnimateur _$CoAnimateurFromJson(Map<String, dynamic> json) {
  return _CoAnimateur.fromJson(json);
}

/// @nodoc
mixin _$CoAnimateur {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'demarche_id')
  String get demarcheId => throw _privateConstructorUsedError;
  @JsonKey(name: 'personne_id')
  String get personneId => throw _privateConstructorUsedError;

  /// Serializes this CoAnimateur to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoAnimateur
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoAnimateurCopyWith<CoAnimateur> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoAnimateurCopyWith<$Res> {
  factory $CoAnimateurCopyWith(
          CoAnimateur value, $Res Function(CoAnimateur) then) =
      _$CoAnimateurCopyWithImpl<$Res, CoAnimateur>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'personne_id') String personneId});
}

/// @nodoc
class _$CoAnimateurCopyWithImpl<$Res, $Val extends CoAnimateur>
    implements $CoAnimateurCopyWith<$Res> {
  _$CoAnimateurCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoAnimateur
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? demarcheId = null,
    Object? personneId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      personneId: null == personneId
          ? _value.personneId
          : personneId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoAnimateurImplCopyWith<$Res>
    implements $CoAnimateurCopyWith<$Res> {
  factory _$$CoAnimateurImplCopyWith(
          _$CoAnimateurImpl value, $Res Function(_$CoAnimateurImpl) then) =
      __$$CoAnimateurImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'personne_id') String personneId});
}

/// @nodoc
class __$$CoAnimateurImplCopyWithImpl<$Res>
    extends _$CoAnimateurCopyWithImpl<$Res, _$CoAnimateurImpl>
    implements _$$CoAnimateurImplCopyWith<$Res> {
  __$$CoAnimateurImplCopyWithImpl(
      _$CoAnimateurImpl _value, $Res Function(_$CoAnimateurImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoAnimateur
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? demarcheId = null,
    Object? personneId = null,
  }) {
    return _then(_$CoAnimateurImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      personneId: null == personneId
          ? _value.personneId
          : personneId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoAnimateurImpl implements _CoAnimateur {
  const _$CoAnimateurImpl(
      {required this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'demarche_id') required this.demarcheId,
      @JsonKey(name: 'personne_id') this.personneId = ''});

  factory _$CoAnimateurImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoAnimateurImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'demarche_id')
  final String demarcheId;
  @override
  @JsonKey(name: 'personne_id')
  final String personneId;

  @override
  String toString() {
    return 'CoAnimateur(id: $id, userId: $userId, demarcheId: $demarcheId, personneId: $personneId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoAnimateurImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.demarcheId, demarcheId) ||
                other.demarcheId == demarcheId) &&
            (identical(other.personneId, personneId) ||
                other.personneId == personneId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, demarcheId, personneId);

  /// Create a copy of CoAnimateur
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoAnimateurImplCopyWith<_$CoAnimateurImpl> get copyWith =>
      __$$CoAnimateurImplCopyWithImpl<_$CoAnimateurImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoAnimateurImplToJson(
      this,
    );
  }
}

abstract class _CoAnimateur implements CoAnimateur {
  const factory _CoAnimateur(
          {required final String id,
          @JsonKey(name: 'user_id') final String? userId,
          @JsonKey(name: 'demarche_id') required final String demarcheId,
          @JsonKey(name: 'personne_id') final String personneId}) =
      _$CoAnimateurImpl;

  factory _CoAnimateur.fromJson(Map<String, dynamic> json) =
      _$CoAnimateurImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'demarche_id')
  String get demarcheId;
  @override
  @JsonKey(name: 'personne_id')
  String get personneId;

  /// Create a copy of CoAnimateur
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoAnimateurImplCopyWith<_$CoAnimateurImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Demarche _$DemarcheFromJson(Map<String, dynamic> json) {
  return _Demarche.fromJson(json);
}

/// @nodoc
mixin _$Demarche {
  String get id => throw _privateConstructorUsedError;
  String get denomination => throw _privateConstructorUsedError;
  @JsonKey(name: 'champ_libre')
  String get champLibre => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;

  /// Serializes this Demarche to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Demarche
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DemarcheCopyWith<Demarche> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DemarcheCopyWith<$Res> {
  factory $DemarcheCopyWith(Demarche value, $Res Function(Demarche) then) =
      _$DemarcheCopyWithImpl<$Res, Demarche>;
  @useResult
  $Res call(
      {String id,
      String denomination,
      @JsonKey(name: 'champ_libre') String champLibre,
      bool deleted});
}

/// @nodoc
class _$DemarcheCopyWithImpl<$Res, $Val extends Demarche>
    implements $DemarcheCopyWith<$Res> {
  _$DemarcheCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Demarche
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? denomination = null,
    Object? champLibre = null,
    Object? deleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      denomination: null == denomination
          ? _value.denomination
          : denomination // ignore: cast_nullable_to_non_nullable
              as String,
      champLibre: null == champLibre
          ? _value.champLibre
          : champLibre // ignore: cast_nullable_to_non_nullable
              as String,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DemarcheImplCopyWith<$Res>
    implements $DemarcheCopyWith<$Res> {
  factory _$$DemarcheImplCopyWith(
          _$DemarcheImpl value, $Res Function(_$DemarcheImpl) then) =
      __$$DemarcheImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String denomination,
      @JsonKey(name: 'champ_libre') String champLibre,
      bool deleted});
}

/// @nodoc
class __$$DemarcheImplCopyWithImpl<$Res>
    extends _$DemarcheCopyWithImpl<$Res, _$DemarcheImpl>
    implements _$$DemarcheImplCopyWith<$Res> {
  __$$DemarcheImplCopyWithImpl(
      _$DemarcheImpl _value, $Res Function(_$DemarcheImpl) _then)
      : super(_value, _then);

  /// Create a copy of Demarche
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? denomination = null,
    Object? champLibre = null,
    Object? deleted = null,
  }) {
    return _then(_$DemarcheImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      denomination: null == denomination
          ? _value.denomination
          : denomination // ignore: cast_nullable_to_non_nullable
              as String,
      champLibre: null == champLibre
          ? _value.champLibre
          : champLibre // ignore: cast_nullable_to_non_nullable
              as String,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DemarcheImpl implements _Demarche {
  const _$DemarcheImpl(
      {required this.id,
      this.denomination = '',
      @JsonKey(name: 'champ_libre') this.champLibre = '',
      this.deleted = false});

  factory _$DemarcheImpl.fromJson(Map<String, dynamic> json) =>
      _$$DemarcheImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String denomination;
  @override
  @JsonKey(name: 'champ_libre')
  final String champLibre;
  @override
  @JsonKey()
  final bool deleted;

  @override
  String toString() {
    return 'Demarche(id: $id, denomination: $denomination, champLibre: $champLibre, deleted: $deleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DemarcheImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.denomination, denomination) ||
                other.denomination == denomination) &&
            (identical(other.champLibre, champLibre) ||
                other.champLibre == champLibre) &&
            (identical(other.deleted, deleted) || other.deleted == deleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, denomination, champLibre, deleted);

  /// Create a copy of Demarche
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DemarcheImplCopyWith<_$DemarcheImpl> get copyWith =>
      __$$DemarcheImplCopyWithImpl<_$DemarcheImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DemarcheImplToJson(
      this,
    );
  }
}

abstract class _Demarche implements Demarche {
  const factory _Demarche(
      {required final String id,
      final String denomination,
      @JsonKey(name: 'champ_libre') final String champLibre,
      final bool deleted}) = _$DemarcheImpl;

  factory _Demarche.fromJson(Map<String, dynamic> json) =
      _$DemarcheImpl.fromJson;

  @override
  String get id;
  @override
  String get denomination;
  @override
  @JsonKey(name: 'champ_libre')
  String get champLibre;
  @override
  bool get deleted;

  /// Create a copy of Demarche
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DemarcheImplCopyWith<_$DemarcheImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Atelier _$AtelierFromJson(Map<String, dynamic> json) {
  return _Atelier.fromJson(json);
}

/// @nodoc
mixin _$Atelier {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'demarche_id')
  String get demarcheId => throw _privateConstructorUsedError;
  @JsonKey(name: 'animateur_ids')
  List<String> get animateurIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'co_animateur_ids')
  List<String> get coAnimateurIds => throw _privateConstructorUsedError;
  String get lieu => throw _privateConstructorUsedError;
  String get organisateur => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_ms')
  num get dateMs => throw _privateConstructorUsedError;
  @JsonKey(name: 'latest_fiche_modified_at')
  String? get latestFicheModifiedAt => throw _privateConstructorUsedError;

  /// Serializes this Atelier to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Atelier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AtelierCopyWith<Atelier> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AtelierCopyWith<$Res> {
  factory $AtelierCopyWith(Atelier value, $Res Function(Atelier) then) =
      _$AtelierCopyWithImpl<$Res, Atelier>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'animateur_ids') List<String> animateurIds,
      @JsonKey(name: 'co_animateur_ids') List<String> coAnimateurIds,
      String lieu,
      String organisateur,
      @JsonKey(name: 'date_ms') num dateMs,
      @JsonKey(name: 'latest_fiche_modified_at')
      String? latestFicheModifiedAt});
}

/// @nodoc
class _$AtelierCopyWithImpl<$Res, $Val extends Atelier>
    implements $AtelierCopyWith<$Res> {
  _$AtelierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Atelier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? demarcheId = null,
    Object? animateurIds = null,
    Object? coAnimateurIds = null,
    Object? lieu = null,
    Object? organisateur = null,
    Object? dateMs = null,
    Object? latestFicheModifiedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      animateurIds: null == animateurIds
          ? _value.animateurIds
          : animateurIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      coAnimateurIds: null == coAnimateurIds
          ? _value.coAnimateurIds
          : coAnimateurIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lieu: null == lieu
          ? _value.lieu
          : lieu // ignore: cast_nullable_to_non_nullable
              as String,
      organisateur: null == organisateur
          ? _value.organisateur
          : organisateur // ignore: cast_nullable_to_non_nullable
              as String,
      dateMs: null == dateMs
          ? _value.dateMs
          : dateMs // ignore: cast_nullable_to_non_nullable
              as num,
      latestFicheModifiedAt: freezed == latestFicheModifiedAt
          ? _value.latestFicheModifiedAt
          : latestFicheModifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AtelierImplCopyWith<$Res> implements $AtelierCopyWith<$Res> {
  factory _$$AtelierImplCopyWith(
          _$AtelierImpl value, $Res Function(_$AtelierImpl) then) =
      __$$AtelierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'animateur_ids') List<String> animateurIds,
      @JsonKey(name: 'co_animateur_ids') List<String> coAnimateurIds,
      String lieu,
      String organisateur,
      @JsonKey(name: 'date_ms') num dateMs,
      @JsonKey(name: 'latest_fiche_modified_at')
      String? latestFicheModifiedAt});
}

/// @nodoc
class __$$AtelierImplCopyWithImpl<$Res>
    extends _$AtelierCopyWithImpl<$Res, _$AtelierImpl>
    implements _$$AtelierImplCopyWith<$Res> {
  __$$AtelierImplCopyWithImpl(
      _$AtelierImpl _value, $Res Function(_$AtelierImpl) _then)
      : super(_value, _then);

  /// Create a copy of Atelier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? demarcheId = null,
    Object? animateurIds = null,
    Object? coAnimateurIds = null,
    Object? lieu = null,
    Object? organisateur = null,
    Object? dateMs = null,
    Object? latestFicheModifiedAt = freezed,
  }) {
    return _then(_$AtelierImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      animateurIds: null == animateurIds
          ? _value._animateurIds
          : animateurIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      coAnimateurIds: null == coAnimateurIds
          ? _value._coAnimateurIds
          : coAnimateurIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lieu: null == lieu
          ? _value.lieu
          : lieu // ignore: cast_nullable_to_non_nullable
              as String,
      organisateur: null == organisateur
          ? _value.organisateur
          : organisateur // ignore: cast_nullable_to_non_nullable
              as String,
      dateMs: null == dateMs
          ? _value.dateMs
          : dateMs // ignore: cast_nullable_to_non_nullable
              as num,
      latestFicheModifiedAt: freezed == latestFicheModifiedAt
          ? _value.latestFicheModifiedAt
          : latestFicheModifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AtelierImpl implements _Atelier {
  const _$AtelierImpl(
      {required this.id,
      @JsonKey(name: 'demarche_id') required this.demarcheId,
      @JsonKey(name: 'animateur_ids')
      final List<String> animateurIds = const [],
      @JsonKey(name: 'co_animateur_ids')
      final List<String> coAnimateurIds = const [],
      this.lieu = '',
      this.organisateur = '',
      @JsonKey(name: 'date_ms') this.dateMs = 0,
      @JsonKey(name: 'latest_fiche_modified_at') this.latestFicheModifiedAt})
      : _animateurIds = animateurIds,
        _coAnimateurIds = coAnimateurIds;

  factory _$AtelierImpl.fromJson(Map<String, dynamic> json) =>
      _$$AtelierImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'demarche_id')
  final String demarcheId;
  final List<String> _animateurIds;
  @override
  @JsonKey(name: 'animateur_ids')
  List<String> get animateurIds {
    if (_animateurIds is EqualUnmodifiableListView) return _animateurIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_animateurIds);
  }

  final List<String> _coAnimateurIds;
  @override
  @JsonKey(name: 'co_animateur_ids')
  List<String> get coAnimateurIds {
    if (_coAnimateurIds is EqualUnmodifiableListView) return _coAnimateurIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coAnimateurIds);
  }

  @override
  @JsonKey()
  final String lieu;
  @override
  @JsonKey()
  final String organisateur;
  @override
  @JsonKey(name: 'date_ms')
  final num dateMs;
  @override
  @JsonKey(name: 'latest_fiche_modified_at')
  final String? latestFicheModifiedAt;

  @override
  String toString() {
    return 'Atelier(id: $id, demarcheId: $demarcheId, animateurIds: $animateurIds, coAnimateurIds: $coAnimateurIds, lieu: $lieu, organisateur: $organisateur, dateMs: $dateMs, latestFicheModifiedAt: $latestFicheModifiedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AtelierImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.demarcheId, demarcheId) ||
                other.demarcheId == demarcheId) &&
            const DeepCollectionEquality()
                .equals(other._animateurIds, _animateurIds) &&
            const DeepCollectionEquality()
                .equals(other._coAnimateurIds, _coAnimateurIds) &&
            (identical(other.lieu, lieu) || other.lieu == lieu) &&
            (identical(other.organisateur, organisateur) ||
                other.organisateur == organisateur) &&
            (identical(other.dateMs, dateMs) || other.dateMs == dateMs) &&
            (identical(other.latestFicheModifiedAt, latestFicheModifiedAt) ||
                other.latestFicheModifiedAt == latestFicheModifiedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      demarcheId,
      const DeepCollectionEquality().hash(_animateurIds),
      const DeepCollectionEquality().hash(_coAnimateurIds),
      lieu,
      organisateur,
      dateMs,
      latestFicheModifiedAt);

  /// Create a copy of Atelier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AtelierImplCopyWith<_$AtelierImpl> get copyWith =>
      __$$AtelierImplCopyWithImpl<_$AtelierImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AtelierImplToJson(
      this,
    );
  }
}

abstract class _Atelier implements Atelier {
  const factory _Atelier(
      {required final String id,
      @JsonKey(name: 'demarche_id') required final String demarcheId,
      @JsonKey(name: 'animateur_ids') final List<String> animateurIds,
      @JsonKey(name: 'co_animateur_ids') final List<String> coAnimateurIds,
      final String lieu,
      final String organisateur,
      @JsonKey(name: 'date_ms') final num dateMs,
      @JsonKey(name: 'latest_fiche_modified_at')
      final String? latestFicheModifiedAt}) = _$AtelierImpl;

  factory _Atelier.fromJson(Map<String, dynamic> json) = _$AtelierImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'demarche_id')
  String get demarcheId;
  @override
  @JsonKey(name: 'animateur_ids')
  List<String> get animateurIds;
  @override
  @JsonKey(name: 'co_animateur_ids')
  List<String> get coAnimateurIds;
  @override
  String get lieu;
  @override
  String get organisateur;
  @override
  @JsonKey(name: 'date_ms')
  num get dateMs;
  @override
  @JsonKey(name: 'latest_fiche_modified_at')
  String? get latestFicheModifiedAt;

  /// Create a copy of Atelier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AtelierImplCopyWith<_$AtelierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ParticipantMeta _$ParticipantMetaFromJson(Map<String, dynamic> json) {
  return _ParticipantMeta.fromJson(json);
}

/// @nodoc
mixin _$ParticipantMeta {
  @JsonKey(name: 'atelier_id')
  String get atelierId => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_id')
  String get contactId => throw _privateConstructorUsedError;
  @JsonKey(name: 'demarche_id')
  String get demarcheId => throw _privateConstructorUsedError;
  @JsonKey(name: 'thematique_ids')
  List<String> get thematiqueIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'champ_libre')
  String get champLibre => throw _privateConstructorUsedError;

  /// Serializes this ParticipantMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ParticipantMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParticipantMetaCopyWith<ParticipantMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantMetaCopyWith<$Res> {
  factory $ParticipantMetaCopyWith(
          ParticipantMeta value, $Res Function(ParticipantMeta) then) =
      _$ParticipantMetaCopyWithImpl<$Res, ParticipantMeta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'atelier_id') String atelierId,
      @JsonKey(name: 'contact_id') String contactId,
      @JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'thematique_ids') List<String> thematiqueIds,
      @JsonKey(name: 'champ_libre') String champLibre});
}

/// @nodoc
class _$ParticipantMetaCopyWithImpl<$Res, $Val extends ParticipantMeta>
    implements $ParticipantMetaCopyWith<$Res> {
  _$ParticipantMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParticipantMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? atelierId = null,
    Object? contactId = null,
    Object? demarcheId = null,
    Object? thematiqueIds = null,
    Object? champLibre = null,
  }) {
    return _then(_value.copyWith(
      atelierId: null == atelierId
          ? _value.atelierId
          : atelierId // ignore: cast_nullable_to_non_nullable
              as String,
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      thematiqueIds: null == thematiqueIds
          ? _value.thematiqueIds
          : thematiqueIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      champLibre: null == champLibre
          ? _value.champLibre
          : champLibre // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParticipantMetaImplCopyWith<$Res>
    implements $ParticipantMetaCopyWith<$Res> {
  factory _$$ParticipantMetaImplCopyWith(_$ParticipantMetaImpl value,
          $Res Function(_$ParticipantMetaImpl) then) =
      __$$ParticipantMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'atelier_id') String atelierId,
      @JsonKey(name: 'contact_id') String contactId,
      @JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'thematique_ids') List<String> thematiqueIds,
      @JsonKey(name: 'champ_libre') String champLibre});
}

/// @nodoc
class __$$ParticipantMetaImplCopyWithImpl<$Res>
    extends _$ParticipantMetaCopyWithImpl<$Res, _$ParticipantMetaImpl>
    implements _$$ParticipantMetaImplCopyWith<$Res> {
  __$$ParticipantMetaImplCopyWithImpl(
      _$ParticipantMetaImpl _value, $Res Function(_$ParticipantMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParticipantMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? atelierId = null,
    Object? contactId = null,
    Object? demarcheId = null,
    Object? thematiqueIds = null,
    Object? champLibre = null,
  }) {
    return _then(_$ParticipantMetaImpl(
      atelierId: null == atelierId
          ? _value.atelierId
          : atelierId // ignore: cast_nullable_to_non_nullable
              as String,
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      thematiqueIds: null == thematiqueIds
          ? _value._thematiqueIds
          : thematiqueIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      champLibre: null == champLibre
          ? _value.champLibre
          : champLibre // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParticipantMetaImpl implements _ParticipantMeta {
  _$ParticipantMetaImpl(
      {@JsonKey(name: 'atelier_id') required this.atelierId,
      @JsonKey(name: 'contact_id') required this.contactId,
      @JsonKey(name: 'demarche_id') required this.demarcheId,
      @JsonKey(name: 'thematique_ids')
      final List<String> thematiqueIds = const [],
      @JsonKey(name: 'champ_libre') this.champLibre = ''})
      : _thematiqueIds = thematiqueIds;

  factory _$ParticipantMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParticipantMetaImplFromJson(json);

  @override
  @JsonKey(name: 'atelier_id')
  final String atelierId;
  @override
  @JsonKey(name: 'contact_id')
  final String contactId;
  @override
  @JsonKey(name: 'demarche_id')
  final String demarcheId;
  final List<String> _thematiqueIds;
  @override
  @JsonKey(name: 'thematique_ids')
  List<String> get thematiqueIds {
    if (_thematiqueIds is EqualUnmodifiableListView) return _thematiqueIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thematiqueIds);
  }

  @override
  @JsonKey(name: 'champ_libre')
  final String champLibre;

  @override
  String toString() {
    return 'ParticipantMeta(atelierId: $atelierId, contactId: $contactId, demarcheId: $demarcheId, thematiqueIds: $thematiqueIds, champLibre: $champLibre)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantMetaImpl &&
            (identical(other.atelierId, atelierId) ||
                other.atelierId == atelierId) &&
            (identical(other.contactId, contactId) ||
                other.contactId == contactId) &&
            (identical(other.demarcheId, demarcheId) ||
                other.demarcheId == demarcheId) &&
            const DeepCollectionEquality()
                .equals(other._thematiqueIds, _thematiqueIds) &&
            (identical(other.champLibre, champLibre) ||
                other.champLibre == champLibre));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, atelierId, contactId, demarcheId,
      const DeepCollectionEquality().hash(_thematiqueIds), champLibre);

  /// Create a copy of ParticipantMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantMetaImplCopyWith<_$ParticipantMetaImpl> get copyWith =>
      __$$ParticipantMetaImplCopyWithImpl<_$ParticipantMetaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParticipantMetaImplToJson(
      this,
    );
  }
}

abstract class _ParticipantMeta implements ParticipantMeta {
  factory _ParticipantMeta(
          {@JsonKey(name: 'atelier_id') required final String atelierId,
          @JsonKey(name: 'contact_id') required final String contactId,
          @JsonKey(name: 'demarche_id') required final String demarcheId,
          @JsonKey(name: 'thematique_ids') final List<String> thematiqueIds,
          @JsonKey(name: 'champ_libre') final String champLibre}) =
      _$ParticipantMetaImpl;

  factory _ParticipantMeta.fromJson(Map<String, dynamic> json) =
      _$ParticipantMetaImpl.fromJson;

  @override
  @JsonKey(name: 'atelier_id')
  String get atelierId;
  @override
  @JsonKey(name: 'contact_id')
  String get contactId;
  @override
  @JsonKey(name: 'demarche_id')
  String get demarcheId;
  @override
  @JsonKey(name: 'thematique_ids')
  List<String> get thematiqueIds;
  @override
  @JsonKey(name: 'champ_libre')
  String get champLibre;

  /// Create a copy of ParticipantMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParticipantMetaImplCopyWith<_$ParticipantMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Fiche _$FicheFromJson(Map<String, dynamic> json) {
  return _Fiche.fromJson(json);
}

/// @nodoc
mixin _$Fiche {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'atelier_id')
  String get atelierId => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_id')
  String get contactId => throw _privateConstructorUsedError;
  @JsonKey(name: 'demarche_id')
  String get demarcheId => throw _privateConstructorUsedError;
  @JsonKey(name: 'flux_id')
  String get fluxId => throw _privateConstructorUsedError;
  @JsonKey(name: 'designation')
  String get designation => throw _privateConstructorUsedError;
  @JsonKey(name: 'commentaire')
  String get commentaire => throw _privateConstructorUsedError;
  @JsonKey(name: 'thematique_ids')
  List<String> get thematiqueIds => throw _privateConstructorUsedError;

  /// Serializes this Fiche to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Fiche
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FicheCopyWith<Fiche> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FicheCopyWith<$Res> {
  factory $FicheCopyWith(Fiche value, $Res Function(Fiche) then) =
      _$FicheCopyWithImpl<$Res, Fiche>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'atelier_id') String atelierId,
      @JsonKey(name: 'contact_id') String contactId,
      @JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'flux_id') String fluxId,
      @JsonKey(name: 'designation') String designation,
      @JsonKey(name: 'commentaire') String commentaire,
      @JsonKey(name: 'thematique_ids') List<String> thematiqueIds});
}

/// @nodoc
class _$FicheCopyWithImpl<$Res, $Val extends Fiche>
    implements $FicheCopyWith<$Res> {
  _$FicheCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Fiche
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? atelierId = null,
    Object? contactId = null,
    Object? demarcheId = null,
    Object? fluxId = null,
    Object? designation = null,
    Object? commentaire = null,
    Object? thematiqueIds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      atelierId: null == atelierId
          ? _value.atelierId
          : atelierId // ignore: cast_nullable_to_non_nullable
              as String,
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      fluxId: null == fluxId
          ? _value.fluxId
          : fluxId // ignore: cast_nullable_to_non_nullable
              as String,
      designation: null == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String,
      commentaire: null == commentaire
          ? _value.commentaire
          : commentaire // ignore: cast_nullable_to_non_nullable
              as String,
      thematiqueIds: null == thematiqueIds
          ? _value.thematiqueIds
          : thematiqueIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FicheImplCopyWith<$Res> implements $FicheCopyWith<$Res> {
  factory _$$FicheImplCopyWith(
          _$FicheImpl value, $Res Function(_$FicheImpl) then) =
      __$$FicheImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'atelier_id') String atelierId,
      @JsonKey(name: 'contact_id') String contactId,
      @JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'flux_id') String fluxId,
      @JsonKey(name: 'designation') String designation,
      @JsonKey(name: 'commentaire') String commentaire,
      @JsonKey(name: 'thematique_ids') List<String> thematiqueIds});
}

/// @nodoc
class __$$FicheImplCopyWithImpl<$Res>
    extends _$FicheCopyWithImpl<$Res, _$FicheImpl>
    implements _$$FicheImplCopyWith<$Res> {
  __$$FicheImplCopyWithImpl(
      _$FicheImpl _value, $Res Function(_$FicheImpl) _then)
      : super(_value, _then);

  /// Create a copy of Fiche
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? atelierId = null,
    Object? contactId = null,
    Object? demarcheId = null,
    Object? fluxId = null,
    Object? designation = null,
    Object? commentaire = null,
    Object? thematiqueIds = null,
  }) {
    return _then(_$FicheImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      atelierId: null == atelierId
          ? _value.atelierId
          : atelierId // ignore: cast_nullable_to_non_nullable
              as String,
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      fluxId: null == fluxId
          ? _value.fluxId
          : fluxId // ignore: cast_nullable_to_non_nullable
              as String,
      designation: null == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String,
      commentaire: null == commentaire
          ? _value.commentaire
          : commentaire // ignore: cast_nullable_to_non_nullable
              as String,
      thematiqueIds: null == thematiqueIds
          ? _value._thematiqueIds
          : thematiqueIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FicheImpl extends _Fiche {
  const _$FicheImpl(
      {required this.id,
      @JsonKey(name: 'atelier_id') required this.atelierId,
      @JsonKey(name: 'contact_id') required this.contactId,
      @JsonKey(name: 'demarche_id') required this.demarcheId,
      @JsonKey(name: 'flux_id') required this.fluxId,
      @JsonKey(name: 'designation') this.designation = '',
      @JsonKey(name: 'commentaire') this.commentaire = '',
      @JsonKey(name: 'thematique_ids')
      final List<String> thematiqueIds = const []})
      : _thematiqueIds = thematiqueIds,
        super._();

  factory _$FicheImpl.fromJson(Map<String, dynamic> json) =>
      _$$FicheImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'atelier_id')
  final String atelierId;
  @override
  @JsonKey(name: 'contact_id')
  final String contactId;
  @override
  @JsonKey(name: 'demarche_id')
  final String demarcheId;
  @override
  @JsonKey(name: 'flux_id')
  final String fluxId;
  @override
  @JsonKey(name: 'designation')
  final String designation;
  @override
  @JsonKey(name: 'commentaire')
  final String commentaire;
  final List<String> _thematiqueIds;
  @override
  @JsonKey(name: 'thematique_ids')
  List<String> get thematiqueIds {
    if (_thematiqueIds is EqualUnmodifiableListView) return _thematiqueIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thematiqueIds);
  }

  @override
  String toString() {
    return 'Fiche(id: $id, atelierId: $atelierId, contactId: $contactId, demarcheId: $demarcheId, fluxId: $fluxId, designation: $designation, commentaire: $commentaire, thematiqueIds: $thematiqueIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FicheImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.atelierId, atelierId) ||
                other.atelierId == atelierId) &&
            (identical(other.contactId, contactId) ||
                other.contactId == contactId) &&
            (identical(other.demarcheId, demarcheId) ||
                other.demarcheId == demarcheId) &&
            (identical(other.fluxId, fluxId) || other.fluxId == fluxId) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.commentaire, commentaire) ||
                other.commentaire == commentaire) &&
            const DeepCollectionEquality()
                .equals(other._thematiqueIds, _thematiqueIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      atelierId,
      contactId,
      demarcheId,
      fluxId,
      designation,
      commentaire,
      const DeepCollectionEquality().hash(_thematiqueIds));

  /// Create a copy of Fiche
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FicheImplCopyWith<_$FicheImpl> get copyWith =>
      __$$FicheImplCopyWithImpl<_$FicheImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FicheImplToJson(
      this,
    );
  }
}

abstract class _Fiche extends Fiche {
  const factory _Fiche(
          {required final String id,
          @JsonKey(name: 'atelier_id') required final String atelierId,
          @JsonKey(name: 'contact_id') required final String contactId,
          @JsonKey(name: 'demarche_id') required final String demarcheId,
          @JsonKey(name: 'flux_id') required final String fluxId,
          @JsonKey(name: 'designation') final String designation,
          @JsonKey(name: 'commentaire') final String commentaire,
          @JsonKey(name: 'thematique_ids') final List<String> thematiqueIds}) =
      _$FicheImpl;
  const _Fiche._() : super._();

  factory _Fiche.fromJson(Map<String, dynamic> json) = _$FicheImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'atelier_id')
  String get atelierId;
  @override
  @JsonKey(name: 'contact_id')
  String get contactId;
  @override
  @JsonKey(name: 'demarche_id')
  String get demarcheId;
  @override
  @JsonKey(name: 'flux_id')
  String get fluxId;
  @override
  @JsonKey(name: 'designation')
  String get designation;
  @override
  @JsonKey(name: 'commentaire')
  String get commentaire;
  @override
  @JsonKey(name: 'thematique_ids')
  List<String> get thematiqueIds;

  /// Create a copy of Fiche
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FicheImplCopyWith<_$FicheImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LienFiche _$LienFicheFromJson(Map<String, dynamic> json) {
  return _LienFiche.fromJson(json);
}

/// @nodoc
mixin _$LienFiche {
  @JsonKey(name: 'demarche_id')
  String get demarcheId => throw _privateConstructorUsedError;
  @JsonKey(name: 'atelier_id')
  String get atelierId => throw _privateConstructorUsedError;
  @JsonKey(name: 'nature')
  String get nature => throw _privateConstructorUsedError;
  @JsonKey(name: 'fiche_a_id')
  String get ficheAId => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_a_id')
  String get contactAId => throw _privateConstructorUsedError;
  @JsonKey(name: 'flux_direction_a')
  FluxDirection get directionA => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantite_a')
  num get quantiteA => throw _privateConstructorUsedError;
  @JsonKey(name: 'flux_unite_a')
  String get uniteA => throw _privateConstructorUsedError;
  @JsonKey(name: 'fiche_b_id')
  String? get ficheBId => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_b_id')
  String? get contactBId => throw _privateConstructorUsedError;
  @JsonKey(name: 'flux_direction_b')
  FluxDirection? get directionB => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantite_b')
  num? get quantiteB => throw _privateConstructorUsedError;
  @JsonKey(name: 'flux_unite_b')
  String get uniteB => throw _privateConstructorUsedError;

  /// Serializes this LienFiche to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LienFiche
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LienFicheCopyWith<LienFiche> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LienFicheCopyWith<$Res> {
  factory $LienFicheCopyWith(LienFiche value, $Res Function(LienFiche) then) =
      _$LienFicheCopyWithImpl<$Res, LienFiche>;
  @useResult
  $Res call(
      {@JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'atelier_id') String atelierId,
      @JsonKey(name: 'nature') String nature,
      @JsonKey(name: 'fiche_a_id') String ficheAId,
      @JsonKey(name: 'contact_a_id') String contactAId,
      @JsonKey(name: 'flux_direction_a') FluxDirection directionA,
      @JsonKey(name: 'quantite_a') num quantiteA,
      @JsonKey(name: 'flux_unite_a') String uniteA,
      @JsonKey(name: 'fiche_b_id') String? ficheBId,
      @JsonKey(name: 'contact_b_id') String? contactBId,
      @JsonKey(name: 'flux_direction_b') FluxDirection? directionB,
      @JsonKey(name: 'quantite_b') num? quantiteB,
      @JsonKey(name: 'flux_unite_b') String uniteB});
}

/// @nodoc
class _$LienFicheCopyWithImpl<$Res, $Val extends LienFiche>
    implements $LienFicheCopyWith<$Res> {
  _$LienFicheCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LienFiche
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? demarcheId = null,
    Object? atelierId = null,
    Object? nature = null,
    Object? ficheAId = null,
    Object? contactAId = null,
    Object? directionA = null,
    Object? quantiteA = null,
    Object? uniteA = null,
    Object? ficheBId = freezed,
    Object? contactBId = freezed,
    Object? directionB = freezed,
    Object? quantiteB = freezed,
    Object? uniteB = null,
  }) {
    return _then(_value.copyWith(
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      atelierId: null == atelierId
          ? _value.atelierId
          : atelierId // ignore: cast_nullable_to_non_nullable
              as String,
      nature: null == nature
          ? _value.nature
          : nature // ignore: cast_nullable_to_non_nullable
              as String,
      ficheAId: null == ficheAId
          ? _value.ficheAId
          : ficheAId // ignore: cast_nullable_to_non_nullable
              as String,
      contactAId: null == contactAId
          ? _value.contactAId
          : contactAId // ignore: cast_nullable_to_non_nullable
              as String,
      directionA: null == directionA
          ? _value.directionA
          : directionA // ignore: cast_nullable_to_non_nullable
              as FluxDirection,
      quantiteA: null == quantiteA
          ? _value.quantiteA
          : quantiteA // ignore: cast_nullable_to_non_nullable
              as num,
      uniteA: null == uniteA
          ? _value.uniteA
          : uniteA // ignore: cast_nullable_to_non_nullable
              as String,
      ficheBId: freezed == ficheBId
          ? _value.ficheBId
          : ficheBId // ignore: cast_nullable_to_non_nullable
              as String?,
      contactBId: freezed == contactBId
          ? _value.contactBId
          : contactBId // ignore: cast_nullable_to_non_nullable
              as String?,
      directionB: freezed == directionB
          ? _value.directionB
          : directionB // ignore: cast_nullable_to_non_nullable
              as FluxDirection?,
      quantiteB: freezed == quantiteB
          ? _value.quantiteB
          : quantiteB // ignore: cast_nullable_to_non_nullable
              as num?,
      uniteB: null == uniteB
          ? _value.uniteB
          : uniteB // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LienFicheImplCopyWith<$Res>
    implements $LienFicheCopyWith<$Res> {
  factory _$$LienFicheImplCopyWith(
          _$LienFicheImpl value, $Res Function(_$LienFicheImpl) then) =
      __$$LienFicheImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'atelier_id') String atelierId,
      @JsonKey(name: 'nature') String nature,
      @JsonKey(name: 'fiche_a_id') String ficheAId,
      @JsonKey(name: 'contact_a_id') String contactAId,
      @JsonKey(name: 'flux_direction_a') FluxDirection directionA,
      @JsonKey(name: 'quantite_a') num quantiteA,
      @JsonKey(name: 'flux_unite_a') String uniteA,
      @JsonKey(name: 'fiche_b_id') String? ficheBId,
      @JsonKey(name: 'contact_b_id') String? contactBId,
      @JsonKey(name: 'flux_direction_b') FluxDirection? directionB,
      @JsonKey(name: 'quantite_b') num? quantiteB,
      @JsonKey(name: 'flux_unite_b') String uniteB});
}

/// @nodoc
class __$$LienFicheImplCopyWithImpl<$Res>
    extends _$LienFicheCopyWithImpl<$Res, _$LienFicheImpl>
    implements _$$LienFicheImplCopyWith<$Res> {
  __$$LienFicheImplCopyWithImpl(
      _$LienFicheImpl _value, $Res Function(_$LienFicheImpl) _then)
      : super(_value, _then);

  /// Create a copy of LienFiche
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? demarcheId = null,
    Object? atelierId = null,
    Object? nature = null,
    Object? ficheAId = null,
    Object? contactAId = null,
    Object? directionA = null,
    Object? quantiteA = null,
    Object? uniteA = null,
    Object? ficheBId = freezed,
    Object? contactBId = freezed,
    Object? directionB = freezed,
    Object? quantiteB = freezed,
    Object? uniteB = null,
  }) {
    return _then(_$LienFicheImpl(
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      atelierId: null == atelierId
          ? _value.atelierId
          : atelierId // ignore: cast_nullable_to_non_nullable
              as String,
      nature: null == nature
          ? _value.nature
          : nature // ignore: cast_nullable_to_non_nullable
              as String,
      ficheAId: null == ficheAId
          ? _value.ficheAId
          : ficheAId // ignore: cast_nullable_to_non_nullable
              as String,
      contactAId: null == contactAId
          ? _value.contactAId
          : contactAId // ignore: cast_nullable_to_non_nullable
              as String,
      directionA: null == directionA
          ? _value.directionA
          : directionA // ignore: cast_nullable_to_non_nullable
              as FluxDirection,
      quantiteA: null == quantiteA
          ? _value.quantiteA
          : quantiteA // ignore: cast_nullable_to_non_nullable
              as num,
      uniteA: null == uniteA
          ? _value.uniteA
          : uniteA // ignore: cast_nullable_to_non_nullable
              as String,
      ficheBId: freezed == ficheBId
          ? _value.ficheBId
          : ficheBId // ignore: cast_nullable_to_non_nullable
              as String?,
      contactBId: freezed == contactBId
          ? _value.contactBId
          : contactBId // ignore: cast_nullable_to_non_nullable
              as String?,
      directionB: freezed == directionB
          ? _value.directionB
          : directionB // ignore: cast_nullable_to_non_nullable
              as FluxDirection?,
      quantiteB: freezed == quantiteB
          ? _value.quantiteB
          : quantiteB // ignore: cast_nullable_to_non_nullable
              as num?,
      uniteB: null == uniteB
          ? _value.uniteB
          : uniteB // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LienFicheImpl extends _LienFiche {
  const _$LienFicheImpl(
      {@JsonKey(name: 'demarche_id') required this.demarcheId,
      @JsonKey(name: 'atelier_id') required this.atelierId,
      @JsonKey(name: 'nature') this.nature = '',
      @JsonKey(name: 'fiche_a_id') required this.ficheAId,
      @JsonKey(name: 'contact_a_id') required this.contactAId,
      @JsonKey(name: 'flux_direction_a') required this.directionA,
      @JsonKey(name: 'quantite_a') required this.quantiteA,
      @JsonKey(name: 'flux_unite_a') this.uniteA = '',
      @JsonKey(name: 'fiche_b_id') this.ficheBId,
      @JsonKey(name: 'contact_b_id') this.contactBId,
      @JsonKey(name: 'flux_direction_b')
      this.directionB = FluxDirection.entrant,
      @JsonKey(name: 'quantite_b') this.quantiteB,
      @JsonKey(name: 'flux_unite_b') this.uniteB = ''})
      : super._();

  factory _$LienFicheImpl.fromJson(Map<String, dynamic> json) =>
      _$$LienFicheImplFromJson(json);

  @override
  @JsonKey(name: 'demarche_id')
  final String demarcheId;
  @override
  @JsonKey(name: 'atelier_id')
  final String atelierId;
  @override
  @JsonKey(name: 'nature')
  final String nature;
  @override
  @JsonKey(name: 'fiche_a_id')
  final String ficheAId;
  @override
  @JsonKey(name: 'contact_a_id')
  final String contactAId;
  @override
  @JsonKey(name: 'flux_direction_a')
  final FluxDirection directionA;
  @override
  @JsonKey(name: 'quantite_a')
  final num quantiteA;
  @override
  @JsonKey(name: 'flux_unite_a')
  final String uniteA;
  @override
  @JsonKey(name: 'fiche_b_id')
  final String? ficheBId;
  @override
  @JsonKey(name: 'contact_b_id')
  final String? contactBId;
  @override
  @JsonKey(name: 'flux_direction_b')
  final FluxDirection? directionB;
  @override
  @JsonKey(name: 'quantite_b')
  final num? quantiteB;
  @override
  @JsonKey(name: 'flux_unite_b')
  final String uniteB;

  @override
  String toString() {
    return 'LienFiche(demarcheId: $demarcheId, atelierId: $atelierId, nature: $nature, ficheAId: $ficheAId, contactAId: $contactAId, directionA: $directionA, quantiteA: $quantiteA, uniteA: $uniteA, ficheBId: $ficheBId, contactBId: $contactBId, directionB: $directionB, quantiteB: $quantiteB, uniteB: $uniteB)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LienFicheImpl &&
            (identical(other.demarcheId, demarcheId) ||
                other.demarcheId == demarcheId) &&
            (identical(other.atelierId, atelierId) ||
                other.atelierId == atelierId) &&
            (identical(other.nature, nature) || other.nature == nature) &&
            (identical(other.ficheAId, ficheAId) ||
                other.ficheAId == ficheAId) &&
            (identical(other.contactAId, contactAId) ||
                other.contactAId == contactAId) &&
            (identical(other.directionA, directionA) ||
                other.directionA == directionA) &&
            (identical(other.quantiteA, quantiteA) ||
                other.quantiteA == quantiteA) &&
            (identical(other.uniteA, uniteA) || other.uniteA == uniteA) &&
            (identical(other.ficheBId, ficheBId) ||
                other.ficheBId == ficheBId) &&
            (identical(other.contactBId, contactBId) ||
                other.contactBId == contactBId) &&
            (identical(other.directionB, directionB) ||
                other.directionB == directionB) &&
            (identical(other.quantiteB, quantiteB) ||
                other.quantiteB == quantiteB) &&
            (identical(other.uniteB, uniteB) || other.uniteB == uniteB));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      demarcheId,
      atelierId,
      nature,
      ficheAId,
      contactAId,
      directionA,
      quantiteA,
      uniteA,
      ficheBId,
      contactBId,
      directionB,
      quantiteB,
      uniteB);

  /// Create a copy of LienFiche
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LienFicheImplCopyWith<_$LienFicheImpl> get copyWith =>
      __$$LienFicheImplCopyWithImpl<_$LienFicheImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LienFicheImplToJson(
      this,
    );
  }
}

abstract class _LienFiche extends LienFiche {
  const factory _LienFiche(
      {@JsonKey(name: 'demarche_id') required final String demarcheId,
      @JsonKey(name: 'atelier_id') required final String atelierId,
      @JsonKey(name: 'nature') final String nature,
      @JsonKey(name: 'fiche_a_id') required final String ficheAId,
      @JsonKey(name: 'contact_a_id') required final String contactAId,
      @JsonKey(name: 'flux_direction_a')
      required final FluxDirection directionA,
      @JsonKey(name: 'quantite_a') required final num quantiteA,
      @JsonKey(name: 'flux_unite_a') final String uniteA,
      @JsonKey(name: 'fiche_b_id') final String? ficheBId,
      @JsonKey(name: 'contact_b_id') final String? contactBId,
      @JsonKey(name: 'flux_direction_b') final FluxDirection? directionB,
      @JsonKey(name: 'quantite_b') final num? quantiteB,
      @JsonKey(name: 'flux_unite_b') final String uniteB}) = _$LienFicheImpl;
  const _LienFiche._() : super._();

  factory _LienFiche.fromJson(Map<String, dynamic> json) =
      _$LienFicheImpl.fromJson;

  @override
  @JsonKey(name: 'demarche_id')
  String get demarcheId;
  @override
  @JsonKey(name: 'atelier_id')
  String get atelierId;
  @override
  @JsonKey(name: 'nature')
  String get nature;
  @override
  @JsonKey(name: 'fiche_a_id')
  String get ficheAId;
  @override
  @JsonKey(name: 'contact_a_id')
  String get contactAId;
  @override
  @JsonKey(name: 'flux_direction_a')
  FluxDirection get directionA;
  @override
  @JsonKey(name: 'quantite_a')
  num get quantiteA;
  @override
  @JsonKey(name: 'flux_unite_a')
  String get uniteA;
  @override
  @JsonKey(name: 'fiche_b_id')
  String? get ficheBId;
  @override
  @JsonKey(name: 'contact_b_id')
  String? get contactBId;
  @override
  @JsonKey(name: 'flux_direction_b')
  FluxDirection? get directionB;
  @override
  @JsonKey(name: 'quantite_b')
  num? get quantiteB;
  @override
  @JsonKey(name: 'flux_unite_b')
  String get uniteB;

  /// Create a copy of LienFiche
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LienFicheImplCopyWith<_$LienFicheImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Thematique _$ThematiqueFromJson(Map<String, dynamic> json) {
  return _Thematique.fromJson(json);
}

/// @nodoc
mixin _$Thematique {
  String get id => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;

  /// Serializes this Thematique to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Thematique
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThematiqueCopyWith<Thematique> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThematiqueCopyWith<$Res> {
  factory $ThematiqueCopyWith(
          Thematique value, $Res Function(Thematique) then) =
      _$ThematiqueCopyWithImpl<$Res, Thematique>;
  @useResult
  $Res call({String id, String nom});
}

/// @nodoc
class _$ThematiqueCopyWithImpl<$Res, $Val extends Thematique>
    implements $ThematiqueCopyWith<$Res> {
  _$ThematiqueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Thematique
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThematiqueImplCopyWith<$Res>
    implements $ThematiqueCopyWith<$Res> {
  factory _$$ThematiqueImplCopyWith(
          _$ThematiqueImpl value, $Res Function(_$ThematiqueImpl) then) =
      __$$ThematiqueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String nom});
}

/// @nodoc
class __$$ThematiqueImplCopyWithImpl<$Res>
    extends _$ThematiqueCopyWithImpl<$Res, _$ThematiqueImpl>
    implements _$$ThematiqueImplCopyWith<$Res> {
  __$$ThematiqueImplCopyWithImpl(
      _$ThematiqueImpl _value, $Res Function(_$ThematiqueImpl) _then)
      : super(_value, _then);

  /// Create a copy of Thematique
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
  }) {
    return _then(_$ThematiqueImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThematiqueImpl implements _Thematique {
  const _$ThematiqueImpl({required this.id, required this.nom});

  factory _$ThematiqueImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThematiqueImplFromJson(json);

  @override
  final String id;
  @override
  final String nom;

  @override
  String toString() {
    return 'Thematique(id: $id, nom: $nom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThematiqueImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nom);

  /// Create a copy of Thematique
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThematiqueImplCopyWith<_$ThematiqueImpl> get copyWith =>
      __$$ThematiqueImplCopyWithImpl<_$ThematiqueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThematiqueImplToJson(
      this,
    );
  }
}

abstract class _Thematique implements Thematique {
  const factory _Thematique(
      {required final String id, required final String nom}) = _$ThematiqueImpl;

  factory _Thematique.fromJson(Map<String, dynamic> json) =
      _$ThematiqueImpl.fromJson;

  @override
  String get id;
  @override
  String get nom;

  /// Create a copy of Thematique
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThematiqueImplCopyWith<_$ThematiqueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Entreprise _$EntrepriseFromJson(Map<String, dynamic> json) {
  return _Entreprise.fromJson(json);
}

/// @nodoc
mixin _$Entreprise {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'demarche_id')
  String get demarcheId => throw _privateConstructorUsedError;
  String get siren => throw _privateConstructorUsedError;
  String get denomination => throw _privateConstructorUsedError;
  String get commentaire => throw _privateConstructorUsedError;

  /// Serializes this Entreprise to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Entreprise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EntrepriseCopyWith<Entreprise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntrepriseCopyWith<$Res> {
  factory $EntrepriseCopyWith(
          Entreprise value, $Res Function(Entreprise) then) =
      _$EntrepriseCopyWithImpl<$Res, Entreprise>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'demarche_id') String demarcheId,
      String siren,
      String denomination,
      String commentaire});
}

/// @nodoc
class _$EntrepriseCopyWithImpl<$Res, $Val extends Entreprise>
    implements $EntrepriseCopyWith<$Res> {
  _$EntrepriseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Entreprise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? demarcheId = null,
    Object? siren = null,
    Object? denomination = null,
    Object? commentaire = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      siren: null == siren
          ? _value.siren
          : siren // ignore: cast_nullable_to_non_nullable
              as String,
      denomination: null == denomination
          ? _value.denomination
          : denomination // ignore: cast_nullable_to_non_nullable
              as String,
      commentaire: null == commentaire
          ? _value.commentaire
          : commentaire // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EntrepriseImplCopyWith<$Res>
    implements $EntrepriseCopyWith<$Res> {
  factory _$$EntrepriseImplCopyWith(
          _$EntrepriseImpl value, $Res Function(_$EntrepriseImpl) then) =
      __$$EntrepriseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'demarche_id') String demarcheId,
      String siren,
      String denomination,
      String commentaire});
}

/// @nodoc
class __$$EntrepriseImplCopyWithImpl<$Res>
    extends _$EntrepriseCopyWithImpl<$Res, _$EntrepriseImpl>
    implements _$$EntrepriseImplCopyWith<$Res> {
  __$$EntrepriseImplCopyWithImpl(
      _$EntrepriseImpl _value, $Res Function(_$EntrepriseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Entreprise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? demarcheId = null,
    Object? siren = null,
    Object? denomination = null,
    Object? commentaire = null,
  }) {
    return _then(_$EntrepriseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      siren: null == siren
          ? _value.siren
          : siren // ignore: cast_nullable_to_non_nullable
              as String,
      denomination: null == denomination
          ? _value.denomination
          : denomination // ignore: cast_nullable_to_non_nullable
              as String,
      commentaire: null == commentaire
          ? _value.commentaire
          : commentaire // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EntrepriseImpl implements _Entreprise {
  const _$EntrepriseImpl(
      {required this.id,
      @JsonKey(name: 'demarche_id') required this.demarcheId,
      this.siren = '',
      this.denomination = '',
      this.commentaire = ''});

  factory _$EntrepriseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntrepriseImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'demarche_id')
  final String demarcheId;
  @override
  @JsonKey()
  final String siren;
  @override
  @JsonKey()
  final String denomination;
  @override
  @JsonKey()
  final String commentaire;

  @override
  String toString() {
    return 'Entreprise(id: $id, demarcheId: $demarcheId, siren: $siren, denomination: $denomination, commentaire: $commentaire)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntrepriseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.demarcheId, demarcheId) ||
                other.demarcheId == demarcheId) &&
            (identical(other.siren, siren) || other.siren == siren) &&
            (identical(other.denomination, denomination) ||
                other.denomination == denomination) &&
            (identical(other.commentaire, commentaire) ||
                other.commentaire == commentaire));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, demarcheId, siren, denomination, commentaire);

  /// Create a copy of Entreprise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EntrepriseImplCopyWith<_$EntrepriseImpl> get copyWith =>
      __$$EntrepriseImplCopyWithImpl<_$EntrepriseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntrepriseImplToJson(
      this,
    );
  }
}

abstract class _Entreprise implements Entreprise {
  const factory _Entreprise(
      {required final String id,
      @JsonKey(name: 'demarche_id') required final String demarcheId,
      final String siren,
      final String denomination,
      final String commentaire}) = _$EntrepriseImpl;

  factory _Entreprise.fromJson(Map<String, dynamic> json) =
      _$EntrepriseImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'demarche_id')
  String get demarcheId;
  @override
  String get siren;
  @override
  String get denomination;
  @override
  String get commentaire;

  /// Create a copy of Entreprise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EntrepriseImplCopyWith<_$EntrepriseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Etablissement _$EtablissementFromJson(Map<String, dynamic> json) {
  return _Etablissement.fromJson(json);
}

/// @nodoc
mixin _$Etablissement {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'demarche_id')
  String get demarcheId => throw _privateConstructorUsedError;
  @JsonKey(name: 'entreprise_id')
  String get entrepriseId => throw _privateConstructorUsedError;
  String get siret => throw _privateConstructorUsedError;
  @JsonKey(name: 'adresse_ligne1')
  String get adresseLigne1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'adresse_ligne2')
  String get adresseLigne2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'code_postal')
  String get codePostal => throw _privateConstructorUsedError;
  String get ville => throw _privateConstructorUsedError;
  String get cedex => throw _privateConstructorUsedError;

  /// Serializes this Etablissement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Etablissement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EtablissementCopyWith<Etablissement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EtablissementCopyWith<$Res> {
  factory $EtablissementCopyWith(
          Etablissement value, $Res Function(Etablissement) then) =
      _$EtablissementCopyWithImpl<$Res, Etablissement>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'entreprise_id') String entrepriseId,
      String siret,
      @JsonKey(name: 'adresse_ligne1') String adresseLigne1,
      @JsonKey(name: 'adresse_ligne2') String adresseLigne2,
      @JsonKey(name: 'code_postal') String codePostal,
      String ville,
      String cedex});
}

/// @nodoc
class _$EtablissementCopyWithImpl<$Res, $Val extends Etablissement>
    implements $EtablissementCopyWith<$Res> {
  _$EtablissementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Etablissement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? demarcheId = null,
    Object? entrepriseId = null,
    Object? siret = null,
    Object? adresseLigne1 = null,
    Object? adresseLigne2 = null,
    Object? codePostal = null,
    Object? ville = null,
    Object? cedex = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      entrepriseId: null == entrepriseId
          ? _value.entrepriseId
          : entrepriseId // ignore: cast_nullable_to_non_nullable
              as String,
      siret: null == siret
          ? _value.siret
          : siret // ignore: cast_nullable_to_non_nullable
              as String,
      adresseLigne1: null == adresseLigne1
          ? _value.adresseLigne1
          : adresseLigne1 // ignore: cast_nullable_to_non_nullable
              as String,
      adresseLigne2: null == adresseLigne2
          ? _value.adresseLigne2
          : adresseLigne2 // ignore: cast_nullable_to_non_nullable
              as String,
      codePostal: null == codePostal
          ? _value.codePostal
          : codePostal // ignore: cast_nullable_to_non_nullable
              as String,
      ville: null == ville
          ? _value.ville
          : ville // ignore: cast_nullable_to_non_nullable
              as String,
      cedex: null == cedex
          ? _value.cedex
          : cedex // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EtablissementImplCopyWith<$Res>
    implements $EtablissementCopyWith<$Res> {
  factory _$$EtablissementImplCopyWith(
          _$EtablissementImpl value, $Res Function(_$EtablissementImpl) then) =
      __$$EtablissementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'entreprise_id') String entrepriseId,
      String siret,
      @JsonKey(name: 'adresse_ligne1') String adresseLigne1,
      @JsonKey(name: 'adresse_ligne2') String adresseLigne2,
      @JsonKey(name: 'code_postal') String codePostal,
      String ville,
      String cedex});
}

/// @nodoc
class __$$EtablissementImplCopyWithImpl<$Res>
    extends _$EtablissementCopyWithImpl<$Res, _$EtablissementImpl>
    implements _$$EtablissementImplCopyWith<$Res> {
  __$$EtablissementImplCopyWithImpl(
      _$EtablissementImpl _value, $Res Function(_$EtablissementImpl) _then)
      : super(_value, _then);

  /// Create a copy of Etablissement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? demarcheId = null,
    Object? entrepriseId = null,
    Object? siret = null,
    Object? adresseLigne1 = null,
    Object? adresseLigne2 = null,
    Object? codePostal = null,
    Object? ville = null,
    Object? cedex = null,
  }) {
    return _then(_$EtablissementImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      entrepriseId: null == entrepriseId
          ? _value.entrepriseId
          : entrepriseId // ignore: cast_nullable_to_non_nullable
              as String,
      siret: null == siret
          ? _value.siret
          : siret // ignore: cast_nullable_to_non_nullable
              as String,
      adresseLigne1: null == adresseLigne1
          ? _value.adresseLigne1
          : adresseLigne1 // ignore: cast_nullable_to_non_nullable
              as String,
      adresseLigne2: null == adresseLigne2
          ? _value.adresseLigne2
          : adresseLigne2 // ignore: cast_nullable_to_non_nullable
              as String,
      codePostal: null == codePostal
          ? _value.codePostal
          : codePostal // ignore: cast_nullable_to_non_nullable
              as String,
      ville: null == ville
          ? _value.ville
          : ville // ignore: cast_nullable_to_non_nullable
              as String,
      cedex: null == cedex
          ? _value.cedex
          : cedex // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EtablissementImpl implements _Etablissement {
  const _$EtablissementImpl(
      {required this.id,
      @JsonKey(name: 'demarche_id') required this.demarcheId,
      @JsonKey(name: 'entreprise_id') required this.entrepriseId,
      this.siret = '',
      @JsonKey(name: 'adresse_ligne1') this.adresseLigne1 = '',
      @JsonKey(name: 'adresse_ligne2') this.adresseLigne2 = '',
      @JsonKey(name: 'code_postal') this.codePostal = '',
      this.ville = '',
      this.cedex = ''});

  factory _$EtablissementImpl.fromJson(Map<String, dynamic> json) =>
      _$$EtablissementImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'demarche_id')
  final String demarcheId;
  @override
  @JsonKey(name: 'entreprise_id')
  final String entrepriseId;
  @override
  @JsonKey()
  final String siret;
  @override
  @JsonKey(name: 'adresse_ligne1')
  final String adresseLigne1;
  @override
  @JsonKey(name: 'adresse_ligne2')
  final String adresseLigne2;
  @override
  @JsonKey(name: 'code_postal')
  final String codePostal;
  @override
  @JsonKey()
  final String ville;
  @override
  @JsonKey()
  final String cedex;

  @override
  String toString() {
    return 'Etablissement(id: $id, demarcheId: $demarcheId, entrepriseId: $entrepriseId, siret: $siret, adresseLigne1: $adresseLigne1, adresseLigne2: $adresseLigne2, codePostal: $codePostal, ville: $ville, cedex: $cedex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EtablissementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.demarcheId, demarcheId) ||
                other.demarcheId == demarcheId) &&
            (identical(other.entrepriseId, entrepriseId) ||
                other.entrepriseId == entrepriseId) &&
            (identical(other.siret, siret) || other.siret == siret) &&
            (identical(other.adresseLigne1, adresseLigne1) ||
                other.adresseLigne1 == adresseLigne1) &&
            (identical(other.adresseLigne2, adresseLigne2) ||
                other.adresseLigne2 == adresseLigne2) &&
            (identical(other.codePostal, codePostal) ||
                other.codePostal == codePostal) &&
            (identical(other.ville, ville) || other.ville == ville) &&
            (identical(other.cedex, cedex) || other.cedex == cedex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, demarcheId, entrepriseId,
      siret, adresseLigne1, adresseLigne2, codePostal, ville, cedex);

  /// Create a copy of Etablissement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EtablissementImplCopyWith<_$EtablissementImpl> get copyWith =>
      __$$EtablissementImplCopyWithImpl<_$EtablissementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EtablissementImplToJson(
      this,
    );
  }
}

abstract class _Etablissement implements Etablissement {
  const factory _Etablissement(
      {required final String id,
      @JsonKey(name: 'demarche_id') required final String demarcheId,
      @JsonKey(name: 'entreprise_id') required final String entrepriseId,
      final String siret,
      @JsonKey(name: 'adresse_ligne1') final String adresseLigne1,
      @JsonKey(name: 'adresse_ligne2') final String adresseLigne2,
      @JsonKey(name: 'code_postal') final String codePostal,
      final String ville,
      final String cedex}) = _$EtablissementImpl;

  factory _Etablissement.fromJson(Map<String, dynamic> json) =
      _$EtablissementImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'demarche_id')
  String get demarcheId;
  @override
  @JsonKey(name: 'entreprise_id')
  String get entrepriseId;
  @override
  String get siret;
  @override
  @JsonKey(name: 'adresse_ligne1')
  String get adresseLigne1;
  @override
  @JsonKey(name: 'adresse_ligne2')
  String get adresseLigne2;
  @override
  @JsonKey(name: 'code_postal')
  String get codePostal;
  @override
  String get ville;
  @override
  String get cedex;

  /// Create a copy of Etablissement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EtablissementImplCopyWith<_$EtablissementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return _Contact.fromJson(json);
}

/// @nodoc
mixin _$Contact {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'demarche_id')
  String get demarcheId => throw _privateConstructorUsedError;
  @JsonKey(name: 'personne_id')
  String get personneId => throw _privateConstructorUsedError;
  @JsonKey(name: 'etablissement_id')
  String get etablissementId => throw _privateConstructorUsedError;

  /// Serializes this Contact to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactCopyWith<Contact> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCopyWith<$Res> {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) then) =
      _$ContactCopyWithImpl<$Res, Contact>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'personne_id') String personneId,
      @JsonKey(name: 'etablissement_id') String etablissementId});
}

/// @nodoc
class _$ContactCopyWithImpl<$Res, $Val extends Contact>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? demarcheId = null,
    Object? personneId = null,
    Object? etablissementId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      personneId: null == personneId
          ? _value.personneId
          : personneId // ignore: cast_nullable_to_non_nullable
              as String,
      etablissementId: null == etablissementId
          ? _value.etablissementId
          : etablissementId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactImplCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$$ContactImplCopyWith(
          _$ContactImpl value, $Res Function(_$ContactImpl) then) =
      __$$ContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'personne_id') String personneId,
      @JsonKey(name: 'etablissement_id') String etablissementId});
}

/// @nodoc
class __$$ContactImplCopyWithImpl<$Res>
    extends _$ContactCopyWithImpl<$Res, _$ContactImpl>
    implements _$$ContactImplCopyWith<$Res> {
  __$$ContactImplCopyWithImpl(
      _$ContactImpl _value, $Res Function(_$ContactImpl) _then)
      : super(_value, _then);

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? demarcheId = null,
    Object? personneId = null,
    Object? etablissementId = null,
  }) {
    return _then(_$ContactImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      personneId: null == personneId
          ? _value.personneId
          : personneId // ignore: cast_nullable_to_non_nullable
              as String,
      etablissementId: null == etablissementId
          ? _value.etablissementId
          : etablissementId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactImpl implements _Contact {
  const _$ContactImpl(
      {required this.id,
      @JsonKey(name: 'demarche_id') required this.demarcheId,
      @JsonKey(name: 'personne_id') required this.personneId,
      @JsonKey(name: 'etablissement_id') required this.etablissementId});

  factory _$ContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'demarche_id')
  final String demarcheId;
  @override
  @JsonKey(name: 'personne_id')
  final String personneId;
  @override
  @JsonKey(name: 'etablissement_id')
  final String etablissementId;

  @override
  String toString() {
    return 'Contact(id: $id, demarcheId: $demarcheId, personneId: $personneId, etablissementId: $etablissementId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.demarcheId, demarcheId) ||
                other.demarcheId == demarcheId) &&
            (identical(other.personneId, personneId) ||
                other.personneId == personneId) &&
            (identical(other.etablissementId, etablissementId) ||
                other.etablissementId == etablissementId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, demarcheId, personneId, etablissementId);

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactImplCopyWith<_$ContactImpl> get copyWith =>
      __$$ContactImplCopyWithImpl<_$ContactImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactImplToJson(
      this,
    );
  }
}

abstract class _Contact implements Contact {
  const factory _Contact(
      {required final String id,
      @JsonKey(name: 'demarche_id') required final String demarcheId,
      @JsonKey(name: 'personne_id') required final String personneId,
      @JsonKey(name: 'etablissement_id')
      required final String etablissementId}) = _$ContactImpl;

  factory _Contact.fromJson(Map<String, dynamic> json) = _$ContactImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'demarche_id')
  String get demarcheId;
  @override
  @JsonKey(name: 'personne_id')
  String get personneId;
  @override
  @JsonKey(name: 'etablissement_id')
  String get etablissementId;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactImplCopyWith<_$ContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Flux _$FluxFromJson(Map<String, dynamic> json) {
  return _Flux.fromJson(json);
}

/// @nodoc
mixin _$Flux {
  String get id => throw _privateConstructorUsedError; // resource
  @JsonKey(name: 'resource_nom')
  String get resourceNom => throw _privateConstructorUsedError;
  @JsonKey(name: 'resource_description')
  String get resourceDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'resource_code_synapse')
  String get resourceCodeSynapse => throw _privateConstructorUsedError; // flux
  @JsonKey(name: 'demarche_id')
  String get demarcheId => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_id')
  String get contactId => throw _privateConstructorUsedError;
  @JsonKey(name: 'atelier_id')
  String get atelierId => throw _privateConstructorUsedError;
  @JsonKey(name: 'etablissement_id')
  String get etablissementId => throw _privateConstructorUsedError;
  String get designation => throw _privateConstructorUsedError;
  String get commentaire => throw _privateConstructorUsedError;
  num get quantite => throw _privateConstructorUsedError;
  @JsonKey(name: 'duree_ms')
  num get dureeMs => throw _privateConstructorUsedError;
  String get unite => throw _privateConstructorUsedError;
  FluxDirection get direction => throw _privateConstructorUsedError;
  FluxNature get nature => throw _privateConstructorUsedError;
  @JsonKey(name: 'thematique_ids')
  List<String> get thematiqueIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'animateur_ids')
  List<String> get animateurIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'co_animateur_ids')
  List<String> get coAnimateurIds => throw _privateConstructorUsedError;

  /// Serializes this Flux to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Flux
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FluxCopyWith<Flux> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FluxCopyWith<$Res> {
  factory $FluxCopyWith(Flux value, $Res Function(Flux) then) =
      _$FluxCopyWithImpl<$Res, Flux>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'resource_nom') String resourceNom,
      @JsonKey(name: 'resource_description') String resourceDescription,
      @JsonKey(name: 'resource_code_synapse') String resourceCodeSynapse,
      @JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'contact_id') String contactId,
      @JsonKey(name: 'atelier_id') String atelierId,
      @JsonKey(name: 'etablissement_id') String etablissementId,
      String designation,
      String commentaire,
      num quantite,
      @JsonKey(name: 'duree_ms') num dureeMs,
      String unite,
      FluxDirection direction,
      FluxNature nature,
      @JsonKey(name: 'thematique_ids') List<String> thematiqueIds,
      @JsonKey(name: 'animateur_ids') List<String> animateurIds,
      @JsonKey(name: 'co_animateur_ids') List<String> coAnimateurIds});
}

/// @nodoc
class _$FluxCopyWithImpl<$Res, $Val extends Flux>
    implements $FluxCopyWith<$Res> {
  _$FluxCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Flux
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? resourceNom = null,
    Object? resourceDescription = null,
    Object? resourceCodeSynapse = null,
    Object? demarcheId = null,
    Object? contactId = null,
    Object? atelierId = null,
    Object? etablissementId = null,
    Object? designation = null,
    Object? commentaire = null,
    Object? quantite = null,
    Object? dureeMs = null,
    Object? unite = null,
    Object? direction = null,
    Object? nature = null,
    Object? thematiqueIds = null,
    Object? animateurIds = null,
    Object? coAnimateurIds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      resourceNom: null == resourceNom
          ? _value.resourceNom
          : resourceNom // ignore: cast_nullable_to_non_nullable
              as String,
      resourceDescription: null == resourceDescription
          ? _value.resourceDescription
          : resourceDescription // ignore: cast_nullable_to_non_nullable
              as String,
      resourceCodeSynapse: null == resourceCodeSynapse
          ? _value.resourceCodeSynapse
          : resourceCodeSynapse // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      atelierId: null == atelierId
          ? _value.atelierId
          : atelierId // ignore: cast_nullable_to_non_nullable
              as String,
      etablissementId: null == etablissementId
          ? _value.etablissementId
          : etablissementId // ignore: cast_nullable_to_non_nullable
              as String,
      designation: null == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String,
      commentaire: null == commentaire
          ? _value.commentaire
          : commentaire // ignore: cast_nullable_to_non_nullable
              as String,
      quantite: null == quantite
          ? _value.quantite
          : quantite // ignore: cast_nullable_to_non_nullable
              as num,
      dureeMs: null == dureeMs
          ? _value.dureeMs
          : dureeMs // ignore: cast_nullable_to_non_nullable
              as num,
      unite: null == unite
          ? _value.unite
          : unite // ignore: cast_nullable_to_non_nullable
              as String,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as FluxDirection,
      nature: null == nature
          ? _value.nature
          : nature // ignore: cast_nullable_to_non_nullable
              as FluxNature,
      thematiqueIds: null == thematiqueIds
          ? _value.thematiqueIds
          : thematiqueIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      animateurIds: null == animateurIds
          ? _value.animateurIds
          : animateurIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      coAnimateurIds: null == coAnimateurIds
          ? _value.coAnimateurIds
          : coAnimateurIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FluxImplCopyWith<$Res> implements $FluxCopyWith<$Res> {
  factory _$$FluxImplCopyWith(
          _$FluxImpl value, $Res Function(_$FluxImpl) then) =
      __$$FluxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'resource_nom') String resourceNom,
      @JsonKey(name: 'resource_description') String resourceDescription,
      @JsonKey(name: 'resource_code_synapse') String resourceCodeSynapse,
      @JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'contact_id') String contactId,
      @JsonKey(name: 'atelier_id') String atelierId,
      @JsonKey(name: 'etablissement_id') String etablissementId,
      String designation,
      String commentaire,
      num quantite,
      @JsonKey(name: 'duree_ms') num dureeMs,
      String unite,
      FluxDirection direction,
      FluxNature nature,
      @JsonKey(name: 'thematique_ids') List<String> thematiqueIds,
      @JsonKey(name: 'animateur_ids') List<String> animateurIds,
      @JsonKey(name: 'co_animateur_ids') List<String> coAnimateurIds});
}

/// @nodoc
class __$$FluxImplCopyWithImpl<$Res>
    extends _$FluxCopyWithImpl<$Res, _$FluxImpl>
    implements _$$FluxImplCopyWith<$Res> {
  __$$FluxImplCopyWithImpl(_$FluxImpl _value, $Res Function(_$FluxImpl) _then)
      : super(_value, _then);

  /// Create a copy of Flux
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? resourceNom = null,
    Object? resourceDescription = null,
    Object? resourceCodeSynapse = null,
    Object? demarcheId = null,
    Object? contactId = null,
    Object? atelierId = null,
    Object? etablissementId = null,
    Object? designation = null,
    Object? commentaire = null,
    Object? quantite = null,
    Object? dureeMs = null,
    Object? unite = null,
    Object? direction = null,
    Object? nature = null,
    Object? thematiqueIds = null,
    Object? animateurIds = null,
    Object? coAnimateurIds = null,
  }) {
    return _then(_$FluxImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      resourceNom: null == resourceNom
          ? _value.resourceNom
          : resourceNom // ignore: cast_nullable_to_non_nullable
              as String,
      resourceDescription: null == resourceDescription
          ? _value.resourceDescription
          : resourceDescription // ignore: cast_nullable_to_non_nullable
              as String,
      resourceCodeSynapse: null == resourceCodeSynapse
          ? _value.resourceCodeSynapse
          : resourceCodeSynapse // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      atelierId: null == atelierId
          ? _value.atelierId
          : atelierId // ignore: cast_nullable_to_non_nullable
              as String,
      etablissementId: null == etablissementId
          ? _value.etablissementId
          : etablissementId // ignore: cast_nullable_to_non_nullable
              as String,
      designation: null == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String,
      commentaire: null == commentaire
          ? _value.commentaire
          : commentaire // ignore: cast_nullable_to_non_nullable
              as String,
      quantite: null == quantite
          ? _value.quantite
          : quantite // ignore: cast_nullable_to_non_nullable
              as num,
      dureeMs: null == dureeMs
          ? _value.dureeMs
          : dureeMs // ignore: cast_nullable_to_non_nullable
              as num,
      unite: null == unite
          ? _value.unite
          : unite // ignore: cast_nullable_to_non_nullable
              as String,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as FluxDirection,
      nature: null == nature
          ? _value.nature
          : nature // ignore: cast_nullable_to_non_nullable
              as FluxNature,
      thematiqueIds: null == thematiqueIds
          ? _value._thematiqueIds
          : thematiqueIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      animateurIds: null == animateurIds
          ? _value._animateurIds
          : animateurIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      coAnimateurIds: null == coAnimateurIds
          ? _value._coAnimateurIds
          : coAnimateurIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FluxImpl extends _Flux {
  const _$FluxImpl(
      {required this.id,
      @JsonKey(name: 'resource_nom') this.resourceNom = '',
      @JsonKey(name: 'resource_description') this.resourceDescription = '',
      @JsonKey(name: 'resource_code_synapse') this.resourceCodeSynapse = '',
      @JsonKey(name: 'demarche_id') required this.demarcheId,
      @JsonKey(name: 'contact_id') required this.contactId,
      @JsonKey(name: 'atelier_id') required this.atelierId,
      @JsonKey(name: 'etablissement_id') required this.etablissementId,
      this.designation = '',
      this.commentaire = '',
      this.quantite = 0,
      @JsonKey(name: 'duree_ms') this.dureeMs = 0,
      this.unite = '',
      this.direction = FluxDirection.entrant,
      this.nature = FluxNature.ponctuel,
      @JsonKey(name: 'thematique_ids')
      final List<String> thematiqueIds = const [],
      @JsonKey(name: 'animateur_ids')
      final List<String> animateurIds = const [],
      @JsonKey(name: 'co_animateur_ids')
      final List<String> coAnimateurIds = const []})
      : _thematiqueIds = thematiqueIds,
        _animateurIds = animateurIds,
        _coAnimateurIds = coAnimateurIds,
        super._();

  factory _$FluxImpl.fromJson(Map<String, dynamic> json) =>
      _$$FluxImplFromJson(json);

  @override
  final String id;
// resource
  @override
  @JsonKey(name: 'resource_nom')
  final String resourceNom;
  @override
  @JsonKey(name: 'resource_description')
  final String resourceDescription;
  @override
  @JsonKey(name: 'resource_code_synapse')
  final String resourceCodeSynapse;
// flux
  @override
  @JsonKey(name: 'demarche_id')
  final String demarcheId;
  @override
  @JsonKey(name: 'contact_id')
  final String contactId;
  @override
  @JsonKey(name: 'atelier_id')
  final String atelierId;
  @override
  @JsonKey(name: 'etablissement_id')
  final String etablissementId;
  @override
  @JsonKey()
  final String designation;
  @override
  @JsonKey()
  final String commentaire;
  @override
  @JsonKey()
  final num quantite;
  @override
  @JsonKey(name: 'duree_ms')
  final num dureeMs;
  @override
  @JsonKey()
  final String unite;
  @override
  @JsonKey()
  final FluxDirection direction;
  @override
  @JsonKey()
  final FluxNature nature;
  final List<String> _thematiqueIds;
  @override
  @JsonKey(name: 'thematique_ids')
  List<String> get thematiqueIds {
    if (_thematiqueIds is EqualUnmodifiableListView) return _thematiqueIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thematiqueIds);
  }

  final List<String> _animateurIds;
  @override
  @JsonKey(name: 'animateur_ids')
  List<String> get animateurIds {
    if (_animateurIds is EqualUnmodifiableListView) return _animateurIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_animateurIds);
  }

  final List<String> _coAnimateurIds;
  @override
  @JsonKey(name: 'co_animateur_ids')
  List<String> get coAnimateurIds {
    if (_coAnimateurIds is EqualUnmodifiableListView) return _coAnimateurIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coAnimateurIds);
  }

  @override
  String toString() {
    return 'Flux(id: $id, resourceNom: $resourceNom, resourceDescription: $resourceDescription, resourceCodeSynapse: $resourceCodeSynapse, demarcheId: $demarcheId, contactId: $contactId, atelierId: $atelierId, etablissementId: $etablissementId, designation: $designation, commentaire: $commentaire, quantite: $quantite, dureeMs: $dureeMs, unite: $unite, direction: $direction, nature: $nature, thematiqueIds: $thematiqueIds, animateurIds: $animateurIds, coAnimateurIds: $coAnimateurIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FluxImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.resourceNom, resourceNom) ||
                other.resourceNom == resourceNom) &&
            (identical(other.resourceDescription, resourceDescription) ||
                other.resourceDescription == resourceDescription) &&
            (identical(other.resourceCodeSynapse, resourceCodeSynapse) ||
                other.resourceCodeSynapse == resourceCodeSynapse) &&
            (identical(other.demarcheId, demarcheId) ||
                other.demarcheId == demarcheId) &&
            (identical(other.contactId, contactId) ||
                other.contactId == contactId) &&
            (identical(other.atelierId, atelierId) ||
                other.atelierId == atelierId) &&
            (identical(other.etablissementId, etablissementId) ||
                other.etablissementId == etablissementId) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.commentaire, commentaire) ||
                other.commentaire == commentaire) &&
            (identical(other.quantite, quantite) ||
                other.quantite == quantite) &&
            (identical(other.dureeMs, dureeMs) || other.dureeMs == dureeMs) &&
            (identical(other.unite, unite) || other.unite == unite) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.nature, nature) || other.nature == nature) &&
            const DeepCollectionEquality()
                .equals(other._thematiqueIds, _thematiqueIds) &&
            const DeepCollectionEquality()
                .equals(other._animateurIds, _animateurIds) &&
            const DeepCollectionEquality()
                .equals(other._coAnimateurIds, _coAnimateurIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      resourceNom,
      resourceDescription,
      resourceCodeSynapse,
      demarcheId,
      contactId,
      atelierId,
      etablissementId,
      designation,
      commentaire,
      quantite,
      dureeMs,
      unite,
      direction,
      nature,
      const DeepCollectionEquality().hash(_thematiqueIds),
      const DeepCollectionEquality().hash(_animateurIds),
      const DeepCollectionEquality().hash(_coAnimateurIds));

  /// Create a copy of Flux
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FluxImplCopyWith<_$FluxImpl> get copyWith =>
      __$$FluxImplCopyWithImpl<_$FluxImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FluxImplToJson(
      this,
    );
  }
}

abstract class _Flux extends Flux {
  const factory _Flux(
      {required final String id,
      @JsonKey(name: 'resource_nom') final String resourceNom,
      @JsonKey(name: 'resource_description') final String resourceDescription,
      @JsonKey(name: 'resource_code_synapse') final String resourceCodeSynapse,
      @JsonKey(name: 'demarche_id') required final String demarcheId,
      @JsonKey(name: 'contact_id') required final String contactId,
      @JsonKey(name: 'atelier_id') required final String atelierId,
      @JsonKey(name: 'etablissement_id') required final String etablissementId,
      final String designation,
      final String commentaire,
      final num quantite,
      @JsonKey(name: 'duree_ms') final num dureeMs,
      final String unite,
      final FluxDirection direction,
      final FluxNature nature,
      @JsonKey(name: 'thematique_ids') final List<String> thematiqueIds,
      @JsonKey(name: 'animateur_ids') final List<String> animateurIds,
      @JsonKey(name: 'co_animateur_ids')
      final List<String> coAnimateurIds}) = _$FluxImpl;
  const _Flux._() : super._();

  factory _Flux.fromJson(Map<String, dynamic> json) = _$FluxImpl.fromJson;

  @override
  String get id; // resource
  @override
  @JsonKey(name: 'resource_nom')
  String get resourceNom;
  @override
  @JsonKey(name: 'resource_description')
  String get resourceDescription;
  @override
  @JsonKey(name: 'resource_code_synapse')
  String get resourceCodeSynapse; // flux
  @override
  @JsonKey(name: 'demarche_id')
  String get demarcheId;
  @override
  @JsonKey(name: 'contact_id')
  String get contactId;
  @override
  @JsonKey(name: 'atelier_id')
  String get atelierId;
  @override
  @JsonKey(name: 'etablissement_id')
  String get etablissementId;
  @override
  String get designation;
  @override
  String get commentaire;
  @override
  num get quantite;
  @override
  @JsonKey(name: 'duree_ms')
  num get dureeMs;
  @override
  String get unite;
  @override
  FluxDirection get direction;
  @override
  FluxNature get nature;
  @override
  @JsonKey(name: 'thematique_ids')
  List<String> get thematiqueIds;
  @override
  @JsonKey(name: 'animateur_ids')
  List<String> get animateurIds;
  @override
  @JsonKey(name: 'co_animateur_ids')
  List<String> get coAnimateurIds;

  /// Create a copy of Flux
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FluxImplCopyWith<_$FluxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Synergie _$SynergieFromJson(Map<String, dynamic> json) {
  return _Synergie.fromJson(json);
}

/// @nodoc
mixin _$Synergie {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'demarche_id')
  String get demarcheId => throw _privateConstructorUsedError;
  @JsonKey(name: 'nom')
  String get nom => throw _privateConstructorUsedError;
  @JsonKey(name: 'commentaire')
  String get commentaire => throw _privateConstructorUsedError;
  @JsonKey(name: 'commentaire_date')
  String? get commentaireDate => throw _privateConstructorUsedError;
  SynergieStatut get statut => throw _privateConstructorUsedError;
  SynergieType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'flux_ids')
  List<String> get fluxIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified_at')
  String? get modifiedAt =>
      throw _privateConstructorUsedError; // Synergie indicateurs
// https://www.reseau-synapse.org/library/h/fiche-zoom-n-4-reporting-eit-et-indicateurs-synergies.html
  @JsonKey(name: 'reduction_totale_de_la_consommation_matiere')
  num get reductionTotaleDeLaConsommationMatiere =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'reduction_de_la_consommation_matiere_hors_inerte')
  num get reductionDeLaConsommationMatiereHorsInerte =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'reduction_totale_des_dechets')
  num get reductionTotaleDesDechets => throw _privateConstructorUsedError;
  @JsonKey(name: 'reduction_des_dechets_non_inertes')
  num get reductionDesDechetsNonInertes => throw _privateConstructorUsedError;
  @JsonKey(name: 'amelioration_de_la_valorisation_des_dechets')
  num get ameliorationDeLaValorisationDesDechets =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'reduction_des_consommations_d_energie')
  num get reductionDesConsommationsDenergie =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'production_d_energie_renouvelable')
  num get productionDenergieRenouvelable => throw _privateConstructorUsedError;
  @JsonKey(name: 'reduction_des_consommations_d_eau')
  num get reductionDesConsommationsDeau => throw _privateConstructorUsedError;
  @JsonKey(name: 'reduction_des_emissions_de_ges')
  num get reductionDesEmissionsDeGES => throw _privateConstructorUsedError;
  @JsonKey(name: 'realisation_d_economies_financieres')
  num get realisationDeconomiesFinancieres =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'chiffre_d_affaires_genere')
  num get chiffreDaffairesGenere => throw _privateConstructorUsedError;
  @JsonKey(name: 'investissements_realises')
  num get investissementsRealises => throw _privateConstructorUsedError;
  @JsonKey(name: 'developpement_de_nouvelles_activites_et_entreprises')
  num get developpementDeNouvellesActivitesEtEntreprises =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'creation_d_emplois')
  num get creationDemplois => throw _privateConstructorUsedError;
  @JsonKey(name: 'maintien_de_l_emploi')
  num get maintienDeLemploi => throw _privateConstructorUsedError;

  /// Serializes this Synergie to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Synergie
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SynergieCopyWith<Synergie> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SynergieCopyWith<$Res> {
  factory $SynergieCopyWith(Synergie value, $Res Function(Synergie) then) =
      _$SynergieCopyWithImpl<$Res, Synergie>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'nom') String nom,
      @JsonKey(name: 'commentaire') String commentaire,
      @JsonKey(name: 'commentaire_date') String? commentaireDate,
      SynergieStatut statut,
      SynergieType type,
      @JsonKey(name: 'flux_ids') List<String> fluxIds,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'modified_at') String? modifiedAt,
      @JsonKey(name: 'reduction_totale_de_la_consommation_matiere')
      num reductionTotaleDeLaConsommationMatiere,
      @JsonKey(name: 'reduction_de_la_consommation_matiere_hors_inerte')
      num reductionDeLaConsommationMatiereHorsInerte,
      @JsonKey(name: 'reduction_totale_des_dechets')
      num reductionTotaleDesDechets,
      @JsonKey(name: 'reduction_des_dechets_non_inertes')
      num reductionDesDechetsNonInertes,
      @JsonKey(name: 'amelioration_de_la_valorisation_des_dechets')
      num ameliorationDeLaValorisationDesDechets,
      @JsonKey(name: 'reduction_des_consommations_d_energie')
      num reductionDesConsommationsDenergie,
      @JsonKey(name: 'production_d_energie_renouvelable')
      num productionDenergieRenouvelable,
      @JsonKey(name: 'reduction_des_consommations_d_eau')
      num reductionDesConsommationsDeau,
      @JsonKey(name: 'reduction_des_emissions_de_ges')
      num reductionDesEmissionsDeGES,
      @JsonKey(name: 'realisation_d_economies_financieres')
      num realisationDeconomiesFinancieres,
      @JsonKey(name: 'chiffre_d_affaires_genere') num chiffreDaffairesGenere,
      @JsonKey(name: 'investissements_realises') num investissementsRealises,
      @JsonKey(name: 'developpement_de_nouvelles_activites_et_entreprises')
      num developpementDeNouvellesActivitesEtEntreprises,
      @JsonKey(name: 'creation_d_emplois') num creationDemplois,
      @JsonKey(name: 'maintien_de_l_emploi') num maintienDeLemploi});
}

/// @nodoc
class _$SynergieCopyWithImpl<$Res, $Val extends Synergie>
    implements $SynergieCopyWith<$Res> {
  _$SynergieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Synergie
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? demarcheId = null,
    Object? nom = null,
    Object? commentaire = null,
    Object? commentaireDate = freezed,
    Object? statut = null,
    Object? type = null,
    Object? fluxIds = null,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
    Object? reductionTotaleDeLaConsommationMatiere = null,
    Object? reductionDeLaConsommationMatiereHorsInerte = null,
    Object? reductionTotaleDesDechets = null,
    Object? reductionDesDechetsNonInertes = null,
    Object? ameliorationDeLaValorisationDesDechets = null,
    Object? reductionDesConsommationsDenergie = null,
    Object? productionDenergieRenouvelable = null,
    Object? reductionDesConsommationsDeau = null,
    Object? reductionDesEmissionsDeGES = null,
    Object? realisationDeconomiesFinancieres = null,
    Object? chiffreDaffairesGenere = null,
    Object? investissementsRealises = null,
    Object? developpementDeNouvellesActivitesEtEntreprises = null,
    Object? creationDemplois = null,
    Object? maintienDeLemploi = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      commentaire: null == commentaire
          ? _value.commentaire
          : commentaire // ignore: cast_nullable_to_non_nullable
              as String,
      commentaireDate: freezed == commentaireDate
          ? _value.commentaireDate
          : commentaireDate // ignore: cast_nullable_to_non_nullable
              as String?,
      statut: null == statut
          ? _value.statut
          : statut // ignore: cast_nullable_to_non_nullable
              as SynergieStatut,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SynergieType,
      fluxIds: null == fluxIds
          ? _value.fluxIds
          : fluxIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      reductionTotaleDeLaConsommationMatiere: null ==
              reductionTotaleDeLaConsommationMatiere
          ? _value.reductionTotaleDeLaConsommationMatiere
          : reductionTotaleDeLaConsommationMatiere // ignore: cast_nullable_to_non_nullable
              as num,
      reductionDeLaConsommationMatiereHorsInerte: null ==
              reductionDeLaConsommationMatiereHorsInerte
          ? _value.reductionDeLaConsommationMatiereHorsInerte
          : reductionDeLaConsommationMatiereHorsInerte // ignore: cast_nullable_to_non_nullable
              as num,
      reductionTotaleDesDechets: null == reductionTotaleDesDechets
          ? _value.reductionTotaleDesDechets
          : reductionTotaleDesDechets // ignore: cast_nullable_to_non_nullable
              as num,
      reductionDesDechetsNonInertes: null == reductionDesDechetsNonInertes
          ? _value.reductionDesDechetsNonInertes
          : reductionDesDechetsNonInertes // ignore: cast_nullable_to_non_nullable
              as num,
      ameliorationDeLaValorisationDesDechets: null ==
              ameliorationDeLaValorisationDesDechets
          ? _value.ameliorationDeLaValorisationDesDechets
          : ameliorationDeLaValorisationDesDechets // ignore: cast_nullable_to_non_nullable
              as num,
      reductionDesConsommationsDenergie: null ==
              reductionDesConsommationsDenergie
          ? _value.reductionDesConsommationsDenergie
          : reductionDesConsommationsDenergie // ignore: cast_nullable_to_non_nullable
              as num,
      productionDenergieRenouvelable: null == productionDenergieRenouvelable
          ? _value.productionDenergieRenouvelable
          : productionDenergieRenouvelable // ignore: cast_nullable_to_non_nullable
              as num,
      reductionDesConsommationsDeau: null == reductionDesConsommationsDeau
          ? _value.reductionDesConsommationsDeau
          : reductionDesConsommationsDeau // ignore: cast_nullable_to_non_nullable
              as num,
      reductionDesEmissionsDeGES: null == reductionDesEmissionsDeGES
          ? _value.reductionDesEmissionsDeGES
          : reductionDesEmissionsDeGES // ignore: cast_nullable_to_non_nullable
              as num,
      realisationDeconomiesFinancieres: null == realisationDeconomiesFinancieres
          ? _value.realisationDeconomiesFinancieres
          : realisationDeconomiesFinancieres // ignore: cast_nullable_to_non_nullable
              as num,
      chiffreDaffairesGenere: null == chiffreDaffairesGenere
          ? _value.chiffreDaffairesGenere
          : chiffreDaffairesGenere // ignore: cast_nullable_to_non_nullable
              as num,
      investissementsRealises: null == investissementsRealises
          ? _value.investissementsRealises
          : investissementsRealises // ignore: cast_nullable_to_non_nullable
              as num,
      developpementDeNouvellesActivitesEtEntreprises: null ==
              developpementDeNouvellesActivitesEtEntreprises
          ? _value.developpementDeNouvellesActivitesEtEntreprises
          : developpementDeNouvellesActivitesEtEntreprises // ignore: cast_nullable_to_non_nullable
              as num,
      creationDemplois: null == creationDemplois
          ? _value.creationDemplois
          : creationDemplois // ignore: cast_nullable_to_non_nullable
              as num,
      maintienDeLemploi: null == maintienDeLemploi
          ? _value.maintienDeLemploi
          : maintienDeLemploi // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SynergieImplCopyWith<$Res>
    implements $SynergieCopyWith<$Res> {
  factory _$$SynergieImplCopyWith(
          _$SynergieImpl value, $Res Function(_$SynergieImpl) then) =
      __$$SynergieImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'nom') String nom,
      @JsonKey(name: 'commentaire') String commentaire,
      @JsonKey(name: 'commentaire_date') String? commentaireDate,
      SynergieStatut statut,
      SynergieType type,
      @JsonKey(name: 'flux_ids') List<String> fluxIds,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'modified_at') String? modifiedAt,
      @JsonKey(name: 'reduction_totale_de_la_consommation_matiere')
      num reductionTotaleDeLaConsommationMatiere,
      @JsonKey(name: 'reduction_de_la_consommation_matiere_hors_inerte')
      num reductionDeLaConsommationMatiereHorsInerte,
      @JsonKey(name: 'reduction_totale_des_dechets')
      num reductionTotaleDesDechets,
      @JsonKey(name: 'reduction_des_dechets_non_inertes')
      num reductionDesDechetsNonInertes,
      @JsonKey(name: 'amelioration_de_la_valorisation_des_dechets')
      num ameliorationDeLaValorisationDesDechets,
      @JsonKey(name: 'reduction_des_consommations_d_energie')
      num reductionDesConsommationsDenergie,
      @JsonKey(name: 'production_d_energie_renouvelable')
      num productionDenergieRenouvelable,
      @JsonKey(name: 'reduction_des_consommations_d_eau')
      num reductionDesConsommationsDeau,
      @JsonKey(name: 'reduction_des_emissions_de_ges')
      num reductionDesEmissionsDeGES,
      @JsonKey(name: 'realisation_d_economies_financieres')
      num realisationDeconomiesFinancieres,
      @JsonKey(name: 'chiffre_d_affaires_genere') num chiffreDaffairesGenere,
      @JsonKey(name: 'investissements_realises') num investissementsRealises,
      @JsonKey(name: 'developpement_de_nouvelles_activites_et_entreprises')
      num developpementDeNouvellesActivitesEtEntreprises,
      @JsonKey(name: 'creation_d_emplois') num creationDemplois,
      @JsonKey(name: 'maintien_de_l_emploi') num maintienDeLemploi});
}

/// @nodoc
class __$$SynergieImplCopyWithImpl<$Res>
    extends _$SynergieCopyWithImpl<$Res, _$SynergieImpl>
    implements _$$SynergieImplCopyWith<$Res> {
  __$$SynergieImplCopyWithImpl(
      _$SynergieImpl _value, $Res Function(_$SynergieImpl) _then)
      : super(_value, _then);

  /// Create a copy of Synergie
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? demarcheId = null,
    Object? nom = null,
    Object? commentaire = null,
    Object? commentaireDate = freezed,
    Object? statut = null,
    Object? type = null,
    Object? fluxIds = null,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
    Object? reductionTotaleDeLaConsommationMatiere = null,
    Object? reductionDeLaConsommationMatiereHorsInerte = null,
    Object? reductionTotaleDesDechets = null,
    Object? reductionDesDechetsNonInertes = null,
    Object? ameliorationDeLaValorisationDesDechets = null,
    Object? reductionDesConsommationsDenergie = null,
    Object? productionDenergieRenouvelable = null,
    Object? reductionDesConsommationsDeau = null,
    Object? reductionDesEmissionsDeGES = null,
    Object? realisationDeconomiesFinancieres = null,
    Object? chiffreDaffairesGenere = null,
    Object? investissementsRealises = null,
    Object? developpementDeNouvellesActivitesEtEntreprises = null,
    Object? creationDemplois = null,
    Object? maintienDeLemploi = null,
  }) {
    return _then(_$SynergieImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      commentaire: null == commentaire
          ? _value.commentaire
          : commentaire // ignore: cast_nullable_to_non_nullable
              as String,
      commentaireDate: freezed == commentaireDate
          ? _value.commentaireDate
          : commentaireDate // ignore: cast_nullable_to_non_nullable
              as String?,
      statut: null == statut
          ? _value.statut
          : statut // ignore: cast_nullable_to_non_nullable
              as SynergieStatut,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SynergieType,
      fluxIds: null == fluxIds
          ? _value._fluxIds
          : fluxIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      reductionTotaleDeLaConsommationMatiere: null ==
              reductionTotaleDeLaConsommationMatiere
          ? _value.reductionTotaleDeLaConsommationMatiere
          : reductionTotaleDeLaConsommationMatiere // ignore: cast_nullable_to_non_nullable
              as num,
      reductionDeLaConsommationMatiereHorsInerte: null ==
              reductionDeLaConsommationMatiereHorsInerte
          ? _value.reductionDeLaConsommationMatiereHorsInerte
          : reductionDeLaConsommationMatiereHorsInerte // ignore: cast_nullable_to_non_nullable
              as num,
      reductionTotaleDesDechets: null == reductionTotaleDesDechets
          ? _value.reductionTotaleDesDechets
          : reductionTotaleDesDechets // ignore: cast_nullable_to_non_nullable
              as num,
      reductionDesDechetsNonInertes: null == reductionDesDechetsNonInertes
          ? _value.reductionDesDechetsNonInertes
          : reductionDesDechetsNonInertes // ignore: cast_nullable_to_non_nullable
              as num,
      ameliorationDeLaValorisationDesDechets: null ==
              ameliorationDeLaValorisationDesDechets
          ? _value.ameliorationDeLaValorisationDesDechets
          : ameliorationDeLaValorisationDesDechets // ignore: cast_nullable_to_non_nullable
              as num,
      reductionDesConsommationsDenergie: null ==
              reductionDesConsommationsDenergie
          ? _value.reductionDesConsommationsDenergie
          : reductionDesConsommationsDenergie // ignore: cast_nullable_to_non_nullable
              as num,
      productionDenergieRenouvelable: null == productionDenergieRenouvelable
          ? _value.productionDenergieRenouvelable
          : productionDenergieRenouvelable // ignore: cast_nullable_to_non_nullable
              as num,
      reductionDesConsommationsDeau: null == reductionDesConsommationsDeau
          ? _value.reductionDesConsommationsDeau
          : reductionDesConsommationsDeau // ignore: cast_nullable_to_non_nullable
              as num,
      reductionDesEmissionsDeGES: null == reductionDesEmissionsDeGES
          ? _value.reductionDesEmissionsDeGES
          : reductionDesEmissionsDeGES // ignore: cast_nullable_to_non_nullable
              as num,
      realisationDeconomiesFinancieres: null == realisationDeconomiesFinancieres
          ? _value.realisationDeconomiesFinancieres
          : realisationDeconomiesFinancieres // ignore: cast_nullable_to_non_nullable
              as num,
      chiffreDaffairesGenere: null == chiffreDaffairesGenere
          ? _value.chiffreDaffairesGenere
          : chiffreDaffairesGenere // ignore: cast_nullable_to_non_nullable
              as num,
      investissementsRealises: null == investissementsRealises
          ? _value.investissementsRealises
          : investissementsRealises // ignore: cast_nullable_to_non_nullable
              as num,
      developpementDeNouvellesActivitesEtEntreprises: null ==
              developpementDeNouvellesActivitesEtEntreprises
          ? _value.developpementDeNouvellesActivitesEtEntreprises
          : developpementDeNouvellesActivitesEtEntreprises // ignore: cast_nullable_to_non_nullable
              as num,
      creationDemplois: null == creationDemplois
          ? _value.creationDemplois
          : creationDemplois // ignore: cast_nullable_to_non_nullable
              as num,
      maintienDeLemploi: null == maintienDeLemploi
          ? _value.maintienDeLemploi
          : maintienDeLemploi // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SynergieImpl implements _Synergie {
  _$SynergieImpl(
      {required this.id,
      @JsonKey(name: 'demarche_id') required this.demarcheId,
      @JsonKey(name: 'nom') this.nom = '',
      @JsonKey(name: 'commentaire') this.commentaire = '',
      @JsonKey(name: 'commentaire_date') this.commentaireDate = null,
      this.statut = SynergieStatut.identifiee,
      this.type = SynergieType.mutualisation,
      @JsonKey(name: 'flux_ids') final List<String> fluxIds = const <String>[],
      @JsonKey(name: 'created_at') this.createdAt = null,
      @JsonKey(name: 'modified_at') this.modifiedAt = null,
      @JsonKey(name: 'reduction_totale_de_la_consommation_matiere')
      this.reductionTotaleDeLaConsommationMatiere = 0,
      @JsonKey(name: 'reduction_de_la_consommation_matiere_hors_inerte')
      this.reductionDeLaConsommationMatiereHorsInerte = 0,
      @JsonKey(name: 'reduction_totale_des_dechets')
      this.reductionTotaleDesDechets = 0,
      @JsonKey(name: 'reduction_des_dechets_non_inertes')
      this.reductionDesDechetsNonInertes = 0,
      @JsonKey(name: 'amelioration_de_la_valorisation_des_dechets')
      this.ameliorationDeLaValorisationDesDechets = 0,
      @JsonKey(name: 'reduction_des_consommations_d_energie')
      this.reductionDesConsommationsDenergie = 0,
      @JsonKey(name: 'production_d_energie_renouvelable')
      this.productionDenergieRenouvelable = 0,
      @JsonKey(name: 'reduction_des_consommations_d_eau')
      this.reductionDesConsommationsDeau = 0,
      @JsonKey(name: 'reduction_des_emissions_de_ges')
      this.reductionDesEmissionsDeGES = 0,
      @JsonKey(name: 'realisation_d_economies_financieres')
      this.realisationDeconomiesFinancieres = 0,
      @JsonKey(name: 'chiffre_d_affaires_genere')
      this.chiffreDaffairesGenere = 0,
      @JsonKey(name: 'investissements_realises')
      this.investissementsRealises = 0,
      @JsonKey(name: 'developpement_de_nouvelles_activites_et_entreprises')
      this.developpementDeNouvellesActivitesEtEntreprises = 0,
      @JsonKey(name: 'creation_d_emplois') this.creationDemplois = 0,
      @JsonKey(name: 'maintien_de_l_emploi') this.maintienDeLemploi = 0})
      : _fluxIds = fluxIds;

  factory _$SynergieImpl.fromJson(Map<String, dynamic> json) =>
      _$$SynergieImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'demarche_id')
  final String demarcheId;
  @override
  @JsonKey(name: 'nom')
  final String nom;
  @override
  @JsonKey(name: 'commentaire')
  final String commentaire;
  @override
  @JsonKey(name: 'commentaire_date')
  final String? commentaireDate;
  @override
  @JsonKey()
  final SynergieStatut statut;
  @override
  @JsonKey()
  final SynergieType type;
  final List<String> _fluxIds;
  @override
  @JsonKey(name: 'flux_ids')
  List<String> get fluxIds {
    if (_fluxIds is EqualUnmodifiableListView) return _fluxIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fluxIds);
  }

  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'modified_at')
  final String? modifiedAt;
// Synergie indicateurs
// https://www.reseau-synapse.org/library/h/fiche-zoom-n-4-reporting-eit-et-indicateurs-synergies.html
  @override
  @JsonKey(name: 'reduction_totale_de_la_consommation_matiere')
  final num reductionTotaleDeLaConsommationMatiere;
  @override
  @JsonKey(name: 'reduction_de_la_consommation_matiere_hors_inerte')
  final num reductionDeLaConsommationMatiereHorsInerte;
  @override
  @JsonKey(name: 'reduction_totale_des_dechets')
  final num reductionTotaleDesDechets;
  @override
  @JsonKey(name: 'reduction_des_dechets_non_inertes')
  final num reductionDesDechetsNonInertes;
  @override
  @JsonKey(name: 'amelioration_de_la_valorisation_des_dechets')
  final num ameliorationDeLaValorisationDesDechets;
  @override
  @JsonKey(name: 'reduction_des_consommations_d_energie')
  final num reductionDesConsommationsDenergie;
  @override
  @JsonKey(name: 'production_d_energie_renouvelable')
  final num productionDenergieRenouvelable;
  @override
  @JsonKey(name: 'reduction_des_consommations_d_eau')
  final num reductionDesConsommationsDeau;
  @override
  @JsonKey(name: 'reduction_des_emissions_de_ges')
  final num reductionDesEmissionsDeGES;
  @override
  @JsonKey(name: 'realisation_d_economies_financieres')
  final num realisationDeconomiesFinancieres;
  @override
  @JsonKey(name: 'chiffre_d_affaires_genere')
  final num chiffreDaffairesGenere;
  @override
  @JsonKey(name: 'investissements_realises')
  final num investissementsRealises;
  @override
  @JsonKey(name: 'developpement_de_nouvelles_activites_et_entreprises')
  final num developpementDeNouvellesActivitesEtEntreprises;
  @override
  @JsonKey(name: 'creation_d_emplois')
  final num creationDemplois;
  @override
  @JsonKey(name: 'maintien_de_l_emploi')
  final num maintienDeLemploi;

  @override
  String toString() {
    return 'Synergie(id: $id, demarcheId: $demarcheId, nom: $nom, commentaire: $commentaire, commentaireDate: $commentaireDate, statut: $statut, type: $type, fluxIds: $fluxIds, createdAt: $createdAt, modifiedAt: $modifiedAt, reductionTotaleDeLaConsommationMatiere: $reductionTotaleDeLaConsommationMatiere, reductionDeLaConsommationMatiereHorsInerte: $reductionDeLaConsommationMatiereHorsInerte, reductionTotaleDesDechets: $reductionTotaleDesDechets, reductionDesDechetsNonInertes: $reductionDesDechetsNonInertes, ameliorationDeLaValorisationDesDechets: $ameliorationDeLaValorisationDesDechets, reductionDesConsommationsDenergie: $reductionDesConsommationsDenergie, productionDenergieRenouvelable: $productionDenergieRenouvelable, reductionDesConsommationsDeau: $reductionDesConsommationsDeau, reductionDesEmissionsDeGES: $reductionDesEmissionsDeGES, realisationDeconomiesFinancieres: $realisationDeconomiesFinancieres, chiffreDaffairesGenere: $chiffreDaffairesGenere, investissementsRealises: $investissementsRealises, developpementDeNouvellesActivitesEtEntreprises: $developpementDeNouvellesActivitesEtEntreprises, creationDemplois: $creationDemplois, maintienDeLemploi: $maintienDeLemploi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SynergieImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.demarcheId, demarcheId) ||
                other.demarcheId == demarcheId) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.commentaire, commentaire) ||
                other.commentaire == commentaire) &&
            (identical(other.commentaireDate, commentaireDate) ||
                other.commentaireDate == commentaireDate) &&
            (identical(other.statut, statut) || other.statut == statut) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._fluxIds, _fluxIds) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt) &&
            (identical(other.reductionTotaleDeLaConsommationMatiere, reductionTotaleDeLaConsommationMatiere) ||
                other.reductionTotaleDeLaConsommationMatiere ==
                    reductionTotaleDeLaConsommationMatiere) &&
            (identical(other.reductionDeLaConsommationMatiereHorsInerte, reductionDeLaConsommationMatiereHorsInerte) ||
                other.reductionDeLaConsommationMatiereHorsInerte ==
                    reductionDeLaConsommationMatiereHorsInerte) &&
            (identical(other.reductionTotaleDesDechets, reductionTotaleDesDechets) ||
                other.reductionTotaleDesDechets == reductionTotaleDesDechets) &&
            (identical(other.reductionDesDechetsNonInertes, reductionDesDechetsNonInertes) ||
                other.reductionDesDechetsNonInertes ==
                    reductionDesDechetsNonInertes) &&
            (identical(other.ameliorationDeLaValorisationDesDechets, ameliorationDeLaValorisationDesDechets) ||
                other.ameliorationDeLaValorisationDesDechets ==
                    ameliorationDeLaValorisationDesDechets) &&
            (identical(other.reductionDesConsommationsDenergie, reductionDesConsommationsDenergie) ||
                other.reductionDesConsommationsDenergie ==
                    reductionDesConsommationsDenergie) &&
            (identical(other.productionDenergieRenouvelable, productionDenergieRenouvelable) ||
                other.productionDenergieRenouvelable ==
                    productionDenergieRenouvelable) &&
            (identical(other.reductionDesConsommationsDeau, reductionDesConsommationsDeau) ||
                other.reductionDesConsommationsDeau ==
                    reductionDesConsommationsDeau) &&
            (identical(other.reductionDesEmissionsDeGES, reductionDesEmissionsDeGES) ||
                other.reductionDesEmissionsDeGES ==
                    reductionDesEmissionsDeGES) &&
            (identical(other.realisationDeconomiesFinancieres, realisationDeconomiesFinancieres) ||
                other.realisationDeconomiesFinancieres ==
                    realisationDeconomiesFinancieres) &&
            (identical(other.chiffreDaffairesGenere, chiffreDaffairesGenere) ||
                other.chiffreDaffairesGenere == chiffreDaffairesGenere) &&
            (identical(other.investissementsRealises, investissementsRealises) ||
                other.investissementsRealises == investissementsRealises) &&
            (identical(other.developpementDeNouvellesActivitesEtEntreprises, developpementDeNouvellesActivitesEtEntreprises) || other.developpementDeNouvellesActivitesEtEntreprises == developpementDeNouvellesActivitesEtEntreprises) &&
            (identical(other.creationDemplois, creationDemplois) || other.creationDemplois == creationDemplois) &&
            (identical(other.maintienDeLemploi, maintienDeLemploi) || other.maintienDeLemploi == maintienDeLemploi));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        demarcheId,
        nom,
        commentaire,
        commentaireDate,
        statut,
        type,
        const DeepCollectionEquality().hash(_fluxIds),
        createdAt,
        modifiedAt,
        reductionTotaleDeLaConsommationMatiere,
        reductionDeLaConsommationMatiereHorsInerte,
        reductionTotaleDesDechets,
        reductionDesDechetsNonInertes,
        ameliorationDeLaValorisationDesDechets,
        reductionDesConsommationsDenergie,
        productionDenergieRenouvelable,
        reductionDesConsommationsDeau,
        reductionDesEmissionsDeGES,
        realisationDeconomiesFinancieres,
        chiffreDaffairesGenere,
        investissementsRealises,
        developpementDeNouvellesActivitesEtEntreprises,
        creationDemplois,
        maintienDeLemploi
      ]);

  /// Create a copy of Synergie
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SynergieImplCopyWith<_$SynergieImpl> get copyWith =>
      __$$SynergieImplCopyWithImpl<_$SynergieImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SynergieImplToJson(
      this,
    );
  }
}

abstract class _Synergie implements Synergie {
  factory _Synergie(
          {required final String id,
          @JsonKey(name: 'demarche_id') required final String demarcheId,
          @JsonKey(name: 'nom') final String nom,
          @JsonKey(name: 'commentaire') final String commentaire,
          @JsonKey(name: 'commentaire_date') final String? commentaireDate,
          final SynergieStatut statut,
          final SynergieType type,
          @JsonKey(name: 'flux_ids') final List<String> fluxIds,
          @JsonKey(name: 'created_at') final String? createdAt,
          @JsonKey(name: 'modified_at') final String? modifiedAt,
          @JsonKey(name: 'reduction_totale_de_la_consommation_matiere')
          final num reductionTotaleDeLaConsommationMatiere,
          @JsonKey(name: 'reduction_de_la_consommation_matiere_hors_inerte')
          final num reductionDeLaConsommationMatiereHorsInerte,
          @JsonKey(name: 'reduction_totale_des_dechets')
          final num reductionTotaleDesDechets,
          @JsonKey(name: 'reduction_des_dechets_non_inertes')
          final num reductionDesDechetsNonInertes,
          @JsonKey(name: 'amelioration_de_la_valorisation_des_dechets')
          final num ameliorationDeLaValorisationDesDechets,
          @JsonKey(name: 'reduction_des_consommations_d_energie')
          final num reductionDesConsommationsDenergie,
          @JsonKey(name: 'production_d_energie_renouvelable')
          final num productionDenergieRenouvelable,
          @JsonKey(name: 'reduction_des_consommations_d_eau')
          final num reductionDesConsommationsDeau,
          @JsonKey(name: 'reduction_des_emissions_de_ges')
          final num reductionDesEmissionsDeGES,
          @JsonKey(name: 'realisation_d_economies_financieres')
          final num realisationDeconomiesFinancieres,
          @JsonKey(name: 'chiffre_d_affaires_genere')
          final num chiffreDaffairesGenere,
          @JsonKey(name: 'investissements_realises')
          final num investissementsRealises,
          @JsonKey(name: 'developpement_de_nouvelles_activites_et_entreprises')
          final num developpementDeNouvellesActivitesEtEntreprises,
          @JsonKey(name: 'creation_d_emplois') final num creationDemplois,
          @JsonKey(name: 'maintien_de_l_emploi') final num maintienDeLemploi}) =
      _$SynergieImpl;

  factory _Synergie.fromJson(Map<String, dynamic> json) =
      _$SynergieImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'demarche_id')
  String get demarcheId;
  @override
  @JsonKey(name: 'nom')
  String get nom;
  @override
  @JsonKey(name: 'commentaire')
  String get commentaire;
  @override
  @JsonKey(name: 'commentaire_date')
  String? get commentaireDate;
  @override
  SynergieStatut get statut;
  @override
  SynergieType get type;
  @override
  @JsonKey(name: 'flux_ids')
  List<String> get fluxIds;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'modified_at')
  String? get modifiedAt; // Synergie indicateurs
// https://www.reseau-synapse.org/library/h/fiche-zoom-n-4-reporting-eit-et-indicateurs-synergies.html
  @override
  @JsonKey(name: 'reduction_totale_de_la_consommation_matiere')
  num get reductionTotaleDeLaConsommationMatiere;
  @override
  @JsonKey(name: 'reduction_de_la_consommation_matiere_hors_inerte')
  num get reductionDeLaConsommationMatiereHorsInerte;
  @override
  @JsonKey(name: 'reduction_totale_des_dechets')
  num get reductionTotaleDesDechets;
  @override
  @JsonKey(name: 'reduction_des_dechets_non_inertes')
  num get reductionDesDechetsNonInertes;
  @override
  @JsonKey(name: 'amelioration_de_la_valorisation_des_dechets')
  num get ameliorationDeLaValorisationDesDechets;
  @override
  @JsonKey(name: 'reduction_des_consommations_d_energie')
  num get reductionDesConsommationsDenergie;
  @override
  @JsonKey(name: 'production_d_energie_renouvelable')
  num get productionDenergieRenouvelable;
  @override
  @JsonKey(name: 'reduction_des_consommations_d_eau')
  num get reductionDesConsommationsDeau;
  @override
  @JsonKey(name: 'reduction_des_emissions_de_ges')
  num get reductionDesEmissionsDeGES;
  @override
  @JsonKey(name: 'realisation_d_economies_financieres')
  num get realisationDeconomiesFinancieres;
  @override
  @JsonKey(name: 'chiffre_d_affaires_genere')
  num get chiffreDaffairesGenere;
  @override
  @JsonKey(name: 'investissements_realises')
  num get investissementsRealises;
  @override
  @JsonKey(name: 'developpement_de_nouvelles_activites_et_entreprises')
  num get developpementDeNouvellesActivitesEtEntreprises;
  @override
  @JsonKey(name: 'creation_d_emplois')
  num get creationDemplois;
  @override
  @JsonKey(name: 'maintien_de_l_emploi')
  num get maintienDeLemploi;

  /// Create a copy of Synergie
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SynergieImplCopyWith<_$SynergieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClassificationSynapse _$ClassificationSynapseFromJson(
    Map<String, dynamic> json) {
  return _ClassificationSynapse.fromJson(json);
}

/// @nodoc
mixin _$ClassificationSynapse {
  String get categorie => throw _privateConstructorUsedError;
  @JsonKey(name: 'sous_categorie')
  String get sousCategorie => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get unite => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  /// Serializes this ClassificationSynapse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClassificationSynapse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClassificationSynapseCopyWith<ClassificationSynapse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassificationSynapseCopyWith<$Res> {
  factory $ClassificationSynapseCopyWith(ClassificationSynapse value,
          $Res Function(ClassificationSynapse) then) =
      _$ClassificationSynapseCopyWithImpl<$Res, ClassificationSynapse>;
  @useResult
  $Res call(
      {String categorie,
      @JsonKey(name: 'sous_categorie') String sousCategorie,
      String code,
      String unite,
      List<String> tags});
}

/// @nodoc
class _$ClassificationSynapseCopyWithImpl<$Res,
        $Val extends ClassificationSynapse>
    implements $ClassificationSynapseCopyWith<$Res> {
  _$ClassificationSynapseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClassificationSynapse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categorie = null,
    Object? sousCategorie = null,
    Object? code = null,
    Object? unite = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      categorie: null == categorie
          ? _value.categorie
          : categorie // ignore: cast_nullable_to_non_nullable
              as String,
      sousCategorie: null == sousCategorie
          ? _value.sousCategorie
          : sousCategorie // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      unite: null == unite
          ? _value.unite
          : unite // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClassificationSynapseImplCopyWith<$Res>
    implements $ClassificationSynapseCopyWith<$Res> {
  factory _$$ClassificationSynapseImplCopyWith(
          _$ClassificationSynapseImpl value,
          $Res Function(_$ClassificationSynapseImpl) then) =
      __$$ClassificationSynapseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String categorie,
      @JsonKey(name: 'sous_categorie') String sousCategorie,
      String code,
      String unite,
      List<String> tags});
}

/// @nodoc
class __$$ClassificationSynapseImplCopyWithImpl<$Res>
    extends _$ClassificationSynapseCopyWithImpl<$Res,
        _$ClassificationSynapseImpl>
    implements _$$ClassificationSynapseImplCopyWith<$Res> {
  __$$ClassificationSynapseImplCopyWithImpl(_$ClassificationSynapseImpl _value,
      $Res Function(_$ClassificationSynapseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClassificationSynapse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categorie = null,
    Object? sousCategorie = null,
    Object? code = null,
    Object? unite = null,
    Object? tags = null,
  }) {
    return _then(_$ClassificationSynapseImpl(
      null == categorie
          ? _value.categorie
          : categorie // ignore: cast_nullable_to_non_nullable
              as String,
      null == sousCategorie
          ? _value.sousCategorie
          : sousCategorie // ignore: cast_nullable_to_non_nullable
              as String,
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      null == unite
          ? _value.unite
          : unite // ignore: cast_nullable_to_non_nullable
              as String,
      null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClassificationSynapseImpl implements _ClassificationSynapse {
  _$ClassificationSynapseImpl(
      this.categorie,
      @JsonKey(name: 'sous_categorie') this.sousCategorie,
      this.code,
      this.unite,
      final List<String> tags)
      : _tags = tags;

  factory _$ClassificationSynapseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassificationSynapseImplFromJson(json);

  @override
  final String categorie;
  @override
  @JsonKey(name: 'sous_categorie')
  final String sousCategorie;
  @override
  final String code;
  @override
  final String unite;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'ClassificationSynapse(categorie: $categorie, sousCategorie: $sousCategorie, code: $code, unite: $unite, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassificationSynapseImpl &&
            (identical(other.categorie, categorie) ||
                other.categorie == categorie) &&
            (identical(other.sousCategorie, sousCategorie) ||
                other.sousCategorie == sousCategorie) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.unite, unite) || other.unite == unite) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, categorie, sousCategorie, code,
      unite, const DeepCollectionEquality().hash(_tags));

  /// Create a copy of ClassificationSynapse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassificationSynapseImplCopyWith<_$ClassificationSynapseImpl>
      get copyWith => __$$ClassificationSynapseImplCopyWithImpl<
          _$ClassificationSynapseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassificationSynapseImplToJson(
      this,
    );
  }
}

abstract class _ClassificationSynapse implements ClassificationSynapse {
  factory _ClassificationSynapse(
      final String categorie,
      @JsonKey(name: 'sous_categorie') final String sousCategorie,
      final String code,
      final String unite,
      final List<String> tags) = _$ClassificationSynapseImpl;

  factory _ClassificationSynapse.fromJson(Map<String, dynamic> json) =
      _$ClassificationSynapseImpl.fromJson;

  @override
  String get categorie;
  @override
  @JsonKey(name: 'sous_categorie')
  String get sousCategorie;
  @override
  String get code;
  @override
  String get unite;
  @override
  List<String> get tags;

  /// Create a copy of ClassificationSynapse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClassificationSynapseImplCopyWith<_$ClassificationSynapseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AtelierRencontres _$AtelierRencontresFromJson(Map<String, dynamic> json) {
  return _AtelierRencontres.fromJson(json);
}

/// @nodoc
mixin _$AtelierRencontres {
  @JsonKey(name: 'atelier_id')
  String get atelierId => throw _privateConstructorUsedError;
  @JsonKey(name: 'demarche_id')
  String get demarcheId => throw _privateConstructorUsedError;
  @JsonKey(name: 'excluded_participant_ids')
  List<String> get excludedParticipantIds =>
      throw _privateConstructorUsedError; // ScheduleConfiguration
// ----
  @JsonKey(name: 'turn_count')
  num get turnCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'table_count')
  num get tableCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'table_seat_count')
  num get tableSeatCount => throw _privateConstructorUsedError;

  /// Serializes this AtelierRencontres to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AtelierRencontres
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AtelierRencontresCopyWith<AtelierRencontres> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AtelierRencontresCopyWith<$Res> {
  factory $AtelierRencontresCopyWith(
          AtelierRencontres value, $Res Function(AtelierRencontres) then) =
      _$AtelierRencontresCopyWithImpl<$Res, AtelierRencontres>;
  @useResult
  $Res call(
      {@JsonKey(name: 'atelier_id') String atelierId,
      @JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'excluded_participant_ids')
      List<String> excludedParticipantIds,
      @JsonKey(name: 'turn_count') num turnCount,
      @JsonKey(name: 'table_count') num tableCount,
      @JsonKey(name: 'table_seat_count') num tableSeatCount});
}

/// @nodoc
class _$AtelierRencontresCopyWithImpl<$Res, $Val extends AtelierRencontres>
    implements $AtelierRencontresCopyWith<$Res> {
  _$AtelierRencontresCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AtelierRencontres
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? atelierId = null,
    Object? demarcheId = null,
    Object? excludedParticipantIds = null,
    Object? turnCount = null,
    Object? tableCount = null,
    Object? tableSeatCount = null,
  }) {
    return _then(_value.copyWith(
      atelierId: null == atelierId
          ? _value.atelierId
          : atelierId // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      excludedParticipantIds: null == excludedParticipantIds
          ? _value.excludedParticipantIds
          : excludedParticipantIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      turnCount: null == turnCount
          ? _value.turnCount
          : turnCount // ignore: cast_nullable_to_non_nullable
              as num,
      tableCount: null == tableCount
          ? _value.tableCount
          : tableCount // ignore: cast_nullable_to_non_nullable
              as num,
      tableSeatCount: null == tableSeatCount
          ? _value.tableSeatCount
          : tableSeatCount // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AtelierRencontresImplCopyWith<$Res>
    implements $AtelierRencontresCopyWith<$Res> {
  factory _$$AtelierRencontresImplCopyWith(_$AtelierRencontresImpl value,
          $Res Function(_$AtelierRencontresImpl) then) =
      __$$AtelierRencontresImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'atelier_id') String atelierId,
      @JsonKey(name: 'demarche_id') String demarcheId,
      @JsonKey(name: 'excluded_participant_ids')
      List<String> excludedParticipantIds,
      @JsonKey(name: 'turn_count') num turnCount,
      @JsonKey(name: 'table_count') num tableCount,
      @JsonKey(name: 'table_seat_count') num tableSeatCount});
}

/// @nodoc
class __$$AtelierRencontresImplCopyWithImpl<$Res>
    extends _$AtelierRencontresCopyWithImpl<$Res, _$AtelierRencontresImpl>
    implements _$$AtelierRencontresImplCopyWith<$Res> {
  __$$AtelierRencontresImplCopyWithImpl(_$AtelierRencontresImpl _value,
      $Res Function(_$AtelierRencontresImpl) _then)
      : super(_value, _then);

  /// Create a copy of AtelierRencontres
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? atelierId = null,
    Object? demarcheId = null,
    Object? excludedParticipantIds = null,
    Object? turnCount = null,
    Object? tableCount = null,
    Object? tableSeatCount = null,
  }) {
    return _then(_$AtelierRencontresImpl(
      atelierId: null == atelierId
          ? _value.atelierId
          : atelierId // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
      excludedParticipantIds: null == excludedParticipantIds
          ? _value._excludedParticipantIds
          : excludedParticipantIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      turnCount: null == turnCount
          ? _value.turnCount
          : turnCount // ignore: cast_nullable_to_non_nullable
              as num,
      tableCount: null == tableCount
          ? _value.tableCount
          : tableCount // ignore: cast_nullable_to_non_nullable
              as num,
      tableSeatCount: null == tableSeatCount
          ? _value.tableSeatCount
          : tableSeatCount // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AtelierRencontresImpl implements _AtelierRencontres {
  _$AtelierRencontresImpl(
      {@JsonKey(name: 'atelier_id') required this.atelierId,
      @JsonKey(name: 'demarche_id') required this.demarcheId,
      @JsonKey(name: 'excluded_participant_ids')
      final List<String> excludedParticipantIds = const [],
      @JsonKey(name: 'turn_count') this.turnCount = 10,
      @JsonKey(name: 'table_count') this.tableCount = 10,
      @JsonKey(name: 'table_seat_count') this.tableSeatCount = 2})
      : _excludedParticipantIds = excludedParticipantIds;

  factory _$AtelierRencontresImpl.fromJson(Map<String, dynamic> json) =>
      _$$AtelierRencontresImplFromJson(json);

  @override
  @JsonKey(name: 'atelier_id')
  final String atelierId;
  @override
  @JsonKey(name: 'demarche_id')
  final String demarcheId;
  final List<String> _excludedParticipantIds;
  @override
  @JsonKey(name: 'excluded_participant_ids')
  List<String> get excludedParticipantIds {
    if (_excludedParticipantIds is EqualUnmodifiableListView)
      return _excludedParticipantIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_excludedParticipantIds);
  }

// ScheduleConfiguration
// ----
  @override
  @JsonKey(name: 'turn_count')
  final num turnCount;
  @override
  @JsonKey(name: 'table_count')
  final num tableCount;
  @override
  @JsonKey(name: 'table_seat_count')
  final num tableSeatCount;

  @override
  String toString() {
    return 'AtelierRencontres(atelierId: $atelierId, demarcheId: $demarcheId, excludedParticipantIds: $excludedParticipantIds, turnCount: $turnCount, tableCount: $tableCount, tableSeatCount: $tableSeatCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AtelierRencontresImpl &&
            (identical(other.atelierId, atelierId) ||
                other.atelierId == atelierId) &&
            (identical(other.demarcheId, demarcheId) ||
                other.demarcheId == demarcheId) &&
            const DeepCollectionEquality().equals(
                other._excludedParticipantIds, _excludedParticipantIds) &&
            (identical(other.turnCount, turnCount) ||
                other.turnCount == turnCount) &&
            (identical(other.tableCount, tableCount) ||
                other.tableCount == tableCount) &&
            (identical(other.tableSeatCount, tableSeatCount) ||
                other.tableSeatCount == tableSeatCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      atelierId,
      demarcheId,
      const DeepCollectionEquality().hash(_excludedParticipantIds),
      turnCount,
      tableCount,
      tableSeatCount);

  /// Create a copy of AtelierRencontres
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AtelierRencontresImplCopyWith<_$AtelierRencontresImpl> get copyWith =>
      __$$AtelierRencontresImplCopyWithImpl<_$AtelierRencontresImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AtelierRencontresImplToJson(
      this,
    );
  }
}

abstract class _AtelierRencontres implements AtelierRencontres {
  factory _AtelierRencontres(
          {@JsonKey(name: 'atelier_id') required final String atelierId,
          @JsonKey(name: 'demarche_id') required final String demarcheId,
          @JsonKey(name: 'excluded_participant_ids')
          final List<String> excludedParticipantIds,
          @JsonKey(name: 'turn_count') final num turnCount,
          @JsonKey(name: 'table_count') final num tableCount,
          @JsonKey(name: 'table_seat_count') final num tableSeatCount}) =
      _$AtelierRencontresImpl;

  factory _AtelierRencontres.fromJson(Map<String, dynamic> json) =
      _$AtelierRencontresImpl.fromJson;

  @override
  @JsonKey(name: 'atelier_id')
  String get atelierId;
  @override
  @JsonKey(name: 'demarche_id')
  String get demarcheId;
  @override
  @JsonKey(name: 'excluded_participant_ids')
  List<String> get excludedParticipantIds; // ScheduleConfiguration
// ----
  @override
  @JsonKey(name: 'turn_count')
  num get turnCount;
  @override
  @JsonKey(name: 'table_count')
  num get tableCount;
  @override
  @JsonKey(name: 'table_seat_count')
  num get tableSeatCount;

  /// Create a copy of AtelierRencontres
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AtelierRencontresImplCopyWith<_$AtelierRencontresImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
