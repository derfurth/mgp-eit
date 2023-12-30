// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$User {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAdministrateur, String email,
            Iterable<String> animateurIds, Iterable<String> coAnimateurIds)
        connected,
    required TResult Function() disconnected,
    required TResult Function() connecting,
    required TResult Function() unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAdministrateur, String email,
            Iterable<String> animateurIds, Iterable<String> coAnimateurIds)?
        connected,
    TResult? Function()? disconnected,
    TResult? Function()? connecting,
    TResult? Function()? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAdministrateur, String email,
            Iterable<String> animateurIds, Iterable<String> coAnimateurIds)?
        connected,
    TResult Function()? disconnected,
    TResult Function()? connecting,
    TResult Function()? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Connected value) connected,
    required TResult Function(Disconnected value) disconnected,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Connected value)? connected,
    TResult? Function(Disconnected value)? disconnected,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Connected value)? connected,
    TResult Function(Disconnected value)? disconnected,
    TResult Function(Connecting value)? connecting,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ConnectedImplCopyWith<$Res> {
  factory _$$ConnectedImplCopyWith(
          _$ConnectedImpl value, $Res Function(_$ConnectedImpl) then) =
      __$$ConnectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool isAdministrateur,
      String email,
      Iterable<String> animateurIds,
      Iterable<String> coAnimateurIds});
}

/// @nodoc
class __$$ConnectedImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$ConnectedImpl>
    implements _$$ConnectedImplCopyWith<$Res> {
  __$$ConnectedImplCopyWithImpl(
      _$ConnectedImpl _value, $Res Function(_$ConnectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAdministrateur = null,
    Object? email = null,
    Object? animateurIds = null,
    Object? coAnimateurIds = null,
  }) {
    return _then(_$ConnectedImpl(
      isAdministrateur: null == isAdministrateur
          ? _value.isAdministrateur
          : isAdministrateur // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      animateurIds: null == animateurIds
          ? _value.animateurIds
          : animateurIds // ignore: cast_nullable_to_non_nullable
              as Iterable<String>,
      coAnimateurIds: null == coAnimateurIds
          ? _value.coAnimateurIds
          : coAnimateurIds // ignore: cast_nullable_to_non_nullable
              as Iterable<String>,
    ));
  }
}

/// @nodoc

class _$ConnectedImpl implements Connected {
  _$ConnectedImpl(
      {required this.isAdministrateur,
      required this.email,
      required this.animateurIds,
      required this.coAnimateurIds});

  @override
  final bool isAdministrateur;
  @override
  final String email;
  @override
  final Iterable<String> animateurIds;
  @override
  final Iterable<String> coAnimateurIds;

