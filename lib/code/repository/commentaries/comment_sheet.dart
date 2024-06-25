import 'package:connectify/code/repository/commentaries/widgets/comment_fieled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentSheet extends StatelessWidget {
  const CommentSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final sendController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: h * 0.45,
        width: w,
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: h * 0.03,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Comments',
                  style: GoogleFonts.pacifico(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: h * 0.035,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return Text('data$index');
                },
                shrinkWrap: true,
              ),
            ),
            CustomCommentFieled(
              controller: sendController,
              label: const Text('Add comments'),
            ),
          ],
        ),
      ),
    );
  }
}
