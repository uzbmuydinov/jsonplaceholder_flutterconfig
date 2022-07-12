import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsonplaceholder_flutterconfig/controller/create_controller.dart';
import 'package:jsonplaceholder_flutterconfig/views/itemOfTextField.dart';




class CreatePage extends StatefulWidget {
  static String id = "CreatePage";
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: (){
              Get.find<CreateController>().apiCreatePost(context);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body:GetBuilder<CreateController>(
        init: CreateController(),
        builder: (CreateController controller) => Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              texFormField(hintText: 'Title',controller: controller.titleController),
              texFormField(hintText: 'Body', controller: controller.bodyController),
            ],
          ),
        ),

      )
    );

  }
}