  @override
  String toString() {
    return 'User.connected(isAdministrateur: $isAdministrateur, email: $email, animateurIds: $animateurIds, coAnimateurIds: $coAnimateurIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectedImpl &&
            (identical(other.isAdministrateur, isAdministrateur) ||
                other.isAdministrateur == isAdministrateur) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other.animateurIds, animateurIds) &&
            const DeepCollectionEquality()
                .equals(other.coAnimateurIds, coAnimateurIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isAdministrateur,
      email,
      const DeepCollectionEquality().hash(animateurIds),
      const DeepCollectionEquality().hash(coAnimateurIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectedImplCopyWith<_$ConnectedImpl> get copyWith =>
      __$$ConnectedImplCopyWithImpl<_$ConnectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAdministrateur, String email,
            Iterable<String> animateurIds, Iterable<String> coAnimateurIds)
        connected,
    required TResult Function() disconnected,
    required TResult Function() connecting,
    required TResult Function() unknown,
  }) {
    return connected(isAdministrateur, email, animateurIds, coAnimateurIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAdministrateur, String email,
            Iterable<String> animateurIds, Iterable<String> coAnimateurIds)?
        connected,
    TResult? Function()? disconnected,
    TResult? Function()? connecting,
    TResult? Function()? unknown,
  }) {
    return connected?.call(
        isAdministrateur, email, animateurIds, coAnimateurIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAdministrateur, String email,
            Iterable<String> animateurIds, Iterable<String> coAnimateurIds)?
        connected,
    TResult Function()? disconnected,
    TResult Function()? connecting,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(isAdministrateur, email, animateurIds, coAnimateurIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Connected value) connected,
    required TResult Function(Disconnected value) disconnected,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Unknown value) unknown,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Connected value)? connected,
    TResult? Function(Disconnected value)? disconnected,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Unknown value)? unknown,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Connected value)? connected,
    TResult Function(Disconnected value)? disconnected,
    TResult Function(Connecting value)? connecting,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class Connected implements User {
  factory Connected(
      {required final bool isAdministrateur,
      required final String email,
      required final Iterable<String> animateurIds,
      required final Iterable<String> coAnimateurIds}) = _$ConnectedImpl;

  bool get isAdministrateur;
  String get email;
  Iterable<String> get animateurIds;
  Iterable<String> get coAnimateurIds;
  @JsonKey(ignore: true)
  _$$ConnectedImplCopyWith<_$ConnectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisconnectedImplCopyWith<$Res> {
  factory _$$DisconnectedImplCopyWith(
          _$DisconnectedImpl value, $Res Function(_$DisconnectedImpl) then) =
      __$$DisconnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisconnectedImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$DisconnectedImpl>
    implements _$$DisconnectedImplCopyWith<$Res> {
  __$$DisconnectedImplCopyWithImpl(
      _$DisconnectedImpl _value, $Res Function(_$DisconnectedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DisconnectedImpl implements Disconnected {
  _$DisconnectedImpl();

  @override
  String toString() {
    return 'User.disconnected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DisconnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAdministrateur, String email,
            Iterable<String> animateurIds, Iterable<String> coAnimateurIds)
        connected,
    required TResult Function() disconnected,
    required TResult Function() connecting,
    required TResult Function() unknown,
  }) {
    return disconnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAdministrateur, String email,
            Iterable<String> animateurIds, Iterable<String> coAnimateurIds)?
        connected,
    TResult? Function()? disconnected,
    TResult? Function()? connecting,
    TResult? Function()? unknown,
  }) {
    return disconnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAdministrateur, String email,
            Iterable<String> animateurIds, Iterable<String> coAnimateurIds)?
        connected,
    TResult Function()? disconnected,
    TResult Function()? connecting,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Connected value) connected,
    required TResult Function(Disconnected value) disconnected,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Unknown value) unknown,
  }) {
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Connected value)? connected,
    TResult? Function(Disconnected value)? disconnected,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Unknown value)? unknown,
  }) {
    return disconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Connected value)? connected,
    TResult Function(Disconnected value)? disconnected,
    TResult Function(Connecting value)? connecting,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }
}

abstract class Disconnected implements User {
  factory Disconnected() = _$DisconnectedImpl;
}

/// @nodoc
abstract class _$$ConnectingImplCopyWith<$Res> {
  factory _$$ConnectingImplCopyWith(
          _$ConnectingImpl value, $Res Function(_$ConnectingImpl) then) =
      __$$ConnectingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectingImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$ConnectingImpl>
    implements _$$ConnectingImplCopyWith<$Res> {
  __$$ConnectingImplCopyWithImpl(
      _$ConnectingImpl _value, $Res Function(_$ConnectingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ConnectingImpl implements Connecting {
  _$ConnectingImpl();

  @override
  String toString() {
    return 'User.connecting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAdministrateur, String email,
            Iterable<String> animateurIds, Iterable<String> coAnimateurIds)
        connected,
    required TResult Function() disconnected,
    required TResult Function() connecting,
    required TResult Function() unknown,
  }) {
    return connecting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAdministrateur, String email,
            Iterable<String> animateurIds, Iterable<String> coAnimateurIds)?
        connected,
    TResult? Function()? disconnected,
    TResult? Function()? connecting,
    TResult? Function()? unknown,
  }) {
    return connecting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAdministrateur, String email,
            Iterable<String> animateurIds, Iterable<String> coAnimateurIds)?
        connected,
    TResult Function()? disconnected,
    TResult Function()? connecting,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Connected value) connected,
    required TResult Function(Disconnected value) disconnected,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Unknown value) unknown,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Connected value)? connected,
    TResult? Function(Disconnected value)? disconnected,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Unknown value)? unknown,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Connected value)? connected,
    TResult Function(Disconnected value)? disconnected,
    TResult Function(Connecting value)? connecting,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class Connecting implements User {
  factory Connecting() = _$ConnectingImpl;
}

