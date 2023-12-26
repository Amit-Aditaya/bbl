// import 'dart:io';
// import 'dart:isolate';

// import 'package:image/image.dart';

// class ImageDecodeParam {
//   final File file;
//   final SendPort sendPort;
//   ImageDecodeParam(this.file, this.sendPort);
// }

// void decodeIsolate(ImageDecodeParam param) {
//   // Read an image from file (webp in this case).
//   // decodeImage will identify the format of the image and use the appropriate
//   // decoder.
//   var image = decodeImage(param.file.readAsBytesSync())!;
//   // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
//   var thumbnail = copyResize(image, width: 120);
//   param.sendPort.send(thumbnail);
// }
