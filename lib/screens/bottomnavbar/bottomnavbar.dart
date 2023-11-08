import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:seequl/provider/viewprovider.dart';
import 'package:seequl/screens/bottomnavbar/home_with_stack.dart';
import 'package:seequl/screens/homescreens/homepage.dart';
import 'package:seequl/theme/colors.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

List<BottomBarIcons> bottomicons = [
  BottomBarIcons(svg: 'Vector', label: 'Apps'),
  BottomBarIcons(svg: 'Vector-2', label: 'Quicon'),
  BottomBarIcons(svg: 'Vector-4', label: 'Zaady'),
  BottomBarIcons(svg: 'Vector-3', label: 'Organize'),
  BottomBarIcons(svg: 'Vector5', label: 'Profile')
];

int pageIndex = 0;

class _RootPageState extends State<RootPage> {
  final _pageController = PageController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
          height: 460.h,
          margin: EdgeInsets.only(bottom: 350.h),
          child: Consumer<ViewProvider>(
            builder: (context, value, child) => Drawer(
              key: value.key,
              backgroundColor: Color(0xffefeff4),
              surfaceTintColor: Color(0xffefeff4),
              child: SafeArea(
                child: Container(
                    height: MediaQuery.of(context).size.height * .75,
                    child: DrawerList(pageController: _pageController)),
              ),
            ),
          )),
      bottomNavigationBar: Consumer<ViewProvider>(
          builder: (context, value, child) => Visibility(
                child: getFooter(),
                visible: !value.view,
              )),
      body: getBody(context),
    );
  }

  getBody(BuildContext context) {
    return IndexedStack(
      index: pageIndex,
      children: [
        Stack(
          children: [
            HomeWithStack(),
            Consumer<ViewProvider>(
              builder: (context, value, child) => Positioned(
                top: 50.h,
                left: 10.w,
                child: Visibility(
                  visible: !value.view,
                  child: GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Card(
                        elevation: 5,
                        child: Container(
                          height: 24.16.h,
                          width: 27.w,
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 1.h,
                                width: 17.w,
                                color: Color(0xff1565C0),
                              ),
                              Container(
                                height: 1.h,
                                width: 17.w,
                                color: Color(0xff1565C0),
                              ),
                              Container(
                                height: 1.h,
                                width: 17.w,
                                color: Color(0xff1565C0),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              ),
            )
          ],
        ),
        Center(
          child: Text(
            'Discover',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: black,
              fontSize: 20,
            ),
          ),
        ),
        Center(
          child: Text(
            'Add',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: black,
              fontSize: 20,
            ),
          ),
        ),
        Center(
          child: Text(
            'Inbox',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: black,
              fontSize: 20,
            ),
          ),
        ),
        Center(
          child: Text(
            'Me',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: black,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  getFooter() {
    return Container(
      height: 72.h,
      width: double.infinity,
      decoration: const BoxDecoration(color: appBgColor),
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 7.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            bottomicons.length,
            (index) => InkWell(
              onTap: () {
                log('$index');
                selectedIndex(index);
              },
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/${bottomicons[index].svg}.svg',
                    color:
                        pageIndex == index ? Color(0xffFFDD5E) : Colors.white,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    bottomicons[index].label!,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color:
                          pageIndex == index ? Color(0xffFFDD5E) : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  selectedIndex(index) {
    setState(() {
      pageIndex = index;
    });
  }
}

class BottomBarIcons {
  final String? svg;
  final String? label;
  BottomBarIcons({this.svg, this.label});
}

class DrawerList extends StatelessWidget {
  const DrawerList({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: ListTile(
            leading: SvgPicture.asset('assets/icons/Vector-11.svg'),
            title: Text("Post a Seequl"),
            onTap: () {
              _pageController.jumpToPage(0);
              Navigator.of(context).pop();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: ListTile(
            leading: SvgPicture.asset('assets/icons/Vector-12.svg'),
            title: Text("View your likes"),
            onTap: () {
              _pageController.jumpToPage(1);
              Navigator.of(context).pop();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: ListTile(
            leading: SvgPicture.asset('assets/icons/Vector-13.svg'),
            title: Text("Your Seequl posts"),
            onTap: () {
              _pageController.jumpToPage(2);
              Navigator.of(context).pop();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: ListTile(
            leading: SvgPicture.asset('assets/icons/Vector-19.svg'),
            title: Text("Reference contribution"),
            onTap: () {
              _pageController.jumpToPage(3);
              Navigator.of(context).pop();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: ListTile(
            leading: SvgPicture.asset('assets/icons/Vector-14.svg'),
            title: Text("Hashtag challenges"),
            onTap: () {
              _pageController.jumpToPage(4);
              Navigator.of(context).pop();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: ListTile(
            leading: SvgPicture.asset('assets/icons/Vector-15.svg'),
            title: Text("Notifications"),
            onTap: () {
              _pageController.jumpToPage(5);
              Navigator.of(context).pop();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: ListTile(
            leading: SvgPicture.asset('assets/icons/Vector-16.svg'),
            title: Text("About SeeQul"),
            onTap: () {
              _pageController.jumpToPage(6);
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