/// @nodoc
abstract class _$$UnknownImplCopyWith<$Res> {
  factory _$$UnknownImplCopyWith(
          _$UnknownImpl value, $Res Function(_$UnknownImpl) then) =
      __$$UnknownImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UnknownImpl>
    implements _$$UnknownImplCopyWith<$Res> {
  __$$UnknownImplCopyWithImpl(
      _$UnknownImpl _value, $Res Function(_$UnknownImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnknownImpl implements Unknown {
  _$UnknownImpl();

  @override
  String toString() {
    return 'User.unknown()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnknownImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAdministrateur, String email,
            Iterable<String> animateurIds, Iterable<String> coAnimateurIds)
        connected,
    required TResult Function() disconnected,
    required TResult Function() connecting,
    required TResult Function() unknown,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAdministrateur, String email,
            Iterable<String> animateurIds, Iterable<String> coAnimateurIds)?
        connected,
    TResult? Function()? disconnected,
    TResult? Function()? connecting,
    TResult? Function()? unknown,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAdministrateur, String email,
            Iterable<String> animateurIds, Iterable<String> coAnimateurIds)?
        connected,
    TResult Function()? disconnected,
    TResult Function()? connecting,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Connected value) connected,
    required TResult Function(Disconnected value) disconnected,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Connected value)? connected,
    TResult? Function(Disconnected value)? disconnected,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Connected value)? connected,
    TResult Function(Disconnected value)? disconnected,
    TResult Function(Connecting value)? connecting,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class Unknown implements User {
  factory Unknown() = _$UnknownImpl;
}

/// @nodoc
mixin _$Invitation {
  String get demarcheId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String animateurId, String demarcheId) animateur,
    required TResult Function(String coAnimateurId, String demarcheId)
        coAnimateur,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String animateurId, String demarcheId)? animateur,
    TResult? Function(String coAnimateurId, String demarcheId)? coAnimateur,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String animateurId, String demarcheId)? animateur,
    TResult Function(String coAnimateurId, String demarcheId)? coAnimateur,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Animateur value) animateur,
    required TResult Function(CoAnimateur value) coAnimateur,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Animateur value)? animateur,
    TResult? Function(CoAnimateur value)? coAnimateur,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Animateur value)? animateur,
    TResult Function(CoAnimateur value)? coAnimateur,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvitationCopyWith<Invitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationCopyWith<$Res> {
  factory $InvitationCopyWith(
          Invitation value, $Res Function(Invitation) then) =
      _$InvitationCopyWithImpl<$Res, Invitation>;
  @useResult
  $Res call({String demarcheId});
}

/// @nodoc
class _$InvitationCopyWithImpl<$Res, $Val extends Invitation>
    implements $InvitationCopyWith<$Res> {
  _$InvitationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? demarcheId = null,
  }) {
    return _then(_value.copyWith(
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimateurImplCopyWith<$Res>
    implements $InvitationCopyWith<$Res> {
  factory _$$AnimateurImplCopyWith(
          _$AnimateurImpl value, $Res Function(_$AnimateurImpl) then) =
      __$$AnimateurImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String animateurId, String demarcheId});
}

/// @nodoc
class __$$AnimateurImplCopyWithImpl<$Res>
    extends _$InvitationCopyWithImpl<$Res, _$AnimateurImpl>
    implements _$$AnimateurImplCopyWith<$Res> {
  __$$AnimateurImplCopyWithImpl(
      _$AnimateurImpl _value, $Res Function(_$AnimateurImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animateurId = null,
    Object? demarcheId = null,
  }) {
    return _then(_$AnimateurImpl(
      animateurId: null == animateurId
          ? _value.animateurId
          : animateurId // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AnimateurImpl implements Animateur {
  _$AnimateurImpl({required this.animateurId, required this.demarcheId});

  @override
  final String animateurId;
  @override
  final String demarcheId;

  @override
  String toString() {
    return 'Invitation.animateur(animateurId: $animateurId, demarcheId: $demarcheId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimateurImpl &&
            (identical(other.animateurId, animateurId) ||
                other.animateurId == animateurId) &&
            (identical(other.demarcheId, demarcheId) ||
                other.demarcheId == demarcheId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, animateurId, demarcheId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimateurImplCopyWith<_$AnimateurImpl> get copyWith =>
      __$$AnimateurImplCopyWithImpl<_$AnimateurImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String animateurId, String demarcheId) animateur,
    required TResult Function(String coAnimateurId, String demarcheId)
        coAnimateur,
  }) {
    return animateur(animateurId, demarcheId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String animateurId, String demarcheId)? animateur,
    TResult? Function(String coAnimateurId, String demarcheId)? coAnimateur,
  }) {
    return animateur?.call(animateurId, demarcheId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String animateurId, String demarcheId)? animateur,
    TResult Function(String coAnimateurId, String demarcheId)? coAnimateur,
    required TResult orElse(),
  }) {
    if (animateur != null) {
      return animateur(animateurId, demarcheId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Animateur value) animateur,
    required TResult Function(CoAnimateur value) coAnimateur,
  }) {
    return animateur(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Animateur value)? animateur,
    TResult? Function(CoAnimateur value)? coAnimateur,
  }) {
    return animateur?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Animateur value)? animateur,
    TResult Function(CoAnimateur value)? coAnimateur,
    required TResult orElse(),
  }) {
    if (animateur != null) {
      return animateur(this);
    }
    return orElse();
  }
}

