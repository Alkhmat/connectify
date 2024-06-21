import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:connectify/code/repository/auth/widgets/text_fieled.dart';
import 'package:connectify/code/repository/auth/profile/profile_view.dart';
import 'package:connectify/code/repository/auth/auth_cubit/auth_cubit.dart';
import 'login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            context.read<AuthCubit>().fetchUserData();
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is UserDataLoaded) {
            var user = state.userData.firstWhere(
              (user) => user['email'] == _emailController.text,
              orElse: () => {},
            );
            if (user.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileView(
                    username: user['username'],
                    email: user['email'],
                  ),
                ),
              );
            }
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 340, top: 20),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Registration',
                    style: GoogleFonts.pacifico(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: h * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextFieledForAuth(
                    label: 'User name',
                    controller: _usernameController,
                    icon: const Icon(Icons.person),
                  ),
                  TextFieledForAuth(
                    label: 'Email address',
                    controller: _emailController,
                    icon: const Icon(Icons.alternate_email_outlined),
                  ),
                  TextFieledForAuth(
                    label: 'Password',
                    icon: const Icon(Icons.password_outlined),
                    controller: _passwordController,
                  ),
                  SizedBox(height: h * 0.02),
                  TextButton(
                    onPressed: () {
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      final username = _usernameController.text;
                      context
                          .read<AuthCubit>()
                          .signUp(email, password, username);
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: h * 0.03,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('If you have an existing account '),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LogInView(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: h * 0.024,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
