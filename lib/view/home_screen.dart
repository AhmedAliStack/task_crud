import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task_crud/models/cat_facts/cat_facts.dart';
import 'package:task_crud/viewmodels/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = Provider.of<HomeViewModel>(context, listen: false);
    return _buildHomeScreen(context, viewModel);
  }

  AppBar _buildAppBar() => AppBar(
        title: const Text("Task"),
      );

  Widget _buildHomeScreen(BuildContext context, HomeViewModel viewModel) =>
      Scaffold(
        appBar: _buildAppBar(),
        body: Consumer<HomeViewModel>(
          builder: (_, viewModel, __) => viewModel.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: viewModel.factsModel.length,
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        CatFacts catFact = viewModel.factsModel[index];
                        return Card(
                          child: ListTile(
                            title: Text(catFact.user ?? "Empty"),
                            subtitle: Text(catFact.text ?? "Empty"),
                          ),
                        );
                      }),
                ),
        ),
      );
}
