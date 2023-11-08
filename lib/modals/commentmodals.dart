import 'dart:io';

import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seequl/widgets/commentwidget.dart';

class CommentModal extends StatefulWidget {
  @override
  _CommentModalState createState() => _CommentModalState();
}

class _CommentModalState extends State<CommentModal> {
  final TextEditingController _commentController = TextEditingController();
  bool showEmojiPicker = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        //padding: EdgeInsets.all(20),
        height: 670.h,
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(25),
        //     topRight: Radius.circular(25),
        //   ),
        // ),
        child: Column(
          children: [
            Container(
              width: 116.w,
              height: 25.h,
              decoration: BoxDecoration(
                  color: Color(0xff5F6368),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.r),
                      bottomRight: Radius.circular(5.r))),
              child: Center(
                child: Text(
                  '45k Comments',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.89.sp,
                      color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CommentWidget();
                },
              ),
            ),
            Container(
              height: showEmojiPicker ? null : 114.h,
              width: double.infinity,
              decoration:
                  BoxDecoration(border: Border.all(color: Color(0xffC4C4C4))),
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 49.h,
                        width: 49.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/person.png'),
                            ),
                            shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: 9.w,
                      ),
                      Container(
                        height: 54.h,
                        width: 308.w,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xffC4C4C4), width: 0.5.w),
                            borderRadius: BorderRadius.circular(34.r)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.emoji_emotions_outlined),
                              onPressed: () {
                                setState(() {
                                  showEmojiPicker = !showEmojiPicker;
                                });
                              },
                            ),
                            Expanded(
                              child: TextField(
                                controller: _commentController,
                                decoration: InputDecoration(
                                  hintText: 'add comment',
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.send,
                                color: Color(0xff5C8DFF),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (showEmojiPicker)
                    SizedBox(height: 300, child: emojiSelect()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      onEmojiSelected: (Category? category, Emoji? emoji) {
        _commentController.text += emoji!.emoji;
      },
      onBackspacePressed: () {
        // Do something when the user taps the backspace button (optional)
      }, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
      config: Config(columns: 7, bgColor: Colors.white
          // emojiSizeMax: 32 *
          //     (Platform.isIOS
          //         ? 1.30
          //         : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
          // verticalSpacing: 0,
          // horizontalSpacing: 0,
          // gridPadding: EdgeInsets.zero,
          // initCategory: Category.RECENT,
          // bgColor: Color(0xFFF2F2F2),
          // indicatorColor: Colors.blue,
          // iconColor: Colors.grey,
          // iconColorSelected: Colors.blue,
          // backspaceColor: Colors.blue,
          // skinToneDialogBgColor: Colors.white,
          // skinToneIndicatorColor: Colors.grey,
          // enableSkinTones: true,

          // recentsLimit: 28,
          // noRecents: const Text(
          //   'No Recents',
          //   style: TextStyle(fontSize: 20, color: Colors.black26),
          //   textAlign: TextAlign.center,
          // ), // Needs to be const Widget
          // loadingIndicator: const SizedBox.shrink(), // Needs to be const Widget
          // tabIndicatorAnimDuration: kTabScrollDuration,
          // categoryIcons: const CategoryIcons(),
          // buttonMode: ButtonMode.MATERIAL,
          ),
    );
  }
}
