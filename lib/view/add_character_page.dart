import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_firebase/view/common/common_text_field.dart';
import 'package:rick_and_morty_firebase/view_model/add_character_view_model.dart';

class AddCharacterPage extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();

  AddCharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Karakter Ekle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                _buildEmailTextField(),
                SizedBox(height: 16),
                _buildPasswordTextField(),
              ],
            ),
            _buildAddCharacterButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return CommonTextField(
      controller: _nameController,
      label: "Name",
    );
  }

  Widget _buildPasswordTextField() {
    return CommonTextField(
      controller: _genderController,
      label: "Gender",
    );
  }

  Widget _buildAddCharacterButton(BuildContext context) {
    AddCharacterViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return ElevatedButton(
      child: Text("Karakter Ekle"),
      onPressed: () {
        viewModel.addCharacter(
          context,
          _nameController.text.trim(),
          _genderController.text.trim(),
        );
      },
    );
  }

}
