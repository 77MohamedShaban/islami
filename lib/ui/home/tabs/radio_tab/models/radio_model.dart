import 'package:json_annotation/json_annotation.dart';

part 'radio_model.g.dart';

@JsonSerializable()
class RadioModel {
  @JsonKey(name: "radios")
  final List<Radios?>? radios;

  RadioModel ({
    this.radios,
  });

  factory RadioModel.fromJson(Map<String, dynamic> json) {
    return _$RadioModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RadioModelToJson(this);
  }
}

@JsonSerializable()
class Radios {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "recent_date")
  final String? recentDate;

  Radios ({
    this.id,
    this.name,
    this.url,
    this.recentDate,
  });

  factory Radios.fromJson(Map<String, dynamic> json) {
    return _$RadiosFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RadiosToJson(this);
  }
}


