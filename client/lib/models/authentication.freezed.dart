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
    required TResult Function(
            bool isAdministrateur,
            bool isSuperAdministrateur,
            String email,
            Iterable<String> animateurIds,
            Iterable<String> coAnimateurIds)
        connected,
    required TResult Function() disconnected,
    required TResult Function() connecting,
    required TResult Function() unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isAdministrateur,
            bool isSuperAdministrateur,
            String email,
            Iterable<String> animateurIds,
            Iterable<String> coAnimateurIds)?
        connected,
    TResult? Function()? disconnected,
    TResult? Function()? connecting,
    TResult? Function()? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isAdministrateur,
            bool isSuperAdministrateur,
            String email,
            Iterable<String> animateurIds,
            Iterable<String> coAnimateurIds)?
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
      bool isSuperAdministrateur,
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
    Object? isSuperAdministrateur = null,
    Object? email = null,
    Object? animateurIds = null,
    Object? coAnimateurIds = null,
  }) {
    return _then(_$ConnectedImpl(
      isAdministrateur: null == isAdministrateur
          ? _value.isAdministrateur
          : isAdministrateur // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuperAdministrateur: null == isSuperAdministrateur
          ? _value.isSuperAdministrateur
          : isSuperAdministrateur // ignore: cast_nullable_to_non_nullable
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
      required this.isSuperAdministrateur,
      required this.email,
      required this.animateurIds,
      required this.coAnimateurIds});

  @override
  final bool isAdministrateur;
  @override
  final bool isSuperAdministrateur;
  @override
  final String email;
  @override
  final Iterable<String> animateurIds;
  @override
  final Iterable<String> coAnimateurIds;

  @override
  String toString() {
    return 'User.connected(isAdministrateur: $isAdministrateur, isSuperAdministrateur: $isSuperAdministrateur, email: $email, animateurIds: $animateurIds, coAnimateurIds: $coAnimateurIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectedImpl &&
            (identical(other.isAdministrateur, isAdministrateur) ||
                other.isAdministrateur == isAdministrateur) &&
            (identical(other.isSuperAdministrateur, isSuperAdministrateur) ||
                other.isSuperAdministrateur == isSuperAdministrateur) &&
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
      isSuperAdministrateur,
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
    required TResult Function(
            bool isAdministrateur,
            bool isSuperAdministrateur,
            String email,
            Iterable<String> animateurIds,
            Iterable<String> coAnimateurIds)
        connected,
    required TResult Function() disconnected,
    required TResult Function() connecting,
    required TResult Function() unknown,
  }) {
    return connected(isAdministrateur, isSuperAdministrateur, email,
        animateurIds, coAnimateurIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isAdministrateur,
            bool isSuperAdministrateur,
            String email,
            Iterable<String> animateurIds,
            Iterable<String> coAnimateurIds)?
        connected,
    TResult? Function()? disconnected,
    TResult? Function()? connecting,
    TResult? Function()? unknown,
  }) {
    return connected?.call(isAdministrateur, isSuperAdministrateur, email,
        animateurIds, coAnimateurIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isAdministrateur,
            bool isSuperAdministrateur,
            String email,
            Iterable<String> animateurIds,
            Iterable<String> coAnimateurIds)?
        connected,
    TResult Function()? disconnected,
    TResult Function()? connecting,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(isAdministrateur, isSuperAdministrateur, email,
          animateurIds, coAnimateurIds);
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
      required final bool isSuperAdministrateur,
      required final String email,
      required final Iterable<String> animateurIds,
      required final Iterable<String> coAnimateurIds}) = _$ConnectedImpl;

  bool get isAdministrateur;
  bool get isSuperAdministrateur;
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
    required TResult Function(
            bool isAdministrateur,
            bool isSuperAdministrateur,
            String email,
            Iterable<String> animateurIds,
            Iterable<String> coAnimateurIds)
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
    TResult? Function(
            bool isAdministrateur,
            bool isSuperAdministrateur,
            String email,
            Iterable<String> animateurIds,
            Iterable<String> coAnimateurIds)?
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
    TResult Function(
            bool isAdministrateur,
            bool isSuperAdministrateur,
            String email,
            Iterable<String> animateurIds,
            Iterable<String> coAnimateurIds)?
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
    required TResult Function(
            bool isAdministrateur,
            bool isSuperAdministrateur,
            String email,
            Iterable<String> animateurIds,
            Iterable<String> coAnimateurIds)
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
    TResult? Function(
            bool isAdministrateur,
            bool isSuperAdministrateur,
            String email,
            Iterable<String> animateurIds,
            Iterable<String> coAnimateurIds)?
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
    TResult Function(
            bool isAdministrateur,
            bool isSuperAdministrateur,
            String email,
            Iterable<String> animateurIds,
            Iterable<String> coAnimateurIds)?
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
    required TResult Function(
            bool isAdministrateur,
            bool isSuperAdministrateur,
            String email,
            Iterable<String> animateurIds,
            Iterable<String> coAnimateurIds)
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
    TResult? Function(
            bool isAdministrateur,
            bool isSuperAdministrateur,
            String email,
            Iterable<String> animateurIds,
            Iterable<String> coAnimateurIds)?
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
    TResult Function(
            bool isAdministrateur,
            bool isSuperAdministrateur,
            String email,
            Iterable<String> animateurIds,
            Iterable<String> coAnimateurIds)?
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
