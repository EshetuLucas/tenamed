import 'package:freezed_annotation/freezed_annotation.dart';
part 'pharmacy_model.freezed.dart';
part 'pharmacy_model.g.dart';

@freezed
class Pharmacy with _$Pharmacy {
  Pharmacy._();
  factory Pharmacy({
    required double lat,
    required double lng,
    required String name,
    required String phoneNumber1,
    String? phoneNumber2,
    String? city,
    String? streetAddress,
    String? subCity,
    String? email,
    @Default(0) double distance,
    @Default([]) List<String> images,
  }) = _Pharmacy;

  factory Pharmacy.fromJson(Map<String, dynamic> json) =>
      _$PharmacyFromJson(json);
}
