import 'package:dio/dio.dart';
import 'package:cenafood/models/food_category.dart';
import 'package:cenafood/shared/value.dart';
import 'package:cenafood/utils/storage_util.dart';

class FoodCategoryRepository {
  static Future<List<FoodCategory>> getFoodCategories() async {
    String apiURL = apiBaseURL + '/categories';

    final String token = StorageUtil.readStorage('token');

    // final response = await Dio().get(
    //   apiURL,
    //   options: Options(
    //     followRedirects: false,
    //     validateStatus: (status) {
    //       return status! <= 500;
    //     },
    //     headers: {
    //       'Authorization': 'Bearer $token',
    //       'Accept': 'application/json',
    //       'Content-Type': 'application/json',
    //     },
    //   ),
    // );

    List foodCategories = []; //response.data['data'];

    return foodCategories.map((data) => FoodCategory.fromJson(data)).toList();
  }
}
