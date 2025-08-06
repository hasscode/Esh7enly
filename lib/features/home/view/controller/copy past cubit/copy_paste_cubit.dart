import 'package:esh7nly/features/home/view/controller/copy%20past%20cubit/copy_paste_state.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CopyPasteCubit extends Cubit<CopyPasteState> {
  CopyPasteCubit() : super(CopyPasteInitial());

  void copy(String value) {
    emit(CopyLoading());
    try {
      final val = ClipboardData(text: value);
      Clipboard.setData(val);

      emit(CopySuccess());
    } on Exception catch (e) {
      emit(CopyFailure(e.toString()));
    }
  }

  paste() async {
    emit(PasteLoading());
    try {
      final val = await Clipboard.getData('text/plain');
      if (val != null) {
        emit(PasteSuccess(val.text!));
      }
    } on Exception catch (e) {
      emit(PasteFailure(e.toString()));
    }
  }
}
