import 'package:esh7nly/features/home/view/controller/get%20text%20from%20image%20OCR%20cubit/get_text_from_image_cubit.dart';
import 'package:esh7nly/features/home/view/controller/pick%20image%20cubit/pick_image_cubit.dart';
import 'package:esh7nly/features/home/view/screens/get_image_text_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const TextDetector());
}

class TextDetector extends StatelessWidget {
  const TextDetector({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>PickImageCubit()),
      BlocProvider(create: (context)=>GetTextFromImageCubit())
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GetImageTextTest(),
      ),
    );
  }
}
