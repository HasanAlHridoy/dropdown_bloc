import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dropdown_bloc/data.dart';
import 'package:meta/meta.dart';

part 'drop1_event.dart';
part 'drop1_state.dart';

class Drop1Bloc extends Bloc<Drop1Event, Drop1State> {
  Drop1Bloc() : super(Drop1InitialState()) {
    on<Drop1LoadedEvent>((event, emit) async {
      Map<String, List<Map>> drop1 = await fromApi();
      emit(Drop1InitialState());
      List<String> categoryList = [];
      for (var element in drop1.values) {
        for (var element1 in element) {
          categoryList.add(element1.keys.first);
        }
      }
      await Future.delayed(const Duration(seconds: 2));
      emit(Drop1LoadedState(categoryList, 'Select'));
    });
    on<Drop1SelectedEvent>((event, emit) async {
      Map<String, List<Map>> drop2 = await fromApi();
      List<String> subCategoryList = [];
      for (var i in drop2['categories']!) {
        if (i[event.key] != null) {
          for (var e in i[event.key]) {
            subCategoryList.add(e.keys.first);
          }
        }
      }
      emit(Drop2SelectedState(subCategoryList, 'Select'));
    });
  }
}
