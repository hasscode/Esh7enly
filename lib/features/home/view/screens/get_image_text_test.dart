import 'dart:io';
import 'package:esh7nly/features/home/view/controller/pick%20image%20cubit/pick_image_cubit.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:esh7nly/features/home/view/controller/get%20text%20from%20image%20OCR%20cubit/get_text_from_image_cubit.dart';
import 'package:esh7nly/features/home/view/controller/get%20text%20from%20image%20OCR%20cubit/get_text_from_image_state.dart';
import 'package:esh7nly/features/home/view/widgets/get_text_from_image_button.dart';
import 'package:esh7nly/features/home/view/widgets/text_from_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/pick_image_widget.dart';


class GetImageTextTest extends StatelessWidget {
   GetImageTextTest({super.key});
final TextEditingController getTextController =TextEditingController();
 File? pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Tal2a',style: TextStyle(fontWeight: FontWeight.bold),),

      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff87858F)),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: PickImageWidget(onPickedImage: (file){
                  pickedImage =file;
                },)
              ),
            ),
            ElevatedButton(
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
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextFromImageWidget()
            ),

          ],
        ),
      ),
    );
  }
}
