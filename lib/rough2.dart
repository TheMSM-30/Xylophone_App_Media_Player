import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class rough2 extends StatelessWidget{
  const rough2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Rough Page'),
      ),
      body: Column(
        children: [
          Container(

          ),
          SliderTheme(data: data, child: child),
          Slider(value: value, onChanged: onChanged)
        ],
      ),
    );
  }

}