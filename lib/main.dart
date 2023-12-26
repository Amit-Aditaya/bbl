import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/cubit/internet/internet_cubit.dart';
import 'package:flutter_babuland_app/custom_classes/hive_box_utils.dart';
import 'package:flutter_babuland_app/data/model/current_user.dart';
import 'package:flutter_babuland_app/data/model/running_ticket_counter.dart';
import 'package:flutter_babuland_app/firebase_options.dart';
import 'package:flutter_babuland_app/router/app_router.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/views/internet_loading_page.dart';
import 'package:flutter_babuland_app/views/new_login_page.dart';
import 'package:flutter_babuland_app/views/no_internet_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_version/new_version.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  //Hive
  Hive.registerAdapter(CurrentUserAdapter());
  HiveBoxUtils.box = await Hive.openBox('currentUserBox');
  Hive.registerAdapter(RunningTicketCounterAdapter());
  await Hive.openBox<RunningTicketCounter>('running_ticket_counter');

  //DotEnv
  await dotenv.load(fileName: ".env");

  //Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runApp(BabulandApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class BabulandApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;
  const BabulandApp({
    Key? key,
    required this.appRouter,
    required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
      ],
      child: App(),
    );
  }
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    CurrentUser? currentUser = HiveBoxUtils.box.get('user_current');
    if (currentUser == null) {
      auth.signOut();
    }

    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state) {
        if (state is InternetLoading) {
          return const InternetLoadingPage();
        } else if (state is InternetConnected) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: AppColors.primaryColor,
                fontFamily: 'Poppins',
                textTheme: const TextTheme(
                  bodyText1: TextStyle(color: Colors.green),
                  bodyText2: TextStyle(
                    color: Colors.black,
                  ),
                )),
            onGenerateRoute: AppRouter.onGenerateRoute,
          );
        } else {
          return const NoInternetPage();
        }
      },
    );
  }
}
