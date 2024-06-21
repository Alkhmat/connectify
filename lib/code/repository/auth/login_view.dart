import 'package:connectify/code/repository/auth/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectify/code/repository/auth/cubit/auth_cubit.dart';
import 'package:connectify/code/repository/auth/profile/profile_view.dart';
import 'package:connectify/code/repository/auth/widgets/text_fieled.dart';
import 'package:connectify/code/repository/classes/repository_text.dart';
import 'package:connectify/code/repository/home/home_view.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  _LogInViewState createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            if (state.userData.isNotEmpty) {
              final user = state.userData.first;
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 340, top: 20),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              const Spacer(),
              Text(
                RepositoryText.logintext,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: h * 0.05,
                  fontWeight: FontWeight.bold,
                ),
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
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  context.read<AuthCubit>().logIn(email, password);
                },
                child: Text(
                  'Sign In',
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
                  const Text('If you don\'t have an account then'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterView(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: h * 0.024,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
