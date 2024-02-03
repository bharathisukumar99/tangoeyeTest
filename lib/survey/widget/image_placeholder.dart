import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: const Color(0xffF6FCFF),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.blue,
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xffEAF7FF),
                radius: 30,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xffDAF1FF),
                  foregroundColor: Colors.blue,
                  child: Icon(Icons.photo_camera_outlined),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Click to Capture Image',
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}
