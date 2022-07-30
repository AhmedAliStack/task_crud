import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_crud/viewmodels/create_viewmodel.dart';

import '../models/cat_facts.dart';

class TestCreate extends StatelessWidget {
  const TestCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateViewModel viewModel =
        Provider.of<CreateViewModel>(context, listen: false);
    return _buildList(context, viewModel);
  }

  AppBar _buildAppBar() => AppBar(
    title: const Text("Create"),
  );

  Widget _buildList(BuildContext context, CreateViewModel viewModel) =>
      Scaffold(
        appBar: _buildAppBar(),
        body: Consumer<CreateViewModel>(
          builder: (_, vm, __) => vm.isLoading ? Center(child: CircularProgressIndicator(),): SizedBox(
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
                      title: Text(catFact.tags?[0] ?? "Empty"),
                      subtitle: Text(catFact.createdAt ?? "Empty"),
                    ),
                  );
                }),
          ),
        ),
      );
}
