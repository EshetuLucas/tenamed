// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Pharmacy _$$_PharmacyFromJson(Map<String, dynamic> json) => _$_Pharmacy(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      name: json['name'] as String,
      phoneNumber1: json['phoneNumber1'] as String,
      phoneNumber2: json['phoneNumber2'] as String?,
      city: json['city'] as String?,
      streetAddress: json['streetAddress'] as String?,
      subCity: json['subCity'] as String?,
      email: json['email'] as String?,
      distance: (json['distance'] as num?)?.toDouble() ?? 0,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_PharmacyToJson(_$_Pharmacy instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
      'phoneNumber1': instance.phoneNumber1,
      'phoneNumber2': instance.phoneNumber2,
      'city': instance.city,
      'streetAddress': instance.streetAddress,
      'subCity': instance.subCity,
      'email': instance.email,
      'distance': instance.distance,
      'images': instance.images,
    };
