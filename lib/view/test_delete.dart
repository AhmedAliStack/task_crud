import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_crud/viewmodels/delete_viewmodel.dart';

import '../models/cat_facts.dart';

class TestDelete extends StatelessWidget {
  const TestDelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeleteViewModel viewModel =
    Provider.of<DeleteViewModel>(context, listen: false);
    return _buildUpdateScreen(context, viewModel);
  }

  AppBar _buildAppBar() =>
      AppBar(
        title: const Text("Update"),
      );

  Widget _buildUpdateScreen(BuildContext context, DeleteViewModel viewModel) =>
      Scaffold(
        appBar: _buildAppBar(),
        body: Consumer<DeleteViewModel>(
          builder: (_, vm, __) => vm.isLoading ? const Center(child: CircularProgressIndicator(),): SizedBox(
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
                      trailing: GestureDetector(child: const Icon(Icons.delete,color: Colors.red,),onTap: (){
                        vm.deleteIndex(catFact.id!);
                      },),
                    ),
                  );
                }),
          ),
        ),
      );
}
