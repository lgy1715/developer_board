import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:developer_board/src/screen/home.dart';
import 'package:developer_board/src/util/validator_util.dart';
import 'package:developer_board/src/view/components/custom_elevated_button.dart';
import 'package:developer_board/src/view/components/custom_text_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:developer_board/src/widget/image_box.dart';
import 'package:developer_board/src/shared/global.dart';
import 'package:developer_board/src/controller/feed_controller.dart';
import 'package:xfile/xfile.dart';
import '../../view/components/custom_text_form_field.dart';

class FeedCreate extends StatefulWidget {
  const FeedCreate({super.key});

  @override
  State<FeedCreate> createState() => _FeedCreateState();
}

class _FeedCreateState extends State<FeedCreate> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  var snackBar = SnackBar(content: Text('글은 비워둘 수 없습니다'));
  final _picker = ImagePicker();
  final FeedController feedController = Get.put(FeedController());
  int? tmpImg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('피드 작성'),
        actions: [
          IconButton(
              onPressed: () {
                String content = contentController.text;
                print("${content}");
                if (content.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }else{
                  feedController.feedCreate(content, tmpImg);
                }
              },
              icon: Icon(Icons.save)),
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CustomTextFormField(
                  funcontroller: titleController,
                  hint: "Title",
                  funValidator: validateTitle(),
                ),
                CustomTextFormArea(
                  funcontroller: contentController,
                  hint: "Content",
                  funValidator: validateContent(
                  ),
                ),
                CustomElevatedButton(text: "글쓰기",
                pageRoute: (){
                  if(_formKey.currentState!.validate()){
                    Navigator.push(context, MaterialPageRoute(builder: (content)=> const Home()));
                  }
                },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
