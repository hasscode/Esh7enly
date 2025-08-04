abstract  class GetTextFromImageState{}
 class GetTextFromImageInitial extends GetTextFromImageState{}
 class GetTextFromImageLoading extends GetTextFromImageState{}
 class GetTextFromImageFailure extends GetTextFromImageState{
  String errMessage;
  GetTextFromImageFailure(this.errMessage);
 }
 class GetTextFromImageSuccess extends GetTextFromImageState{
  String text;
  GetTextFromImageSuccess(this.text);
 }