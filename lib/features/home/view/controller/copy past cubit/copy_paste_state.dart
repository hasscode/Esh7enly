abstract class CopyPasteState {}

class CopyPasteInitial extends CopyPasteState {}

class PasteLoading extends CopyPasteState {}

class PasteSuccess extends CopyPasteState {
  String text;
  PasteSuccess(this.text);
}

class PasteFailure extends CopyPasteState {
  String errMessage;
  PasteFailure(this.errMessage);
}

class CopyLoading extends CopyPasteState {}

class CopySuccess extends CopyPasteState {}

class CopyFailure extends CopyPasteState {
  String errMessage;
  CopyFailure(this.errMessage);
}
