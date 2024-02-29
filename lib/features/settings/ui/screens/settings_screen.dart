import 'package:app_settings/app_settings.dart';
import 'package:easacc_task/features/settings/logic/cubit/settings_cubit.dart';
import 'package:easacc_task/features/webview/ui/screens/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Settings',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                const Text('Please Input the url to lunch the webview',style: TextStyle(color: Colors.blue,fontSize: 16),),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: context.read<SettingsCubit>().urlController,
                  onChanged: (value) {
                    if (value.length > 3) {
                      context.read<SettingsCubit>().saveLink();
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: 'Enter URL to display',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const WebViewScreen(),
                      ));
                    },
                    child: const Text('Go to webview'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Please select a hardware to access',style: TextStyle(color: Colors.blue,fontSize: 16),),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Hardware accessing',style: TextStyle(color: Colors.blue,fontSize: 16),),
                    SizedBox(width: 15,),
                    DropdownButton(
                        onChanged: (value) {
                          if (value == 'wifi') {
                            AppSettings.openAppSettings(
                                type: AppSettingsType.wifi);
                          }
                          if (value == 'Bluetooth') {
                            AppSettings.openAppSettings(
                                type: AppSettingsType.bluetooth);
                          }
                        },
                        items: const [
                          DropdownMenuItem(
                            value: 'wifi',
                            child: Text('WiFi'),
                          ),
                          DropdownMenuItem(
                            value: 'Bluetooth',
                            child: Text('Bluetooth'),
                          )
                        ]),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
