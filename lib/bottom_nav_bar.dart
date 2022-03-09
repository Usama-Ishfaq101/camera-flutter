import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar(
      {Key? key,
      required this.initializeControllerFuture,
      required this.controller})
      : super(key: key);
  late Future<void> initializeControllerFuture;
  late CameraController controller;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        color: Colors.teal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () {},
              //open gallery here on click
              icon: const Icon(Icons.image),
            ),
            GestureDetector(
              onTap: () async {
                // Take the Picture in a try / catch block. If anything goes wrong,
                // catch the error.
                try {
                  // Ensure that the camera is initialized.
                  await widget.initializeControllerFuture;

                  // Attempt to take a picture and get the file `image`
                  // where it was saved.
                  final image = await widget.controller.takePicture();

                  // If the picture was taken, display it on a new screen.
                  // await Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => DisplayPictureScreen(
                  //       // Pass the automatically generated path to
                  //       // the DisplayPictureScreen widget.
                  //       imagePath: image.path,
                  //     ),
                  //   ),
                  // );
                } catch (e) {
                  // If an error occurs, log the error to the console.
                  // print(e);
                }
              },
              //take image using this.
              child: Container(
                height: 70,
                width: 70,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0xFF0F6765),
                ),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFF0A2D2C),
                  ),
                  child: const SizedBox(
                    width: 1,
                    height: 1,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {}, //show previous saved photos here
              child: IconButton(
                iconSize: 50,
                onPressed: () {}, //open all previos images from here
                //curently hardedcoded image later use first from list of all images previously saved
                icon: Image(
                  image: AssetImage('asset/galleryimage.png'),
                ),
              ),
            )
          ],
        ));
  }
}
