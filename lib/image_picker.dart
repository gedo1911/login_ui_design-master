

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  PickImage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PickImageState createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  File profilePicture;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Please select the image of the burn',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
        onPressed: () async {
          await selectPicture();

        },
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20, left: 5, right: 5),
        child: Column(
          children: [
            profilePicture == null
                ? Container()
                : Container(
              width: deviceSize.width,
              height: deviceSize.height * 0.28,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(profilePicture),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> selectPicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      profilePicture = File(image.path);
    });
  }
}