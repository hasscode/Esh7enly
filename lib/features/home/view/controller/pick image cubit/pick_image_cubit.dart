import 'dart:io';
import 'package:esh7nly/features/home/view/controller/pick%20image%20cubit/pick_image_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PickImageCubit extends Cubit<PickImageStates> {
  PickImageCubit() : super(PickImageInitial());

  Future<void> pickImageByCamera() async {
    emit(PickImageLoading());
    try {
      final filePicked =
          await ImagePicker().pickImage(source: ImageSource.camera) ;
      if (filePicked != null) {
        emit(PickImageSuccess((File(filePicked.path))));
      } else {
        emit(PickImageFailure("Image didn't selected"));
      }
    } on Exception catch (e) {
      emit(PickImageFailure(e.toString()));
    }
  }

  Future<void> pickImageByGallery() async {
    emit(PickImageLoading());
    try {
      final  filePicked =
      await ImagePicker().pickImage(source: ImageSource.gallery);
      if (filePicked != null) {
        emit(PickImageSuccess(File(filePicked.path)));
      } else {
        emit(PickImageFailure("Image didn't selected"));
      }
    } on Exception catch (e) {
      emit(PickImageFailure(e.toString()));
    }
  }
}
