// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddModel _$AddModelFromJson(Map<String, dynamic> json) {
  return _AddModel.fromJson(json);
}

/// @nodoc
mixin _$AddModel {
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddModelCopyWith<AddModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddModelCopyWith<$Res> {
  factory $AddModelCopyWith(AddModel value, $Res Function(AddModel) then) =
      _$AddModelCopyWithImpl<$Res, AddModel>;
  @useResult
  $Res call({String from, String to, String price, DateTime date});
}

/// @nodoc
class _$AddModelCopyWithImpl<$Res, $Val extends AddModel>
    implements $AddModelCopyWith<$Res> {
  _$AddModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? price = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddModelCopyWith<$Res> implements $AddModelCopyWith<$Res> {
  factory _$$_AddModelCopyWith(
          _$_AddModel value, $Res Function(_$_AddModel) then) =
      __$$_AddModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String from, String to, String price, DateTime date});
}

/// @nodoc
class __$$_AddModelCopyWithImpl<$Res>
    extends _$AddModelCopyWithImpl<$Res, _$_AddModel>
    implements _$$_AddModelCopyWith<$Res> {
  __$$_AddModelCopyWithImpl(
      _$_AddModel _value, $Res Function(_$_AddModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? price = null,
    Object? date = null,
  }) {
    return _then(_$_AddModel(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddModel extends _AddModel {
  const _$_AddModel(
      {required this.from,
      required this.to,
      required this.price,
      required this.date})
      : super._();

  factory _$_AddModel.fromJson(Map<String, dynamic> json) =>
      _$$_AddModelFromJson(json);

  @override
  final String from;
  @override
  final String to;
  @override
  final String price;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'AddModel(from: $from, to: $to, price: $price, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddModel &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, from, to, price, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddModelCopyWith<_$_AddModel> get copyWith =>
      __$$_AddModelCopyWithImpl<_$_AddModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddModelToJson(
      this,
    );
  }
}

abstract class _AddModel extends AddModel {
  const factory _AddModel(
      {required final String from,
      required final String to,
      required final String price,
      required final DateTime date}) = _$_AddModel;
  const _AddModel._() : super._();

  factory _AddModel.fromJson(Map<String, dynamic> json) = _$_AddModel.fromJson;

  @override
  String get from;
  @override
  String get to;
  @override
  String get price;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_AddModelCopyWith<_$_AddModel> get copyWith =>
      throw _privateConstructorUsedError;
}
