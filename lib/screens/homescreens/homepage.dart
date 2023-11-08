import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:seequl/constants/app_data.dart';
import 'package:seequl/modals/commentmodals.dart';
import 'package:seequl/provider/viewprovider.dart';
import 'package:seequl/theme/colors.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: items.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  getBody() {
    var size = MediaQuery.of(context).size;
    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
        controller: _tabController,
        children: List.generate(
          items.length,
          (index) => RotatedBox(
            quarterTurns: -1,
            child: VideoPlayeItems(
              size: size,
              name: items[index]['name'],
              videoUrl: items[index]['videoUrl'],
              caption: items[index]['caption'],
              songName: items[index]['songName'],
              albumImg: items[index]['albumImg'],
              comments: items[index]['comments'],
              likes: items[index]['likes'],
              shares: items[index]['shares'],
              profileImg: items[index]['profileImg'],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }
}

class VideoPlayeItems extends StatefulWidget {
  const VideoPlayeItems({
    Key? key,
    required this.size,
    required this.name,
    required this.caption,
    required this.songName,
    required this.albumImg,
    required this.comments,
    required this.likes,
    required this.shares,
    required this.profileImg,
    required this.videoUrl,
  }) : super(key: key);

  final Size size;
  final String name;
  final String caption;
  final String videoUrl;
  final String songName;
  final String albumImg;
  final String comments;
  final String likes;
  final String shares;
  final String profileImg;

  @override
  State<VideoPlayeItems> createState() => _VideoPlayeItemsState();
}

class _VideoPlayeItemsState extends State<VideoPlayeItems>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _videoPlayerController;
  bool isShowingPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((value) {
        _videoPlayerController.play();
        setState(() {
          isShowingPlaying = false;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _videoPlayerController.value.isPlaying
              ? _videoPlayerController.pause()
              : _videoPlayerController.play();
        });
      },
      child: SizedBox(
        width: widget.size.width,
        height: widget.size.height,
        child: Stack(
          children: [
            SizedBox(
                width: widget.size.width,
                height: widget.size.height,
                child: Stack(
                  children: [
                    VideoPlayer(_videoPlayerController),
                    _videoPlayerController.value.isPlaying
                        ? const SizedBox()
                        : Center(
                            child: Icon(
                            Icons.play_arrow,
                            size: 88,
                            color: white.withOpacity(.5),
                          ))
                  ],
                )),
            Consumer<ViewProvider>(
              builder: (context, value, child) => SizedBox(
                width: widget.size.width,
                height: widget.size.height,
                child: value.view
                    ? null
                    : SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            //right: 15,
                            top: 25,
                            bottom: 10,
                          ),
                          child: Column(
                            children: [
                              //const HeaderHomePage(),

                              Flexible(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ExpandableTextContainer(
                                        text:
                                            "Lorem ipsum dolor sit amet consectetur. Eget aenean integer amet sapien arcu urna turpis amet elementum. A nec euismod in quam venenatis. Consectetur et nunc amet mattis dui imperdiet tempus. Et aliquet gravida posuere pretium donec diam nibh sed. Pharetra non vitae urna aliquet egestas. Phasellus at id adipiscing eget. Lorem volutpat dolor lorem pharetra nunc duis lorem integer. Magna in pellentesque pretium elementum suspendisse tincidunt fermentum praesent."),
                                    RightPanel(
                                        size: widget.size,
                                        albumImg: widget.albumImg,
                                        comments: widget.comments,
                                        likes: widget.likes,
                                        shares: widget.shares,
                                        profileImg: widget.profileImg),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RightPanel extends StatelessWidget {
  const RightPanel({
    Key? key,
    required this.size,
    required this.profileImg,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.albumImg,
  }) : super(key: key);

  final Size size;
  final String profileImg;
  final String likes;
  final String comments;
  final String shares;
  final String albumImg;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        //height: 250,
        margin: EdgeInsets.only(bottom: size.height * 0.07),
        child: Column(
          children: [
            Container(
              height: size.height * 0.45,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getProfile(
                    profileImg: profileImg,
                  ),
                  getIcon(
                    icon: 'Vector-5',
                  ),
                  getIcon(
                    ontap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (builder) {
                            return Container(
                              height: 670.h,
                              color: Colors.transparent,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25.r),
                                          topRight: Radius.circular(25.r))),
                                  child: CommentModal()),
                            );
                          });
                    },
                    icon: 'Vector-6',
                    count: comments,
                  ),
                  getIcon(
                    icon: 'Vector-7',
                    count: likes,
                  ),
                  getIcon(
                    icon: 'Vector-8',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getAlbum({albumImg}) {
    return Container(
      width: 55,
      height: 55,
      child: Stack(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(shape: BoxShape.circle, color: black),
          ),
          Center(
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(albumImg), fit: BoxFit.cover)),
            ),
          ),
        ],
      ),
    );
  }

  getIcon({icon, double? size, count, void Function()? ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/icons/${icon}.svg',
          ),
          count == null
              ? SizedBox()
              : Column(
                  children: [
                    SizedBox(height: 5.h),
                    Text(
                      count!,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: white,
                          fontSize: 13.66.sp),
                    )
                  ],
                ),
        ],
      ),
    );
  }

  getProfile({profileImg}) {
    return Container(
      width: 27.5,
      height: 27.5,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: white),
          image: DecorationImage(
              image: NetworkImage(profileImg), fit: BoxFit.cover)),
    );
  }
}

class ExpandableTextContainer extends StatefulWidget {
  final String text;

  ExpandableTextContainer({required this.text});

  @override
  _ExpandableTextContainerState createState() =>
      _ExpandableTextContainerState();
}

class _ExpandableTextContainerState extends State<ExpandableTextContainer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isExpanded ? 482.h : 121.h,
      width: 345.w,
      padding: EdgeInsets.only(left: 21.w, top: 5.h),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffC4C4C4), width: 0.5.w),
          borderRadius: BorderRadius.circular(15.r),
          color: Color(0xff4C4243).withOpacity(.6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              if (widget.text.length > 150 && isExpanded == true)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = false;
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      Container(
                        height: 28.h,
                        width: 75.w,
                        margin: EdgeInsets.only(right: 7.w, bottom: 8.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Color(0xff2C2B2B).withOpacity(.8)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '...Less',
                                style: TextStyle(color: Color(0xff2CCAA0)),
                              ),
                              Image.asset('assets/images/less.png')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Text(
                isExpanded
                    ? widget.text
                    : widget.text.length > 150
                        ? widget.text.substring(0, 150)
                        : widget.text,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '27 Oct. 2020 @5:23pm',
                    style: TextStyle(
                        color: Color(0xffE5A5A5),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  if (widget.text.length > 150 && isExpanded == false)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = true;
                        });
                      },
                      child: Container(
                        height: 28.h,
                        width: 75.w,
                        margin: EdgeInsets.only(right: 7.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Color(0xff2C2B2B).withOpacity(.8)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '...More',
                                style: TextStyle(color: Color(0xff2CCAA0)),
                              ),
                              Image.asset('assets/images/more.png')
                            ],
                          ),
                        ),
                      ),
                    )
                ],
              ),
              SizedBox(
                height: 4.h,
              )
            ],
          ),
        ],
      ),
    );
  }
}
