// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Facture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Facture {
  String get id => throw _privateConstructorUsedError;
  String get nomClient => throw _privateConstructorUsedError;
  int get prix => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FactureCopyWith<Facture> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FactureCopyWith<$Res> {
  factory $FactureCopyWith(Facture value, $Res Function(Facture) then) =
      _$FactureCopyWithImpl<$Res, Facture>;
  @useResult
  $Res call({String id, String nomClient, int prix});
}

/// @nodoc
class _$FactureCopyWithImpl<$Res, $Val extends Facture>
    implements $FactureCopyWith<$Res> {
  _$FactureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nomClient = null,
    Object? prix = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nomClient: null == nomClient
          ? _value.nomClient
          : nomClient // ignore: cast_nullable_to_non_nullable
              as String,
      prix: null == prix
          ? _value.prix
          : prix // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FactureCopyWith<$Res> implements $FactureCopyWith<$Res> {
  factory _$$_FactureCopyWith(
          _$_Facture value, $Res Function(_$_Facture) then) =
      __$$_FactureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String nomClient, int prix});
}

/// @nodoc
class __$$_FactureCopyWithImpl<$Res>
    extends _$FactureCopyWithImpl<$Res, _$_Facture>
    implements _$$_FactureCopyWith<$Res> {
  __$$_FactureCopyWithImpl(_$_Facture _value, $Res Function(_$_Facture) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nomClient = null,
    Object? prix = null,
  }) {
    return _then(_$_Facture(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nomClient: null == nomClient
          ? _value.nomClient
          : nomClient // ignore: cast_nullable_to_non_nullable
              as String,
      prix: null == prix
          ? _value.prix
          : prix // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Facture implements _Facture {
  _$_Facture({this.id = "", this.nomClient = "", this.prix = 0});

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String nomClient;
  @override
  @JsonKey()
  final int prix;

  @override
  String toString() {
    return 'Facture(id: $id, nomClient: $nomClient, prix: $prix)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Facture &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nomClient, nomClient) ||
                other.nomClient == nomClient) &&
            (identical(other.prix, prix) || other.prix == prix));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, nomClient, prix);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FactureCopyWith<_$_Facture> get copyWith =>
      __$$_FactureCopyWithImpl<_$_Facture>(this, _$identity);
}

abstract class _Facture implements Facture {
  factory _Facture({final String id, final String nomClient, final int prix}) =
      _$_Facture;

  @override
  String get id;
  @override
  String get nomClient;
  @override
  int get prix;
  @override
  @JsonKey(ignore: true)
  _$$_FactureCopyWith<_$_Facture> get copyWith =>
      throw _privateConstructorUsedError;
}
