import 'dart:io';
import 'package:esh7nly/features/home/view/controller/pick%20image%20cubit/pick_image_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
class PickImageCubit extends Cubit<PickImageStates> {
  PickImageCubit() : super(PickImageInitial());

  Future<void> pickImageByCamera() async {
    emit(PickImageLoading());
    try {
      final filePicked =
          await ImagePicker().pickImage(  source: ImageSource.camera,
            imageQuality: 100,
            preferredCameraDevice: CameraDevice.rear,
            maxWidth: 2048,
            maxHeight: 2048,) ;
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



  File preprocessImage(File file) {
    final bytes = file.readAsBytesSync();
    img.Image? image = img.decodeImage(bytes);

    if (image != null) {
      final grayscale = img.grayscale(image); // تدرج رمادي
      final contrasted = img.adjustColor(grayscale, contrast: 1.2); // زيادة تباين


      final result = File(file.path)..writeAsBytesSync(img.encodeJpg(contrasted));
      return result;
    }
    return file;
  }
}
