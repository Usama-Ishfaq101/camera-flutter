import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';
import 'menu_bar_camera.dart';

// A screen that allows users to take a picture using a given camera.
class MyTakePictureScreen extends StatefulWidget {
  const MyTakePictureScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final List<CameraDescription> camera;

  @override
  MyTakePictureScreenState createState() => MyTakePictureScreenState();
}

class MyTakePictureScreenState extends State<MyTakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // By defalut we are using front camera to take picture rear camera is at 0th index
      widget.camera.elementAt(1),
      // Define the resolution to use.
      ResolutionPreset.high,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .95,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the Future is complete, display the preview.
                  return CameraPreview(_controller);
                } else {
                  // Otherwise, display a loading indicator.
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          IconButton(
            onPressed: () {},
            //go to home Page on click
            icon: const Icon(
              Icons.cancel,
              color: Colors.teal,
              size: 40,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const MenuBarCamera(),
                BottomNavBar(
                    initializeControllerFuture: _initializeControllerFuture,
                    controller: _controller),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
