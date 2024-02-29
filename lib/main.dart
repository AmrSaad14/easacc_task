import 'package:easacc_task/features/settings/logic/cubit/settings_cubit.dart';
import 'package:easacc_task/features/webview/logic/web_view_cubit.dart';
import 'package:easacc_task/features/login_screen/logic/login_cubit.dart';
import 'package:easacc_task/features/login_screen/ui/screens/login_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:easacc_task/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => WebViewCubit(),
        ),
        BlocProvider(
          create: (context) => SettingsCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Easacc Task',
        home: LoginScreen(),
      ),
    );
  }
}
