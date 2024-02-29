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
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Please Input the url to lunch the webview'),
                const SizedBox(
                  height: 10,
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
                  height: 10,
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
                const Text('Please select the hardware acceleration'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('Hardware Acceleration'),
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
