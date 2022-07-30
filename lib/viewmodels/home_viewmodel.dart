import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';

import '../api_controller/api_controller.dart';
import '../models/cat_facts.dart';
import '../models/cat_facts_object.dart';
import '../utils/utils.dart';

class HomeViewModel extends ChangeNotifier {

  HomeViewModel(){
  }
}