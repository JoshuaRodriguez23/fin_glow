import 'package:fin_glow/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    setState(() {
      _isLoading = true;
    });
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profile_image_path');
    if (imagePath != null) {
      setState(() {
        _image = File(imagePath);
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _isLoading = true;
      });
      final imageFile = File(pickedFile.path);
      setState(() {
        _image = imageFile;
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_image_path', pickedFile.path);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color.fromRGBO(1, 19, 48, 1),
                Color.fromRGBO(4, 38, 92, 1),
              ],
              center: Alignment.center,
              radius: 1.0,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomAppBar(title: 'Tu perfil'),
                  const SizedBox(height: 20),
                  Container(
                    width: 350,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(76, 16, 57, 121),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: const Color(0xFF40A2F1),
                        width: 2,
                      ),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF40A2F1),
                          Color(0xFF103979),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: _pickImage,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: _image != null
                                      ? FileImage(_image!)
                                      : const AssetImage(
                                              'assets/images/icon_app.png')
                                          as ImageProvider,
                                ),
                                if (_isLoading)
                                  const Center(
                                      child: CircularProgressIndicator()),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Usuario',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Correo',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  _buildProfileOption(
                    title: 'Información personal',
                    subtitle:
                        'Información de tu identificación oficial\n y tu actividad fiscal.',
                    icon: Bootstrap.person,
                  ),
                  const SizedBox(height: 50),
                  _buildProfileOption(
                    title: 'Datos de tu cuenta',
                    subtitle: 'Datos que representan la cuenta.',
                    icon: Bootstrap.file_text,
                  ),
                  const SizedBox(height: 50),
                  _buildProfileOption(
                    title: 'Seguridad',
                    subtitle:
                        'Configuración necesaria para mantener\n a salvo tu cuenta.',
                    icon: Bootstrap.lock,
                  ),
                  const SizedBox(height: 50),
                  _buildProfileOption(
                    title: 'Tarjetas',
                    subtitle: 'Tarjetas guardadas en tu cuenta.',
                    icon: Bootstrap.credit_card,
                  ),
                  const SizedBox(height: 50),
                  _buildProfileOption(
                    title: 'Direcciones',
                    subtitle: 'Direcciones guardadas en tu cuenta.',
                    icon: Bootstrap.map,
                  ),
                  const SizedBox(height: 50),
                  _buildProfileOption(
                    title: 'Privacidad',
                    subtitle: 'Preferencias y control sobre tus datos.',
                    icon: Bootstrap.eye,
                  ),
                  const SizedBox(height: 50),
                  _buildProfileOption(
                    title: 'Comunicaciones',
                    subtitle: 'Elije qué tipo de información quieres recibir.',
                    icon: Bootstrap.bell,
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Icon(Bootstrap.arrow_right, color: Colors.white),
        ],
      ),
    );
  }
}
