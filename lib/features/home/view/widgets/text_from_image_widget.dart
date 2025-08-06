import 'package:esh7nly/features/home/view/controller/copy%20past%20cubit/copy_paste_cubit.dart';
import 'package:esh7nly/features/home/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../controller/get text from image OCR cubit/get_text_from_image_cubit.dart';
import '../controller/get text from image OCR cubit/get_text_from_image_state.dart';
class TextFromImageWidget extends StatefulWidget {
    TextFromImageWidget({super.key});

  @override
  State<TextFromImageWidget> createState() => _TextFromImageWidgetState();
}

class _TextFromImageWidgetState extends State<TextFromImageWidget> {
 final textEditingController= TextEditingController();

@override
  void dispose() {
  textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocListener<GetTextFromImageCubit, GetTextFromImageState>(
          listener: (context, state) {
            if (state is GetTextFromImageSuccess) {
              textEditingController.text = state.text;

            }
          },
          child: BlocBuilder<GetTextFromImageCubit, GetTextFromImageState>(
            builder: (context, state) {
              if (state is GetTextFromImageLoading) {
                return CircularProgressIndicator();
              } else if (state is GetTextFromImageFailure) {
                return CustomTextFormField(
                  textEditingController: textEditingController,
                  readOnly: true,
                  hintText: state.errMessage,
                );
              }
              return CustomTextFormField(
                textEditingController: textEditingController,
                readOnly: false,
                hintText: 'Press extract to get the text',
              );
            },
          ),
        )
        ,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: (){
              if (textEditingController.text != null) {
                FlutterPhoneDirectCaller.callNumber(textEditingController.text!);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("please pick image first")),
                );
              }
            }, icon: Icon(Icons.phone)),
            IconButton(onPressed: (){
              if (textEditingController.text != null) {
                BlocProvider.of<CopyPasteCubit>(context).copy(textEditingController.text!);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("please pick image first")),
                );
              }
            }, icon: Icon(Icons.copy_outlined)),
          ],
        ),
      ],
    );
  }
}


