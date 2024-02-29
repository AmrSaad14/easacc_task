import 'package:easacc_task/features/webview/logic/web_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late String link;

  final WebViewController webViewcontroller = WebViewController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WebViewCubit>().getLink(webViewController: webViewcontroller);
    // webViewcontroller.loadRequest(context.read<WebViewCubit>().webUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'WebView',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<WebViewCubit, WebViewState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(child: WebViewWidget(controller: webViewcontroller)),
            ],
          );
        },
      ),
    );
  }
}
