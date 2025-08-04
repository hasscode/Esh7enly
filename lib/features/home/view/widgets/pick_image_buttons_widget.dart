import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/pick image cubit/pick_image_cubit.dart';
class PickImageButtonsWidget extends StatelessWidget {
  const PickImageButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        IconButton(
          onPressed: () {
            BlocProvider.of<PickImageCubit>(context).pickImageByCamera();
          },
          icon: Icon(Icons.camera_alt, color: Colors.black),
        ),
        IconButton(
          onPressed: () {
            BlocProvider.of<PickImageCubit>(context).pickImageByGallery();
          },
          icon: Icon(
            Icons.image_search_rounded,
            color: Colors.black,
          ),
        ),
      ],

    );
  }
}
