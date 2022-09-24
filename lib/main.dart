import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testapp/training_project/layout/app_layout.dart';
import 'package:testapp/training_project/layout/cubit/cubit.dart';
import 'package:testapp/training_project/layout/cubit/states.dart';
import 'package:testapp/training_project/login/login_screen.dart';
import 'package:testapp/widgets/dio_helper.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _initalization = Firebase.initializeApp();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (BuildContext context, Widget? child) {
        return BlocProvider(
          create: (context) => ShopCubit()..getCategories(),
          child: BlocConsumer<ShopCubit, ShopStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return FutureBuilder(
                  future: _initalization,
                  builder: (context, snapshot) {
                    return MaterialApp(
                      theme: ThemeData(
                        appBarTheme: const AppBarTheme(
                          backgroundColor: Colors.white,
                          elevation: 0.0,
                          titleTextStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      debugShowCheckedModeBanner: false,
                      home: const LoginScreen(),
                    );
                  });
            },
          ),
        );
      },
    );
  }
}
