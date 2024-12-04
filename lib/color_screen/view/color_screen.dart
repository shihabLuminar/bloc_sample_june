import 'package:bloc_sample_june/color_screen/bloc/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorScreen extends StatelessWidget {
  const ColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> myColorList = [
      Colors.red,
      Colors.blue,
      Colors.black,
      Colors.orange,
      Colors.green,
      Colors.yellow,
      Colors.purple,
    ];
    return BlocBuilder<ColorBloc, ColorState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.scaffoldBg,
          body: Center(
            child: ListView.separated(
                padding: EdgeInsets.all(20),
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        // write the logic to update color
                        context.read<ColorBloc>().add(
                            OnColorChangedEvent(newColor: myColorList[index]));
                      },
                      child: Container(
                        color: myColorList[index],
                        height: 50,
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                itemCount: myColorList.length),
          ),
        );
      },
    );
  }
}
