import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_crud/viewmodels/read_viewmodel.dart';

import '../models/cat_facts.dart';

class TestRead extends StatelessWidget {
  const TestRead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReadViewModel viewModel = context.read<ReadViewModel>();
    return _buildReadScreen(context, viewModel);
  }

  AppBar _buildAppBar() => AppBar(
        title: const Text("Read"),
      );

  Widget _buildReadScreen(BuildContext context, ReadViewModel viewModel) =>
      Scaffold(
        appBar: _buildAppBar(),
        body: Consumer<ReadViewModel>(
            builder: (_, vm, __) => vm.isLoading
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
                              title: Text(catFact.tags?[0] ?? "Empty"),
                              subtitle: Text(catFact.createdAt ?? "Empty"),
                            ),
                          );
                        }),
                  )),
      );
}
