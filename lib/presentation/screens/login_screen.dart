import 'package:fin_glow/domain/models/login_model.dart';
import 'package:fin_glow/domain/repositories/login_repository.dart';
import 'package:fin_glow/domain/usecases/login_usecase.dart';
import 'package:fin_glow/presentation/bloc/bloc/login_bloc.dart';
import 'package:fin_glow/presentation/bloc/event/login_event.dart';
import 'package:fin_glow/presentation/bloc/state/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/login_button.dart';
import '../widgets/divider_text.dart';
import '../widgets/custom_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                      if (state is LoginInitial) {
                        return buildForm(context);
                      } else if (state is LoginLoading) {
                        return const CircularProgressIndicator();
                      } else if (state is LoginError) {
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
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return SingleChildScrollView(
      child: Container(
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
              CustomTextField(
                controller: phoneController,
                label: 'Teléfono',
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: passwordController,
                label: 'Contraseña',
                obscureText: true,
              ),
              const SizedBox(height: 30),
              LoginButton(
                onPressed: () {
                  final loginModel = LoginModel(
                    phone: "2722088800",
                    password: "Joshrolo23",
                  );
                  BlocProvider.of<LoginBloc>(context)
                      .add(LoginSubmitEvent(loginModel));
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
      ),
    );
  }
}
