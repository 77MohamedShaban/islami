import 'package:json_annotation/json_annotation.dart';

part 'reciters_model.g.dart';

@JsonSerializable()
class RecitersModel {
  @JsonKey(name: "reciters")
  final List<Reciters?>? reciters;

  RecitersModel ({
    this.reciters,
  });

  factory RecitersModel.fromJson(Map<String, dynamic> json) {
    return _$RecitersModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RecitersModelToJson(this);
  }
}

@JsonSerializable()
class Reciters {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "letter")
  final String? letter;
  @JsonKey(name: "date")
  final String? date;
  @JsonKey(name: "moshaf")
  final List<Moshaf>? moshaf;

  Reciters ({
    this.id,
    this.name,
    this.letter,
    this.date,
    this.moshaf,
  });

  factory Reciters.fromJson(Map<String, dynamic> json) {
    return _$RecitersFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RecitersToJson(this);
  }
}

@JsonSerializable()
class Moshaf {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "rewaya_id")
  final int? rewayaId;
  @JsonKey(name: "server")
  final String? server;
  @JsonKey(name: "surah_total")
  final int? surahTotal;
  @JsonKey(name: "moshaf_type")
  final int? moshafType;
  @JsonKey(name: "surah_list")
  final String? surahList;

  Moshaf ({
    this.id,
    this.name,
    this.rewayaId,
    this.server,
    this.surahTotal,
    this.moshafType,
    this.surahList,
  });

  factory Moshaf.fromJson(Map<String, dynamic> json) {
    return _$MoshafFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MoshafToJson(this);
  }
}


