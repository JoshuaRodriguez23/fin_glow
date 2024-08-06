import 'package:fin_glow/domain/models/register_model.dart';
import 'package:fin_glow/domain/repositories/register_repository.dart';
import 'package:fin_glow/domain/usecases/register_usecase.dart';
import 'package:fin_glow/presentation/bloc/bloc/register_bloc.dart';
import 'package:fin_glow/presentation/bloc/event/register_event.dart';
import 'package:fin_glow/presentation/bloc/state/register_state.dart';
import 'package:fin_glow/presentation/widgets/custom_text.dart';
import 'package:fin_glow/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  bool _acceptedTerms = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController rfcController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userRepository = RegisterRepositoryImpl();
    final submitUser = SubmitRegister(userRepository);

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
                create: (context) => RegisterBloc(submitUser),
                child: BlocConsumer<RegisterBloc, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterSuccess) {
                      Navigator.pushNamed(context, '/login');
                    }
                  },
                  builder: (context, state) {
                    if (state is RegisterInitial) {
                      return buildForm(context);
                    } else if (state is RegisterLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is RegisterError) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.message,
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 16),
                            buildForm(context),
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          margin: const EdgeInsets.only(top: 30.0),
          child: Form(
            key: _formKey, // Form key for validation
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.chevron_left, color: Colors.white),
                        SizedBox(width: 5),
                        Text(
                          'Volver',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  '¡Sé parte de FinGlow!',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Regístrate y da el primer paso hacia tu libertad financiera.',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/logo_vertical.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'IDENTIFÍCATE',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Ingresa los siguientes datos para iniciar el proceso de registro.',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: nameController,
                  label: 'Nombre',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su nombre';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: lastnameController,
                  label: 'Apellidos',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese sus apellidos';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: emailController,
                  label: 'Correo electrónico',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su correo electrónico';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Ingrese un correo electrónico válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: rfcController,
                  label: 'RFC',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su RFC';
                    }
                    if (value.length > 13) {
                      return 'El RFC tiene que ser menor a 13 cifras';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: phoneController,
                  label: 'Número de teléfono',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su número de teléfono';
                    }
                    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Ingrese un número de teléfono válido (10 dígitos)';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: passwordController,
                  label: 'Contraseña',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su contraseña';
                    }
                    if (value.length < 6) {
                      return 'La contraseña debe tener al menos 6 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Checkbox(
                      value: _acceptedTerms,
                      onChanged: (bool? value) {
                        setState(() {
                          _acceptedTerms = value ?? false;
                        });
                      },
                    ),
                    const Expanded(
                      child: CustomText(
                        text: 'Acepto los Términos y Condiciones',
                        size: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _acceptedTerms
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            Logger logger = Logger();
                            final user = RegisterModel(
                              name: nameController.text,
                              lastname: lastnameController.text,
                              email: emailController.text,
                              rfc: rfcController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
                              id_bank: 9,
                            );
                            logger.d(user.toJson());
                            BlocProvider.of<RegisterBloc>(context)
                                .add(SubmitRegisterEvent(user));
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(10, 89, 89, 1),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 150, vertical: 15),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Continuar'),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
