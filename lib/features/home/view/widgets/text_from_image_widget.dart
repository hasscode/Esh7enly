import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/get text from image OCR cubit/get_text_from_image_cubit.dart';
import '../controller/get text from image OCR cubit/get_text_from_image_state.dart';
class TextFromImageWidget extends StatelessWidget {
   const TextFromImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xff87858F))
      ),
      child:  Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<GetTextFromImageCubit,GetTextFromImageState>(builder:(context,state) {
          if(state is GetTextFromImageLoading){
            return Center(child: CircularProgressIndicator());
          }
          else if (state is GetTextFromImageFailure){
            return Center(child: Text(state.errMessage));
          }
          else if (state is GetTextFromImageSuccess){
            return Text(state.text);
          }
          return Center(child: Text('Press extract to extract text form the image'));

        }
        ),
      ),
    );
  }
}
// TextFormField(
// controller: textEditingController,
// maxLines: 5,
// decoration: InputDecoration(
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(12),
// borderSide: BorderSide(color: Color(0xff87858F)),
// ),
// disabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(12),
// borderSide: BorderSide(color: Color(0xff87858F)),
// ),
// enabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(12),
// borderSide: BorderSide(color: Color(0xff87858F)),
// ),
//
// ),
//
// )