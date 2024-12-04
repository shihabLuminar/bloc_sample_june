part of 'color_bloc.dart';

class ColorEvent {}

class OnColorChangedEvent extends ColorEvent {
  Color newColor;
  OnColorChangedEvent({required this.newColor});
}