abstract class Animateur implements Invitation {
  factory Animateur(
      {required final String animateurId,
      required final String demarcheId}) = _$AnimateurImpl;

  String get animateurId;
  @override
  String get demarcheId;
  @override
  @JsonKey(ignore: true)
  _$$AnimateurImplCopyWith<_$AnimateurImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CoAnimateurImplCopyWith<$Res>
    implements $InvitationCopyWith<$Res> {
  factory _$$CoAnimateurImplCopyWith(
          _$CoAnimateurImpl value, $Res Function(_$CoAnimateurImpl) then) =
      __$$CoAnimateurImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String coAnimateurId, String demarcheId});
}

/// @nodoc
class __$$CoAnimateurImplCopyWithImpl<$Res>
    extends _$InvitationCopyWithImpl<$Res, _$CoAnimateurImpl>
    implements _$$CoAnimateurImplCopyWith<$Res> {
  __$$CoAnimateurImplCopyWithImpl(
      _$CoAnimateurImpl _value, $Res Function(_$CoAnimateurImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coAnimateurId = null,
    Object? demarcheId = null,
  }) {
    return _then(_$CoAnimateurImpl(
      coAnimateurId: null == coAnimateurId
          ? _value.coAnimateurId
          : coAnimateurId // ignore: cast_nullable_to_non_nullable
              as String,
      demarcheId: null == demarcheId
          ? _value.demarcheId
          : demarcheId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CoAnimateurImpl implements CoAnimateur {
  _$CoAnimateurImpl({required this.coAnimateurId, required this.demarcheId});

  @override
  final String coAnimateurId;
  @override
  final String demarcheId;

  @override
  String toString() {
    return 'Invitation.coAnimateur(coAnimateurId: $coAnimateurId, demarcheId: $demarcheId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoAnimateurImpl &&
            (identical(other.coAnimateurId, coAnimateurId) ||
                other.coAnimateurId == coAnimateurId) &&
            (identical(other.demarcheId, demarcheId) ||
                other.demarcheId == demarcheId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, coAnimateurId, demarcheId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoAnimateurImplCopyWith<_$CoAnimateurImpl> get copyWith =>
      __$$CoAnimateurImplCopyWithImpl<_$CoAnimateurImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String animateurId, String demarcheId) animateur,
    required TResult Function(String coAnimateurId, String demarcheId)
        coAnimateur,
  }) {
    return coAnimateur(coAnimateurId, demarcheId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String animateurId, String demarcheId)? animateur,
    TResult? Function(String coAnimateurId, String demarcheId)? coAnimateur,
  }) {
    return coAnimateur?.call(coAnimateurId, demarcheId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String animateurId, String demarcheId)? animateur,
    TResult Function(String coAnimateurId, String demarcheId)? coAnimateur,
    required TResult orElse(),
  }) {
    if (coAnimateur != null) {
      return coAnimateur(coAnimateurId, demarcheId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Animateur value) animateur,
    required TResult Function(CoAnimateur value) coAnimateur,
  }) {
    return coAnimateur(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Animateur value)? animateur,
    TResult? Function(CoAnimateur value)? coAnimateur,
  }) {
    return coAnimateur?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Animateur value)? animateur,
    TResult Function(CoAnimateur value)? coAnimateur,
    required TResult orElse(),
  }) {
    if (coAnimateur != null) {
      return coAnimateur(this);
    }
    return orElse();
  }
}

abstract class CoAnimateur implements Invitation {
  factory CoAnimateur(
      {required final String coAnimateurId,
      required final String demarcheId}) = _$CoAnimateurImpl;

  String get coAnimateurId;
  @override
  String get demarcheId;
  @override
  @JsonKey(ignore: true)
  _$$CoAnimateurImplCopyWith<_$CoAnimateurImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
