import 'package:connectify/code/repository/auth/auth_cubit/auth_cubit.dart';
// import 'package:connectify/code/repository/auth/login_view.dart';
// import 'package:connectify/code/repository/auth/register_view.dart';
// import 'package:connectify/code/repository/home/home_view.dart';
// import 'package:connectify/code/repository/welcome/welcome_view.dart';
import 'package:connectify/code/core/firebase/options/firebase_options.dart';
import 'package:connectify/code/repository/auth/profile/cubit/image_cubit.dart';
import 'package:connectify/code/repository/auth/profile/cubit_2/tap_cubit.dart';
import 'package:connectify/code/repository/contents/cubit/add_content_cubit.dart';
// import 'package:connectify/code/repository/contents/cubit/content_cubit.dart';
import 'package:connectify/code/repository/home/bookmark_cubit/bookmark_cubit.dart';
import 'package:connectify/code/repository/home/favourite_cubit/likes_cubit.dart';
// import 'package:connectify/code/repository/auth/profile/profile_view.dart';
// import 'package:connectify/code/repository/home/home_view.dart';
import 'package:connectify/code/repository/welcome/welcome_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Connectify());
}

class Connectify extends StatelessWidget {
  const Connectify({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => ImageCubit(),
        ),
        BlocProvider(
          create: (context) => TapCubit(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(),
        ),
        BlocProvider(
          create: (context) => BookMarkCubit(),
        ),
        BlocProvider(
          create: (context) => AddContentCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeView(),
      ),
    );
  }
}
