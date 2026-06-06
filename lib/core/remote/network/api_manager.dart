import 'package:dio/dio.dart';
import 'package:islami/ui/home/tabs/radio_tab/models/radio_model.dart';

import '../../../ui/home/tabs/radio_tab/models/reciters_model.dart';
import 'end_points.dart';

abstract class ApiManager {
  static final Dio dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));

  static Future<RadioModel> getRadios() async {
    final response = await dio.get(EndPoints.radioEndPoint);
    if (response.statusCode == 200) {
      return RadioModel.fromJson(response.data);
    } else {
      throw Exception("Failed to load data");
    }
  }

  static Future<RecitersModel> getReciters() async {
    final response = await dio.get(EndPoints.recitersEndPoint );
    if (response.statusCode == 200) {
      return RecitersModel.fromJson(response.data);
    } else {
      throw Exception("Failed to load data");
    }
  }
}
