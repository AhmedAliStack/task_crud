import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_crud/utils/utils.dart';
import 'package:task_crud/view/test_create.dart';
import 'package:task_crud/view/test_read.dart';
import 'package:task_crud/view/test_update.dart';
import 'package:task_crud/viewmodels/home_viewmodel.dart';

import '../models/cat_facts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel =
        Provider.of<HomeViewModel>(context, listen: false);
    return _buildHomeScreen(context, viewModel);
  }

  AppBar _buildAppBar() => AppBar(
        title: const Text("Task"),
      );

  Widget _buildHomeScreen(BuildContext context, HomeViewModel viewModel) =>
      Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Utils.openScreen(context, const TestCreate());
                  },
                  child: const Text("CREATE")),
              ElevatedButton(
                  onPressed: () {
                    Utils.openScreen(context, const TestRead());
                  }, child: const Text("READ")),
              ElevatedButton(
                  onPressed: () {
                    Utils.openScreen(context, const TestUpdate());
                  }, child: const Text("UPDATE")),
              ElevatedButton(
                  onPressed: () {}, child: const Text("DELETE")),
            ],
          ),
        ),
      );
}
