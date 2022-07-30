import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_crud/viewmodels/update_viewmodel.dart';

import '../models/cat_facts.dart';

class TestUpdate extends StatelessWidget {
  const TestUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UpdateViewModel viewModel =
    Provider.of<UpdateViewModel>(context, listen: false);
    return _buildUpdateScreen(context, viewModel);
  }

  AppBar _buildAppBar() =>
      AppBar(
        title: const Text("Update"),
      );

  Widget _buildUpdateScreen(BuildContext context, UpdateViewModel viewModel) =>
      Scaffold(
        appBar: _buildAppBar(),
        body: Consumer<UpdateViewModel>(
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
                  return GestureDetector(
                    onTap: (){
                      showDialog(context: context, builder: (context)=>dialogBody(context,vm,catFact.id));
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(catFact.tags?[0] ?? "Empty"),
                        subtitle: Text(catFact.createdAt ?? "Empty"),
                      ),
                    ),
                  );
                }),
          ),
        ),
      );

  Widget dialogBody(BuildContext context,UpdateViewModel vm,String? id) =>
      AlertDialog(
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    onChanged: (value) {
                      vm.updateIndexName(value);
                    },
                    decoration: const InputDecoration(label: Text("Name")),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(onPressed: () {
                    vm.updateCurrentIndex(id!,(){
                      Navigator.pop(context);
                    });
                  }, child: const Text("Update"))
                ],
              ),
            ],
          ),
        ),
      );
}
