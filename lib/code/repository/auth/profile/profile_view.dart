import 'dart:io';

import 'package:connectify/code/repository/auth/profile/cubit_2/tap_cubit.dart';
import 'package:connectify/code/repository/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectify/code/repository/auth/profile/cubit/image_cubit.dart';

class ProfileView extends StatefulWidget {
  final String username;
  final String email;

  const ProfileView({super.key, required this.username, required this.email});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  List<IconData> icons = [
    Icons.view_comfy_alt_outlined,
    Icons.bookmark_outline,
  ];

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: h * 0.025,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chat_bubble_outline_rounded,
              size: h * 0.032,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings_outlined,
              size: h * 0.032,
            ),
          ),
        ],
        title: Text(
          widget.username,
          style: TextStyle(
            color: Colors.black,
            fontSize: h * 0.04,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              BlocBuilder<ImageCubit, ImageState>(
                builder: (context, state) {
                  if (state is ImageInitial) {
                    return GestureDetector(
                      onTap: () {
                        context.read<ImageCubit>().pickerPhoto();
                      },
                      child: CircleAvatar(
                        radius: h * 0.1,
                        backgroundColor: Colors.black45,
                        child: Center(
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: h * 0.05,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    );
                  } else if (state is ImageLoaded) {
                    return GestureDetector(
                      onTap: () {
                        context.read<ImageCubit>().reset();
                      },
                      child: CircleAvatar(
                        backgroundImage: FileImage(
                          File(state.images),
                        ),
                        radius: h * 0.1,
                        backgroundColor: Colors.black45,
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Text(
                '@${widget.email}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: h * 0.02,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  height: h * 0.09,
                  width: w * 0.555,
                  child: BlocBuilder<TapCubit, int>(
                    builder: (context, state) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: icons.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 120),
                                child: GestureDetector(
                                  child: IconButton(
                                    onPressed: () {
                                      context.read<TapCubit>().tapIndex(index);
                                    },
                                    icon: Icon(
                                      icons[index],
                                      size: h * 0.04,
                                      color: state == index
                                          ? Colors.blue
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
