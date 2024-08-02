import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePictureWidget extends StatefulWidget {
  const ProfilePictureWidget({super.key});

  @override
  ProfilePictureWidgetState createState() => ProfilePictureWidgetState();
}

class ProfilePictureWidgetState extends State<ProfilePictureWidget> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  Future<void> _pickImage() async {
    setState(() {
      _isLoading = true;
    });

    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: _image != null
                  ? FileImage(_image!)
                  : const AssetImage('assets/default_profile.png')
                      as ImageProvider,
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _image == null
                      ? const Icon(Icons.add_a_photo, size: 30)
                      : null,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
