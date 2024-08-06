import 'package:fin_glow/domain/models/login_model.dart';
import 'package:fin_glow/domain/repositories/login_repository.dart';
import 'package:fin_glow/domain/usecases/login_usecase.dart';
import 'package:fin_glow/presentation/bloc/bloc/login_bloc.dart';
import 'package:fin_glow/presentation/bloc/event/login_event.dart';
import 'package:fin_glow/presentation/bloc/state/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import '../widgets/login_button.dart';
import '../widgets/divider_text.dart';
import '../widgets/custom_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;
  String? phoneError;
  String? passwordError;

  @override
  Widget build(BuildContext context) {
    final loginUseCase = LoginUseCase(LoginRepository());

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
            child: Center(
              child: BlocProvider(
                create: (context) => LoginBloc(loginUseCase),
                child: BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (state is LoginError)
                              const Chip(
                                backgroundColor: Colors.redAccent,
                                label: Text(
                                  'Teléfono o contraseña incorrectos',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            buildForm(context, state),
                            if (state is LoginLoading)
                              const CircularProgressIndicator(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context, LoginState state) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: const EdgeInsets.only(top: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenido a FinGlow!',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const CustomText(
              text: 'Tu éxito financiero comienza hoy.',
              size: 15,
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/logo_vertical.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: phoneController,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Teléfono',
                labelStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.white54,
                ),
                filled: true,
                fillColor: Color.fromARGB(105, 4, 38, 92),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              maxLength: 10,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  setState(() {
                    phoneError = 'Este campo no puede estar vacío';
                  });
                  return '';
                } else {
                  setState(() {
                    phoneError = null;
                  });
                }
                if (value.length < 10) {
                  return 'El teléfono debe tener 10 dígitos';
                }
                if (!RegExp(r'^\d+$').hasMatch(value)) {
                  return 'Solo se permiten números';
                }
                return null;
              },
            ),
            if (phoneError != null)
              Text(
                phoneError!,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                labelText: 'Contraseña',
                labelStyle: const TextStyle(
                  fontSize: 13,
                  color: Colors.white54,
                ),
                filled: true,
                fillColor: const Color.fromARGB(105, 4, 38, 92),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide.none,
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.red),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              obscureText: _obscurePassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  setState(() {
                    passwordError = 'Este campo no puede estar vacío';
                  });
                  return '';
                } else {
                  setState(() {
                    passwordError = null;
                  });
                }
                if (value.length < 6) {
                  return 'La contraseña debe tener al menos 6 caracteres';
                }
                return null;
              },
            ),
            if (passwordError != null)
              Text(
                passwordError!,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            const SizedBox(height: 30),
            LoginButton(
              onPressed: () {
                Logger logger = Logger();
                if (phoneController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  final loginModel = LoginModel(
                    phone: phoneController.text,
                    password: passwordController.text,
                  );
                  logger.d(phoneController.text);
                  logger.d(passwordController.text);
                  BlocProvider.of<LoginBloc>(context)
                      .add(LoginSubmitEvent(loginModel));
                }
              },
            ),
            const SizedBox(height: 20),
            const CustomText(
              text: 'Recuperar Contraseña',
              size: 12,
            ),
            const SizedBox(height: 20),
            const DividerText(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: '¿Quieres usar la app de FinGlow?',
                  size: 12,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text(
                    'Abrir cuenta',
                    style: TextStyle(
                      color: Color.fromRGBO(34, 221, 187, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Icon(
              Icons.fingerprint,
              color: Colors.white,
              size: 45,
            ),
          ],
        ),
      ),
    );
  }
}
