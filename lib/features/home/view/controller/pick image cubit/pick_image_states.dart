import 'dart:io';

abstract class PickImageStates{}
 class PickImageInitial extends PickImageStates{}
 class PickImageLoading extends PickImageStates{}
 class PickImageFailure extends PickImageStates{
 String errMessage;
 PickImageFailure(this.errMessage);
 }
 class PickImageSuccess extends PickImageStates{
 File image;
 PickImageSuccess(this.image);

 }