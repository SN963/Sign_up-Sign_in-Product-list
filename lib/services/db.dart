import 'package:flutter/material.dart';
import '../model/http_exception.dart';
//for json
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DB {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;
  Timer? _signTimer;

  createUser(String phone, String city, String urlSegment) async {
    final url =
        "https://fruits-vegetables-basket-19e0d-default-rtdb.firebaseio.com/";

    try {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode(
              {'phone': phone, 'city': city, 'returnSecureToken': true}));
      final responseData = json.decode(response.body);
      //Httpexception to handle the errors that can happen and give me details about it
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));
      final prefs = await SharedPreferences.getInstance();
      String userData = json.encode({
        'token': _token,
        'userId': _userId,
        //toIso as those are strings but expiry isn't
        'expiryDate': _expiryDate!.toIso8601String(),
      });
      prefs.setString('userData', userData);
    } catch (e) {
      rethrow;
    }
  }

  updateUser() {}

  createCart() {}
}
