import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();
  bool showEmojiPicker = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        height: 25.h,
                        width: 25.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xff222020)),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    width: 13.w,
                  ),
                  Text(
                    'Reply',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff4B4B4B)),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 39.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 44.h,
                          width: 44.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/person.png'),
                              ),
                              shape: BoxShape.circle),
                        ),
                        Container(
                          height: 100.h,
                          width: 1,
                          color: Color(0xff886826),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Kerry Johns',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              '@Kerryjo',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Color(0xff5C8DFF),
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 64.w,
                            ),
                            Text(
                              '3 hours ago',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Color(0xffC4C4C4),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Container(
                          width: 307.w,
                          height: 75.h,
                          child: Text(
                            'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper      amet justo quisque          ullamcorper volutpat. Donec feugiat diam et tellus in habitant viverra duis. ',
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: Color(0xff767676),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Replying to ',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'John Doe @JohntheD',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color(0xffFFBB00),
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
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
                        border:
                            Border.all(color: Color(0xffC4C4C4), width: 0.5.w),
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
                              hintText: 'add reply',
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
                          onPressed: () {
                            // Handle sending the comment
                            String comment = _commentController.text;
                            print('Sending Comment: $comment');
                            // TODO: Implement your logic for sending the comment
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (showEmojiPicker) SizedBox(height: 300, child: emojiSelect()),
            ],
          ),
        ),
      )),
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
      config: Config(
        columns: 7,
        verticalSpacing: 0,
        horizontalSpacing: 0,
        gridPadding: EdgeInsets.zero,
        initCategory: Category.RECENT,
        bgColor: Color(0xFFF2F2F2),
        indicatorColor: Colors.blue,
        iconColor: Colors.grey,
        iconColorSelected: Colors.blue,
        backspaceColor: Colors.blue,
        skinToneDialogBgColor: Colors.white,
        skinToneIndicatorColor: Colors.grey,
        enableSkinTones: true,

        recentsLimit: 28,
        noRecents: const Text(
          'No Recents',
          style: TextStyle(fontSize: 20, color: Colors.black26),
          textAlign: TextAlign.center,
        ), // Needs to be const Widget
        loadingIndicator: const SizedBox.shrink(), // Needs to be const Widget
        tabIndicatorAnimDuration: kTabScrollDuration,
        categoryIcons: const CategoryIcons(),
        buttonMode: ButtonMode.MATERIAL,
      ),
    );
  }
}
