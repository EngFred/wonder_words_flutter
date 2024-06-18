import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:wonder_words/core/theme/bloc/theme_bloc_event.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(ThemeData.light()) {
    on<SelectedLightTheme>(_selectLightTheme);
    on<SelectedDarkTheme>(_selectDarkTheme);
  }

  // ThemeMode get currentThemeMode {
  //   if (state.brightness == Brightness.light) {
  //     return ThemeMode.light;
  //   } else if (state.brightness == Brightness.dark) {
  //     return ThemeMode.dark;
  //   } else {
  //     return ThemeMode.system;
  //   }
  // }

  ThemeData get currentThemeMode {
    if (state.brightness == Brightness.light) {
      return ThemeData.light();
    } else {
      return ThemeData.dark();
    }
  }

  void _selectLightTheme(SelectedLightTheme event, Emitter<ThemeData> emit) {
    if (state.brightness != Brightness.light) {
      emit(ThemeData.light());
    }
  }

  void _selectDarkTheme(SelectedDarkTheme event, Emitter<ThemeData> emit) {
    if (state.brightness != Brightness.dark) {
      emit(ThemeData.dark());
    }
  }

  @override
  ThemeData? fromJson(Map<String, dynamic> json) {
    try {
      final isLightTheme = json['isLightTheme'] as bool;
      return isLightTheme ? ThemeData.light() : ThemeData.dark();
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeData state) {
    try {
      return {'isLightTheme': state.brightness == Brightness.light};
    } catch (_) {
      return null;
    }
  }
}
