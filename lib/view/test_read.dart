import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_crud/viewmodels/read_viewmodel.dart';

import '../models/cat_facts.dart';

class TestRead extends StatelessWidget {
  const TestRead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReadViewModel viewModel =
        Provider.of<ReadViewModel>(context, listen: false);
    return _buildReadScreen(context, viewModel);
  }

  AppBar _buildAppBar() => AppBar(
    title: const Text("Read"),
  );

  Widget _buildReadScreen(BuildContext context, ReadViewModel viewModel) =>
      Scaffold(
        appBar: _buildAppBar(),
        body: Consumer<ReadViewModel>(
          builder: (_, vm, __) => vm.isLoading ? Center(child: CircularProgressIndicator(),): SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: vm.factsModel.length,
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  CatFacts catFact = vm.factsModel[index];
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
