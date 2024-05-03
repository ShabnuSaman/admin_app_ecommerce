import 'package:bloc_login_add_product/controller/bloc/addProduct/bloc/add_product_bloc.dart';
import 'package:bloc_login_add_product/utlis/constants.dart';
import 'package:bloc_login_add_product/view/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProduct extends StatelessWidget {
  AddProduct({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  // final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final addproductBloc = BlocProvider.of<AddProductBloc>(context);
    return BlocListener<AddProductBloc, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccessfulState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      nameController.clear();
                      descriptionController.clear();
                      priceController.clear();
                      
                    },
                    child: Text("Done"))
              ],
              title: Text("Successfully added"),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text("Add Product"),
        ),
        body: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldWidget(
                    controller: nameController, hintText: "product name"),
                KHeight10,
                TextFieldWidget(
                    controller: descriptionController, hintText: "description"),
                KHeight10,
                TextFieldWidget(controller: priceController, hintText: "price"),
                KHeight10,
                ElevatedButton(
                  onPressed: () {
                    addproductBloc.add(AddProductSuccessfulEvent(
                        name: nameController.text.toString(),
                        description: descriptionController.text.toString(),
                        price: priceController.text.toString()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent),
                  child: const Text("Add product"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
