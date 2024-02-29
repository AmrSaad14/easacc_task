import 'package:easacc_task/features/settings/ui/screens/settings_screen.dart';
import 'package:easacc_task/features/webview/ui/screens/webview_screen.dart';
import 'package:easacc_task/features/login_screen/logic/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SettingsScreen()));
          }
          if (state is LoginFailed) {
            const snackbar = SnackBar(content: Text('Something went wrong'));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login using your social accounts',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await context.read<LoginCubit>().signInWithGoogle();
                  },
                  child: const Text('Login in with Google'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const WebViewScreen()));
                  },
                  child: const Text('Login in with Facebook'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
