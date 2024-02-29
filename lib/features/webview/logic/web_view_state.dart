part of 'web_view_cubit.dart';

@immutable
abstract class WebViewState {}

class WebViewInitial extends WebViewState {}

class WebViewLoading extends WebViewState {}

class WebViewSuccess extends WebViewState {}

class WebViewError extends WebViewState {}