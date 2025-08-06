import 'dart:io';
import 'package:esh7nly/features/home/view/controller/get%20text%20from%20image%20OCR%20cubit/get_text_from_image_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class GetTextFromImageCubit extends Cubit<GetTextFromImageState>{
  GetTextFromImageCubit() :super (GetTextFromImageInitial());

  Future<void>getTextFromImage(File image)async{
    emit(GetTextFromImageLoading());
try {
  final inputImage = InputImage.fromFile(image);
  final textRecognizer = TextRecognizer();
  final recognizedText = await textRecognizer.processImage(inputImage);
  await textRecognizer.close();

  emit(GetTextFromImageSuccess(recognizedText.text));
} on Exception catch (e) {
emit(GetTextFromImageFailure(e.toString()));
}

  }
}
