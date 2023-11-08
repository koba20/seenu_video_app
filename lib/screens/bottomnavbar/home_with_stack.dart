import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:seequl/provider/viewprovider.dart';
import 'package:seequl/screens/homescreens/homepage.dart';

class HomeWithStack extends StatefulWidget {
  const HomeWithStack({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeWithStack> createState() => _HomeWithStackState();
}

class _HomeWithStackState extends State<HomeWithStack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomePage(),
          Consumer<ViewProvider>(
            builder: (context, value, child) => Positioned(
              bottom: value.view ? 80.h : 10.h,
              right: value.view ? null : 0,
              child: GestureDetector(
                onTap: () {
                  value.setView(!value.view);
                },
                child: RotatedBox(
                  quarterTurns: value.view ? 0 : 2,
                  child: Container(
                    width: 37.w,
                    height: 43.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0.r),
                        topRight: Radius.circular(30.r),
                        bottomRight: Radius.circular(30.r),
                        bottomLeft: Radius.circular(0.r),
                      ),
                      color: Color(0xFFFFBB00).withOpacity(.4),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x25000000),
                          offset: Offset(0, -2),
                          blurRadius: 3,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(children: [
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white.withOpacity(.3),
                        size: 10.sp,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white.withOpacity(.5),
                        size: 10.sp,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white.withOpacity(.7),
                        size: 10.sp,
                      )
                    ]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
