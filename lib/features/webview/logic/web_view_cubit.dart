import 'package:bloc/bloc.dart';
import 'package:easacc_task/core/helpers/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'web_view_state.dart';

class WebViewCubit extends Cubit<WebViewState> {
  WebViewCubit() : super(WebViewInitial());

  Uri webUrl = Uri.parse('https://www.google.com/');

  void getLink({
    required WebViewController webViewController,
  }) async {
    emit(WebViewLoading());
    debugPrint('getting link');
    debugPrint('the saved link is ${await SharedPrefHelper().getUrl() ?? ''}');
    String link =
        await SharedPrefHelper().getUrl() ?? 'https://www.google.com/';
    debugPrint('the saved link is2 $link');
    webUrl = Uri.parse(link);
    webViewController.loadRequest(webUrl);
    emit(WebViewSuccess());
  }
}
