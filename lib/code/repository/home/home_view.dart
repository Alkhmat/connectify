// import 'dart:io';
// import 'package:connectify/code/repository/auth/register_view.dart';
// import 'package:connectify/code/repository/classes/repository_text.dart';
// import 'package:connectify/code/repository/commentaries/widgets/comment_fieled.dart';
// import 'package:connectify/code/repository/contents/cubit/add_content_cubit.dart';
// import 'package:connectify/code/repository/home/bookmark_cubit/bookmark_cubit.dart';
// import 'package:connectify/code/repository/home/favourite_cubit/likes_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   @override
//   Widget build(BuildContext context) {
//     final h = MediaQuery.of(context).size.height;
//     final w = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         toolbarHeight: h * 0.07,
//         leadingWidth: w,
//         backgroundColor: Colors.transparent,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 8),
//           child: Text(
//             RepositoryText.hometext,
//             style: GoogleFonts.pacifico(
//               textStyle: TextStyle(
//                 color: Colors.black,
//                 fontSize: h * 0.04,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 8),
//             child: IconButton(
//               onPressed: () {
//                 context.read<AddContentCubit>().addPhoto();
//               },
//               icon: Icon(
//                 Icons.add,
//                 size: h * 0.043,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 8),
//             child: IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const RegisterView(),
//                   ),
//                 );
//               },
//               icon: Icon(
//                 Icons.person_outline,
//                 size: h * 0.043,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: BlocBuilder<AddContentCubit, List<AddContentState>>(
//         builder: (context, state) {
//           return Column(
//             children: [
//               Expanded(
//                 child: SizedBox(
//                   height: h * 0.899,
//                   width: w,
//                   child: PageView.builder(
//                     itemCount: state.length,
//                     controller: PageController(initialPage: 0),
//                     scrollDirection: Axis.vertical,
//                     itemBuilder: (context, index) {
//                       final item = state[index];
//                       if (item is AddContentLoaded) {
//                         return Container(
//                           height: h * 0.899,
//                           width: w,
//                           margin: const EdgeInsets.symmetric(
//                             horizontal: 5,
//                             vertical: 7,
//                           ),
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: FileImage(File(item.imagePath)),
//                               fit: BoxFit.cover,
//                             ),
//                             borderRadius: BorderRadius.circular(24),
//                             color: Colors.black45,
//                           ),
//                           child: buildContentControls(h, index),
//                         );
//                       } else if (item is VideoLoaded) {
//                         return Container(
//                           height: h * 0.899,
//                           width: w,
//                           margin: const EdgeInsets.symmetric(
//                             horizontal: 5,
//                             vertical: 7,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.black45,
//                             borderRadius: BorderRadius.circular(24),
//                           ),
//                           child: buildContentControls(h, index),
//                         );
//                       }
//                       return const Center(
//                         child: CircularProgressIndicator(
//                           color: Colors.black,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Widget buildContentControls(double h, int index) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 250),
//               child: Container(
//                 margin: const EdgeInsets.symmetric(
//                   horizontal: 10,
//                   vertical: 10,
//                 ),
//                 height: h * 0.2,
//                 decoration: BoxDecoration(
//                   color: Colors.black54,
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 width: h * 0.1,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     BlocBuilder<FavoriteCubit, List<bool>>(
//                       builder: (context, state) {
//                         return IconButton(
//                           onPressed: () {
//                             context.read<FavoriteCubit>().toggleFavorite(index);
//                           },
//                           icon: Icon(
//                             state[index]
//                                 ? Icons.favorite
//                                 : Icons.favorite_outline_outlined,
//                             color: state[index] ? Colors.red : Colors.white,
//                             size: h * 0.045,
//                           ),
//                         );
//                       },
//                     ),
//                     IconButton(
//                       onPressed: () async {
//                         await showDialog(
//                           context: context,
//                           builder: (context) {
//                             return AlertDialog(
//                               title: Text(
//                                 RepositoryText.comments,
//                                 style: GoogleFonts.pacifico(
//                                   textStyle: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: h * 0.025,
//                                   ),
//                                 ),
//                               ),
//                               content: SingleChildScrollView(
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     SizedBox(
//                                       height: h * 0.4,
//                                       width: h * 0.6,
//                                       child: ListView.builder(
//                                         shrinkWrap: true,
//                                         itemCount: 5,
//                                         itemBuilder: (context, index) {
//                                           return Text(index.toString());
//                                         },
//                                       ),
//                                     ),
//                                     const CustomCommentFieled(),
//                                   ],
//                                 ),
//                               ),
//                               backgroundColor: Colors.white,
//                             );
//                           },
//                         );
//                       },
//                       icon: Icon(
//                         Icons.comment,
//                         size: h * 0.045,
//                         color: Colors.white,
//                       ),
//                     ),
//                     BlocBuilder<BookMarkCubit, List<bool>>(
//                       builder: (context, state) {
//                         return IconButton(
//                           onPressed: () {
//                             context.read<BookMarkCubit>().toggleBookMark(index);
//                           },
//                           icon: Icon(
//                             state[index]
//                                 ? Icons.bookmark
//                                 : Icons.bookmark_outline,
//                             size: h * 0.045,
//                             color: state[index] ? Colors.white : Colors.white,
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:connectify/code/repository/auth/register_view.dart';
// import 'package:connectify/code/repository/classes/repository_text.dart';
// import 'package:connectify/code/repository/commentaries/widgets/comment_fieled.dart';
// import 'package:connectify/code/repository/contents/cubit/add_content_cubit.dart';
// import 'package:connectify/code/repository/home/bookmark_cubit/bookmark_cubit.dart';
// import 'package:connectify/code/repository/home/favourite_cubit/likes_cubit.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<AddContentCubit>().loadContent();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final h = MediaQuery.of(context).size.height;
//     final w = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         toolbarHeight: h * 0.07,
//         leadingWidth: w,
//         backgroundColor: Colors.transparent,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 8),
//           child: Text(
//             RepositoryText.hometext,
//             style: GoogleFonts.pacifico(
//               textStyle: TextStyle(
//                 color: Colors.black,
//                 fontSize: h * 0.04,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 8),
//             child: IconButton(
//               onPressed: () {
//                 context.read<AddContentCubit>().addPhoto();
//               },
//               icon: Icon(
//                 Icons.add,
//                 size: h * 0.043,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 8),
//             child: IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const RegisterView(),
//                   ),
//                 );
//               },
//               icon: Icon(
//                 Icons.person_outline,
//                 size: h * 0.043,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: BlocBuilder<AddContentCubit, List<AddContentState>>(
//         builder: (context, state) {
//           return Column(
//             children: [
//               Expanded(
//                 child: SizedBox(
//                   height: h * 0.899,
//                   width: w,
//                   child: PageView.builder(
//                     itemCount: state.length,
//                     controller: PageController(initialPage: 0),
//                     scrollDirection: Axis.vertical,
//                     itemBuilder: (context, index) {
//                       final item = state[index];
//                       if (item is AddContentLoaded) {
//                         return Container(
//                           height: h * 0.899,
//                           width: w,
//                           margin: const EdgeInsets.symmetric(
//                             horizontal: 5,
//                             vertical: 7,
//                           ),
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: NetworkImage(item.imagePath),
//                               fit: BoxFit.cover,
//                             ),
//                             borderRadius: BorderRadius.circular(24),
//                             color: Colors.black45,
//                           ),
//                           child: buildContentControls(h, index),
//                         );
//                       } else if (item is VideoLoaded) {
//                         return Container(
//                           height: h * 0.899,
//                           width: w,
//                           margin: const EdgeInsets.symmetric(
//                             horizontal: 5,
//                             vertical: 7,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.black45,
//                             borderRadius: BorderRadius.circular(24),
//                           ),
//                           child: buildContentControls(h, index),
//                         );
//                       }
//                       return const Center(
//                         child: CircularProgressIndicator(
//                           color: Colors.black,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Widget buildContentControls(double h, int index) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 250),
//               child: Container(
//                 margin: const EdgeInsets.symmetric(
//                   horizontal: 10,
//                   vertical: 10,
//                 ),
//                 height: h * 0.2,
//                 decoration: BoxDecoration(
//                   color: Colors.black54,
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 width: h * 0.1,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     BlocBuilder<FavoriteCubit, List<bool>>(
//                       builder: (context, state) {
//                         return IconButton(
//                           onPressed: () {
//                             context.read<FavoriteCubit>().toggleFavorite(index);
//                           },
//                           icon: Icon(
//                             state[index]
//                                 ? Icons.favorite
//                                 : Icons.favorite_outline_outlined,
//                             color: state[index] ? Colors.red : Colors.white,
//                             size: h * 0.045,
//                           ),
//                         );
//                       },
//                     ),
//                     IconButton(
//                       onPressed: () async {
//                         await showDialog(
//                           context: context,
//                           builder: (context) {
//                             return AlertDialog(
//                               title: Text(
//                                 RepositoryText.comments,
//                                 style: GoogleFonts.pacifico(
//                                   textStyle: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: h * 0.025,
//                                   ),
//                                 ),
//                               ),
//                               content: SingleChildScrollView(
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     SizedBox(
//                                       height: h * 0.4,
//                                       width: h * 0.6,
//                                       child: ListView.builder(
//                                         shrinkWrap: true,
//                                         itemCount: 5,
//                                         itemBuilder: (context, index) {
//                                           return Text(index.toString());
//                                         },
//                                       ),
//                                     ),
//                                     const CustomCommentFieled(),
//                                   ],
//                                 ),
//                               ),
//                               backgroundColor: Colors.white,
//                             );
//                           },
//                         );
//                       },
//                       icon: Icon(
//                         Icons.comment,
//                         size: h * 0.045,
//                         color: Colors.white,
//                       ),
//                     ),
//                     BlocBuilder<BookMarkCubit, List<bool>>(
//                       builder: (context, state) {
//                         return IconButton(
//                           onPressed: () {
//                             context.read<BookMarkCubit>().toggleBookMark(index);
//                           },
//                           icon: Icon(
//                             state[index]
//                                 ? Icons.bookmark
//                                 : Icons.bookmark_outline,
//                             size: h * 0.045,
//                             color: state[index] ? Colors.white : Colors.white,
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
import 'package:connectify/code/repository/auth/register_view.dart';
import 'package:connectify/code/repository/classes/repository_text.dart';
import 'package:connectify/code/repository/commentaries/widgets/comment_fieled.dart';
import 'package:connectify/code/repository/contents/cubit/add_content_cubit.dart';
import 'package:connectify/code/repository/home/bookmark_cubit/bookmark_cubit.dart';
import 'package:connectify/code/repository/home/favourite_cubit/likes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_player/video_player.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: h * 0.07,
        leadingWidth: w,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            RepositoryText.hometext,
            style: GoogleFonts.pacifico(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: h * 0.04,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                context.read<AddContentCubit>().addVideo();
              },
              icon: Icon(
                Icons.add,
                size: h * 0.043,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterView(),
                  ),
                );
              },
              icon: Icon(
                Icons.person_outline,
                size: h * 0.043,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('content').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final content = snapshot.data?.docs ?? [];

          return Column(
            children: [
              Expanded(
                child: SizedBox(
                  height: h * 0.899,
                  width: w,
                  child: PageView.builder(
                    itemCount: content.length,
                    controller: PageController(initialPage: 0),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final item = content[index];
                      final data = item.data() as Map<String, dynamic>;
                      final type = data['type'];
                      final url = data['url'];

                      if (type == 'photo') {
                        return Container(
                          height: h * 0.899,
                          width: w,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(url),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white24,
                          ),
                          child: buildContentControls(h, index),
                        );
                      } else if (type == 'video') {
                        return VideoPlayerWidget(
                          url: url,
                          height: h * 0.899,
                          width: w,
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildContentControls(double h, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                height: h * 0.2,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(25),
                ),
                width: h * 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlocBuilder<FavoriteCubit, List<bool>>(
                      builder: (context, state) {
                        return IconButton(
                          onPressed: () {
                            context.read<FavoriteCubit>().toggleFavorite(index);
                          },
                          icon: Icon(
                            state[index]
                                ? Icons.favorite
                                : Icons.favorite_outline_outlined,
                            color: state[index] ? Colors.red : Colors.white,
                            size: h * 0.045,
                          ),
                        );
                      },
                    ),
                    IconButton(
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                RepositoryText.comments,
                                style: GoogleFonts.pacifico(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: h * 0.025,
                                  ),
                                ),
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: h * 0.4,
                                      width: h * 0.6,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: 5,
                                        itemBuilder: (context, index) {
                                          return Text(index.toString());
                                        },
                                      ),
                                    ),
                                    const CustomCommentFieled(),
                                  ],
                                ),
                              ),
                              backgroundColor: Colors.white,
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.comment,
                        size: h * 0.045,
                        color: Colors.white,
                      ),
                    ),
                    BlocBuilder<BookMarkCubit, List<bool>>(
                      builder: (context, state) {
                        return IconButton(
                          onPressed: () {
                            context.read<BookMarkCubit>().toggleBookMark(index);
                          },
                          icon: Icon(
                            state[index]
                                ? Icons.bookmark
                                : Icons.bookmark_outline,
                            size: h * 0.045,
                            color: state[index] ? Colors.white : Colors.white,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String url;
  final double height;
  final double width;

  const VideoPlayerWidget({
    super.key,
    required this.url,
    required this.height,
    required this.width,
  });

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
        _controller.play(); // Автоматически запускает видео после инициализации
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.black45,
      ),
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
    );
  }
}
