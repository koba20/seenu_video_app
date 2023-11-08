import 'package:flutter/material.dart';
import 'package:seequl/provider/viewprovider.dart';
import 'package:seequl/screens/bottomnavbar/bottomnavbar.dart';
import 'package:seequl/screens/homescreens/homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ViewProvider()),
      ],
      child: ScreenUtilInit(
          useInheritedMediaQuery: true,
          designSize: const Size(414, 896),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                // scaffoldBackgroundColor: Color(kLight.value),
                // iconTheme: IconThemeData(color: Color(kDark.value)),
                //primarySwatch: Colors.grey,
                fontFamily: GoogleFonts.roboto().fontFamily,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.white,
                  surface: Colors.white,
                  surfaceTint: Colors.white,
                ),
                useMaterial3: true,
              ),
              home: const RootPage(),
            );
          }),
    );
  }
}
