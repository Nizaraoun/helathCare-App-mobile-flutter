// // Method to capture image from camera
//  import 'dart:js';

// import 'package:camera/camera.dart';
// import 'package:flutter/widgets.dart';
// import 'package:image_picker/image_picker.dart';
//  import 'dart:io';
// import 'package:flutter/material.dart';
//   Future<void> _captureImage() async {
//     final cameras = await availableCameras();
//     final firstCamera = cameras.first;
//     final imageFile = await Navigator.of(context as BuildContext).push(MaterialPageRoute(
//       builder: (context) => CameraScreen(camera: firstCamera),
//     ));

//     // if (imageFile != null) {
//     //   setState(() {
//     //     _imageFile = imageFile;
//     //   });
//     // }
//   }