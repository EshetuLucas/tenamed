// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pharmacy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Pharmacy _$PharmacyFromJson(Map<String, dynamic> json) {
  return _Pharmacy.fromJson(json);
}

/// @nodoc
class _$PharmacyTearOff {
  const _$PharmacyTearOff();

  _Pharmacy call(
      {required double lat,
      required double lng,
      required String name,
      required String phoneNumber1,
      String? phoneNumber2,
      String? city,
      String? streetAddress,
      String? subCity,
      String? email,
      double distance = 0,
      List<String> images = const []}) {
    return _Pharmacy(
      lat: lat,
      lng: lng,
      name: name,
      phoneNumber1: phoneNumber1,
      phoneNumber2: phoneNumber2,
      city: city,
      streetAddress: streetAddress,
      subCity: subCity,
      email: email,
      distance: distance,
      images: images,
    );
  }

  Pharmacy fromJson(Map<String, Object?> json) {
    return Pharmacy.fromJson(json);
  }
}

/// @nodoc
const $Pharmacy = _$PharmacyTearOff();

/// @nodoc
mixin _$Pharmacy {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber1 => throw _privateConstructorUsedError;
  String? get phoneNumber2 => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get streetAddress => throw _privateConstructorUsedError;
  String? get subCity => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PharmacyCopyWith<Pharmacy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PharmacyCopyWith<$Res> {
  factory $PharmacyCopyWith(Pharmacy value, $Res Function(Pharmacy) then) =
      _$PharmacyCopyWithImpl<$Res>;
  $Res call(
      {double lat,
      double lng,
      String name,
      String phoneNumber1,
      String? phoneNumber2,
      String? city,
      String? streetAddress,
      String? subCity,
      String? email,
      double distance,
      List<String> images});
}

/// @nodoc
class _$PharmacyCopyWithImpl<$Res> implements $PharmacyCopyWith<$Res> {
  _$PharmacyCopyWithImpl(this._value, this._then);

  final Pharmacy _value;
  // ignore: unused_field
  final $Res Function(Pharmacy) _then;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
    Object? name = freezed,
    Object? phoneNumber1 = freezed,
    Object? phoneNumber2 = freezed,
    Object? city = freezed,
    Object? streetAddress = freezed,
    Object? subCity = freezed,
    Object? email = freezed,
    Object? distance = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber1: phoneNumber1 == freezed
          ? _value.phoneNumber1
          : phoneNumber1 // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber2: phoneNumber2 == freezed
          ? _value.phoneNumber2
          : phoneNumber2 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      streetAddress: streetAddress == freezed
          ? _value.streetAddress
          : streetAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      subCity: subCity == freezed
          ? _value.subCity
          : subCity // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$PharmacyCopyWith<$Res> implements $PharmacyCopyWith<$Res> {
  factory _$PharmacyCopyWith(_Pharmacy value, $Res Function(_Pharmacy) then) =
      __$PharmacyCopyWithImpl<$Res>;
  @override
  $Res call(
      {double lat,
      double lng,
      String name,
      String phoneNumber1,
      String? phoneNumber2,
      String? city,
      String? streetAddress,
      String? subCity,
      String? email,
      double distance,
      List<String> images});
}

/// @nodoc
class __$PharmacyCopyWithImpl<$Res> extends _$PharmacyCopyWithImpl<$Res>
    implements _$PharmacyCopyWith<$Res> {
  __$PharmacyCopyWithImpl(_Pharmacy _value, $Res Function(_Pharmacy) _then)
      : super(_value, (v) => _then(v as _Pharmacy));

  @override
  _Pharmacy get _value => super._value as _Pharmacy;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
    Object? name = freezed,
    Object? phoneNumber1 = freezed,
    Object? phoneNumber2 = freezed,
    Object? city = freezed,
    Object? streetAddress = freezed,
    Object? subCity = freezed,
    Object? email = freezed,
    Object? distance = freezed,
    Object? images = freezed,
  }) {
    return _then(_Pharmacy(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber1: phoneNumber1 == freezed
          ? _value.phoneNumber1
          : phoneNumber1 // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber2: phoneNumber2 == freezed
          ? _value.phoneNumber2
          : phoneNumber2 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      streetAddress: streetAddress == freezed
          ? _value.streetAddress
          : streetAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      subCity: subCity == freezed
          ? _value.subCity
          : subCity // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Pharmacy extends _Pharmacy {
  _$_Pharmacy(
      {required this.lat,
      required this.lng,
      required this.name,
      required this.phoneNumber1,
      this.phoneNumber2,
      this.city,
      this.streetAddress,
      this.subCity,
      this.email,
      this.distance = 0,
      this.images = const []})
      : super._();

  factory _$_Pharmacy.fromJson(Map<String, dynamic> json) =>
      _$$_PharmacyFromJson(json);

  @override
  final double lat;
  @override
  final double lng;
  @override
  final String name;
  @override
  final String phoneNumber1;
  @override
  final String? phoneNumber2;
  @override
  final String? city;
  @override
  final String? streetAddress;
  @override
  final String? subCity;
  @override
  final String? email;
  @JsonKey()
  @override
  final double distance;
  @JsonKey()
  @override
  final List<String> images;

  @override
  String toString() {
    return 'Pharmacy(lat: $lat, lng: $lng, name: $name, phoneNumber1: $phoneNumber1, phoneNumber2: $phoneNumber2, city: $city, streetAddress: $streetAddress, subCity: $subCity, email: $email, distance: $distance, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Pharmacy &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.lng, lng) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber1, phoneNumber1) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber2, phoneNumber2) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality()
                .equals(other.streetAddress, streetAddress) &&
            const DeepCollectionEquality().equals(other.subCity, subCity) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.distance, distance) &&
            const DeepCollectionEquality().equals(other.images, images));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lat),
      const DeepCollectionEquality().hash(lng),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(phoneNumber1),
      const DeepCollectionEquality().hash(phoneNumber2),
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(streetAddress),
      const DeepCollectionEquality().hash(subCity),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(distance),
      const DeepCollectionEquality().hash(images));

  @JsonKey(ignore: true)
  @override
  _$PharmacyCopyWith<_Pharmacy> get copyWith =>
      __$PharmacyCopyWithImpl<_Pharmacy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PharmacyToJson(this);
  }
}

abstract class _Pharmacy extends Pharmacy {
  factory _Pharmacy(
      {required double lat,
      required double lng,
      required String name,
      required String phoneNumber1,
      String? phoneNumber2,
      String? city,
      String? streetAddress,
      String? subCity,
      String? email,
      double distance,
      List<String> images}) = _$_Pharmacy;
  _Pharmacy._() : super._();

  factory _Pharmacy.fromJson(Map<String, dynamic> json) = _$_Pharmacy.fromJson;

  @override
  double get lat;
  @override
  double get lng;
  @override
  String get name;
  @override
  String get phoneNumber1;
  @override
  String? get phoneNumber2;
  @override
  String? get city;
  @override
  String? get streetAddress;
  @override
  String? get subCity;
  @override
  String? get email;
  @override
  double get distance;
  @override
  List<String> get images;
  @override
  @JsonKey(ignore: true)
  _$PharmacyCopyWith<_Pharmacy> get copyWith =>
      throw _privateConstructorUsedError;
}
