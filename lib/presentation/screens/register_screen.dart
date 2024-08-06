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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  bool _acceptedTerms = false;

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
                child: BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    if (state is RegisterInitial) {
                      return buildForm(context);
                    } else if (state is RegisterLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is RegisterSuccess) {
                      return const Text('Register data submitted successfully');
                    } else if (state is RegisterError) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(state.message),
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
              CustomTextField(controller: nameController, label: 'Nombre'),
              const SizedBox(height: 20),
              CustomTextField(
                  controller: lastnameController, label: 'Apellidos'),
              const SizedBox(height: 20),
              CustomTextField(
                  controller: emailController, label: 'Correo electrónico'),
              const SizedBox(height: 20),
              CustomTextField(controller: rfcController, label: 'RFC'),
              const SizedBox(height: 20),
              CustomTextField(
                  controller: phoneController, label: 'Número de teléfono'),
              const SizedBox(height: 20),
              CustomTextField(
                  controller: passwordController,
                  label: 'Contraseña',
                  obscureText: true),
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
                        final user = RegisterModel(
                          name: nameController.text,
                          lastname: lastnameController.text,
                          email: emailController.text,
                          rfc: rfcController.text,
                          phone: phoneController.text,
                          password: passwordController.text,
                          idBank: 9,
                        );
                        BlocProvider.of<RegisterBloc>(context)
                            .add(SubmitRegisterEvent(user));
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(10, 89, 89, 1),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
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
    );
  }
}
