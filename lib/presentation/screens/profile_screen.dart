import 'package:fin_glow/presentation/bloc/bloc/profile_bloc.dart';
import 'package:fin_glow/presentation/bloc/event/profile_event.dart';
import 'package:fin_glow/presentation/bloc/state/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fin_glow/domain/models/profile_model.dart';
import 'package:fin_glow/presentation/widgets/custom_app_bar.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class IconDataConverter {
  static IconData getIconFromString(String iconString) {
    switch (iconString) {
      case "Bootstrap.person":
        return Bootstrap.person;
      case "Bootstrap.file-text":
        return Bootstrap.file_text;
      case "Bootstrap.lock":
        return Bootstrap.lock;
      case "Bootstrap.credit-card":
        return Bootstrap.credit_card;
      case "Bootstrap.map":
        return Bootstrap.map;
      case "Bootstrap.eye":
        return Bootstrap.eye;
      case "Bootstrap.bell":
        return Bootstrap.bell;
      default:
        return Icons.help; // Ícono por defecto
    }
  }
}

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
    context.read<ProfileBloc>().add(
        FetchProfileOptions()); // Asegúrate de que FetchProfileOptions esté definido
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
                  const SizedBox(height: 20),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state is ProfileLoading) {
                        return const CircularProgressIndicator();
                      } else if (state is ProfileError) {
                        return Text('Error: ${state.message}');
                      } else if (state is ProfileLoaded) {
                        if (state.profileOptions.isEmpty) {
                          return const Text('No hay opciones disponibles.');
                        }

                        return Column(
                          children: state.profileOptions.map((option) {
                            return _buildProfileOption(option);
                          }).toList(),
                        );
                      }

                      return Container();
                    },
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

  Widget _buildProfileOption(ProfileOption option) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(IconDataConverter.getIconFromString(option.icon),
                  color: Colors.white), // Conversión del icono
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    option.title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    option.subtitle,
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
