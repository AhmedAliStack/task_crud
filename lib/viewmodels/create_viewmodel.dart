import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';

import '../api_controller/api_controller.dart';
import '../models/cat_facts.dart';
import '../models/cat_facts_object.dart';
import '../utils/utils.dart';

class CreateViewModel extends ChangeNotifier {

  CreateViewModel(){
    getCatFacts();
  }
  Box<CatsFactsObject>? box;
  bool isLoading = false;
  List<CatFacts> factsModel = [];

  Future getCatFacts() async {
    box = await Hive.openBox('Box');
    isLoading = true;

    Response response = await ApiController().getData(url: "cats?tags=cute");
    final responseJson = jsonDecode(response.body);
    if(response.statusCode == 200){
      responseJson.forEach((element) {
        CatFacts catFacts = CatFacts.fromJson(element);
        box!.put(catFacts.id, CatsFactsObject(catFacts.id ?? "0", catFacts.tags?[0] ?? "0", catFacts.createdAt ?? "0"));
        factsModel.add(catFacts);
      });
      Utils.showMsg("Database Updated");
    }else{
      Utils.showMsg("Something Went Wrong", error: true);
    }
    isLoading = false;
    notifyListeners();

    if(Hive.isBoxOpen('Box')){
      box!.close();
    }
  }
}