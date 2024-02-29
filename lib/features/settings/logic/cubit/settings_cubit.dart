import 'package:bloc/bloc.dart';
import 'package:easacc_task/core/helpers/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  TextEditingController urlController = TextEditingController();
  void saveLink() async {
    try {
      await SharedPrefHelper().setUrl(urlController.text);
      debugPrint('url saved');
    } catch (e) {
      debugPrint(e.toString());
    }

    emit(GetLinkSuccess());
  }
}
