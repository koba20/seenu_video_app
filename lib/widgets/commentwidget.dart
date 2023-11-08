import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seequl/screens/commentscreen/comment_screen.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 23.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 44.h,
            width: 44.w,
            margin: EdgeInsets.only(left: 25.w),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/person.png'),
                ),
                shape: BoxShape.circle),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CommentScreen()));
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/Vector 6.svg'),
                        SizedBox(
                          width: 7.w,
                        ),
                        Text(
                          '15',
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: Color(0xffC4C4C4),
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/Vector-9.svg'),
                      SizedBox(
                        width: 7.w,
                      ),
                      Text(
                        '7k',
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: Color(0xffC4C4C4),
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 35.w,
                  ),
                  SvgPicture.asset('assets/icons/Vector-10.svg')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
