import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_firebase/view_model/main_view_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    MainViewModel viewModel = Provider.of<MainViewModel>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Karakterler"),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          viewModel.openAddCharacterPage(context);
        },
      ),
    );
  }

  Widget _buildBody() {
    return Consumer<MainViewModel>(
      builder: (context, viewModel, child) => ListView.builder(
        itemCount: viewModel.characters.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(viewModel.characters[index].name),
            subtitle: Text(viewModel.characters[index].gender),
          );
        },
      ),
    );
  }
}
