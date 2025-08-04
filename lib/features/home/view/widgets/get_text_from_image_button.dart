import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/get text from image OCR cubit/get_text_from_image_cubit.dart';
class GetTextFromImageButton extends StatelessWidget {
 GetTextFromImageButton({super.key,required this.pickedImage});
File? pickedImage;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (pickedImage != null) {
          BlocProvider.of<GetTextFromImageCubit>(context).getTextFromImage(pickedImage!);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("please pick image first")),
          );
        }
      },
      child: Text('Extract'),
    );
  }
}
