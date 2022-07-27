import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:task_crud/models/cat_facts/cat_facts.dart';

import '../api_controller/api_controller.dart';
import '../models/cat_facts/cat_facts_object.dart';
import '../utils/utils.dart';

class HomeViewModel extends ChangeNotifier {

  HomeViewModel(){
    getCatFacts();
  }

  bool isLoading = false;
  List<CatFacts> factsModel = [];

  Future getCatFacts() async {
    Box box = await Hive.openBox('Box');
    isLoading = true;

    Response response = await ApiController().getData(url: "facts");
    final responseJson = jsonDecode(response.body);
    if(response.statusCode == 200){
      responseJson.forEach((element) {
        CatFacts catFacts = CatFacts.fromJson(element);
        box.put(catFacts.id, CatsFactsObject(catFacts.id ?? "0", catFacts.user ?? "0", catFacts.text ?? "0"));
        factsModel.add(catFacts);
      });
      Utils.showMsg("Database Updated");
    }else{
      Utils.showMsg("Something Went Wrong", error: true);
    }
    isLoading = false;
    notifyListeners();
  }
}