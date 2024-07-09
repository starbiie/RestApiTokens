import 'dart:convert';

import 'package:apitokens/Api/api.dart';
import 'package:apitokens/model/model_user.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../model/products_model.dart';

class ProductServices{
  final client = http.Client();
  Future<ProductsModel?>getAllProducts()async{
    SharedPreferences _pref =await SharedPreferences.getInstance();
    final token = _pref.get('token');
    try{
      final response = await client.get(Uri.parse('${Api().baseUrl}${Api().allProducts}'),

      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${token}',
      },


      );
      if(response.statusCode == 200){
        final responseBody= jsonDecode(response.body);
        final ProductsModel products = ProductsModel.fromJson(responseBody);
        return products;
      }


    }catch(error){
      print(error);
    }
  }
}