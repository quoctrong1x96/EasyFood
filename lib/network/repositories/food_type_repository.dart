import 'package:dio/dio.dart';
import 'package:cenafood/models/food_type.dart';
import 'package:cenafood/shared/value.dart';
import 'package:cenafood/utils/storage_util.dart';

class FoodTypeRepository {
  static Future<List<FoodType>> getFoodTypes() async {
    String apiURL = apiBaseURL + '/food-types';

    final String token = StorageUtil.readStorage('token');

    final response = await Dio().get(
      apiURL,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    List foodTypes = response.data['data'];

    return foodTypes.map((data) => FoodType.fromJson(data)).toList();
  }
}
