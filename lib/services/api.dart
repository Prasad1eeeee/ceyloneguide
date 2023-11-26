import 'dart:convert';

import 'package:ceyloneguide/equipments.dart';
import 'package:ceyloneguide/guide.dart';
//import 'package:ceyloneguide/home.dart';
import 'package:ceyloneguide/hotelmaneger.dart';
//import 'package:ceyloneguide/signup.dart';
import 'package:ceyloneguide/taxi.dart';
import 'package:ceyloneguide/traveler.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "http://localhost:2000/";
  
  static logindetais(context, Map udata) async {
    var url = Uri.parse("${baseUrl}login");
    try {
      final res = await http.post(url, body: udata);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        var userType = data['user']['UserType'];
        // =============================================
        if (userType == "Traveler") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TravelerPage(); // Replace with the new screen widget
              },
            ),
          );
        } else if (userType == "Guide") {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return GuideSupplierPage();
            //
          }));
          //
        } else if (userType == "Taxi Driver") {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TaxiSupplierPage();
          }));
          //
        } else if (userType == "Hotel Manager") {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HotelManagerPage();
          }));
          //
        } else if (userType == "Equipment Supplier") {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EquipmentSupplierPage();
          }));
        }
      } else {
        print("Fail:  ${res.statusCode} : ${res.body}");
        //
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
