import 'dart:io';

import 'package:esh7nly/features/home/view/widgets/pick_image_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/pick image cubit/pick_image_cubit.dart';
import '../controller/pick image cubit/pick_image_states.dart';
class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key,required this.onPickedImage});
 final Function(File) onPickedImage;
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        PickImageButtonsWidget(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<PickImageCubit,PickImageStates>(

              builder: (context,state){
                if(state is PickImageLoading){
                  return Center(child: SizedBox( child: CircularProgressIndicator()));
                }
                else if(state is PickImageFailure){
                  return SizedBox(width: 200,height: 200, child: Text(state.errMessage));
                }
                else if (state is PickImageSuccess){
                  onPickedImage(state.image);
                  return Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(state.image),
                      ),
                    ),
                  );
                }
                return SizedBox(width: 200,height: 200, child: Center(child: Text('Get your image',style: TextStyle(fontSize: 25),)));

              }


          ),
        ),
      ],
    );
  }
}
