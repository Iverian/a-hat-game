// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'router_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RouterState {
  bool get isPlayerNameSet => throw _privateConstructorUsedError;
  GameStage get gameStage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RouterStateCopyWith<RouterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouterStateCopyWith<$Res> {
  factory $RouterStateCopyWith(
          RouterState value, $Res Function(RouterState) then) =
      _$RouterStateCopyWithImpl<$Res, RouterState>;
  @useResult
  $Res call({bool isPlayerNameSet, GameStage gameStage});
}

/// @nodoc
class _$RouterStateCopyWithImpl<$Res, $Val extends RouterState>
    implements $RouterStateCopyWith<$Res> {
  _$RouterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPlayerNameSet = null,
    Object? gameStage = null,
  }) {
    return _then(_value.copyWith(
      isPlayerNameSet: null == isPlayerNameSet
          ? _value.isPlayerNameSet
          : isPlayerNameSet // ignore: cast_nullable_to_non_nullable
              as bool,
      gameStage: null == gameStage
          ? _value.gameStage
          : gameStage // ignore: cast_nullable_to_non_nullable
              as GameStage,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RouterStateCopyWith<$Res>
    implements $RouterStateCopyWith<$Res> {
  factory _$$_RouterStateCopyWith(
          _$_RouterState value, $Res Function(_$_RouterState) then) =
      __$$_RouterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isPlayerNameSet, GameStage gameStage});
}

/// @nodoc
class __$$_RouterStateCopyWithImpl<$Res>
    extends _$RouterStateCopyWithImpl<$Res, _$_RouterState>
    implements _$$_RouterStateCopyWith<$Res> {
  __$$_RouterStateCopyWithImpl(
      _$_RouterState _value, $Res Function(_$_RouterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPlayerNameSet = null,
    Object? gameStage = null,
  }) {
    return _then(_$_RouterState(
      isPlayerNameSet: null == isPlayerNameSet
          ? _value.isPlayerNameSet
          : isPlayerNameSet // ignore: cast_nullable_to_non_nullable
              as bool,
      gameStage: null == gameStage
          ? _value.gameStage
          : gameStage // ignore: cast_nullable_to_non_nullable
              as GameStage,
    ));
  }
}

/// @nodoc

class _$_RouterState implements _RouterState {
  const _$_RouterState(
      {required this.isPlayerNameSet, required this.gameStage});

  @override
  final bool isPlayerNameSet;
  @override
  final GameStage gameStage;

  @override
  String toString() {
    return 'RouterState(isPlayerNameSet: $isPlayerNameSet, gameStage: $gameStage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RouterState &&
            (identical(other.isPlayerNameSet, isPlayerNameSet) ||
                other.isPlayerNameSet == isPlayerNameSet) &&
            (identical(other.gameStage, gameStage) ||
                other.gameStage == gameStage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isPlayerNameSet, gameStage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RouterStateCopyWith<_$_RouterState> get copyWith =>
      __$$_RouterStateCopyWithImpl<_$_RouterState>(this, _$identity);
}

abstract class _RouterState implements RouterState {
  const factory _RouterState(
      {required final bool isPlayerNameSet,
      required final GameStage gameStage}) = _$_RouterState;

  @override
  bool get isPlayerNameSet;
  @override
  GameStage get gameStage;
  @override
  @JsonKey(ignore: true)
  _$$_RouterStateCopyWith<_$_RouterState> get copyWith =>
      throw _privateConstructorUsedError;
}
