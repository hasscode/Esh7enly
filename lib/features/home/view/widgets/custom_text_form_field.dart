import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,required this.textEditingController,required this.readOnly,required this.hintText});
final TextEditingController textEditingController ;
 final bool readOnly;
 final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(

readOnly:readOnly ,
      controller: textEditingController,
      maxLines: 4,
      decoration: InputDecoration(
        hintText: hintText,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xff87858F)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xff87858F)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xff87858F)),
        ),

      ),

    );
  }
}
