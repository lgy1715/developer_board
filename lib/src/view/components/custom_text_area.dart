import 'package:flutter/material.dart';

class CustomTextFormArea extends StatelessWidget {

  final String hint;
  final funValidator;

  const CustomTextFormArea({required this.hint, required this.funValidator});

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        maxLines: 20,
        validator: funValidator,
        decoration: InputDecoration(
            hintText: "$hint",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )
        ),


      ),
    );
  }
}
