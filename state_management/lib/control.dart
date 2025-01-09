import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

class ProductController extends GetxController {
  var products = <Data>[].obs; // Observable list for products
  var isLoading = true.obs;    // Observable for loading state

  @override
  void onInit() {
    super.onInit();
    getData(); // Fetch data when the controller initializes
  }

  Future<void> getData() async {
    try {
      String url = "https://crud.teamrabbil.com/api/v1/ReadProduct";
      Uri uri = Uri.parse(url);
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        ApiData apiData = ApiData.fromJson(json);

        if (apiData.status == 'success') {
          products.value = apiData.data ?? [];
        }
      }
    } catch (e) {
      debugPrint("Error fetching data: $e");
    } finally {
      isLoading.value = false; // Update loading state
    }
  }
}
