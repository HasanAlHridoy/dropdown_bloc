part of 'drop1_bloc.dart';

@immutable
abstract class Drop1State {}

abstract class Drop1ActionState extends Drop1State {}

class Drop1InitialState extends Drop1State {}

class Drop1LoadedState extends Drop1State {
  final List<String> categories;
  final String selectedDrop1;
  Drop1LoadedState(this.categories, this.selectedDrop1);
}

class Drop2SelectedState extends Drop1State {
  final List<String> subCategories;
  final String selectedDrop2;
  Drop2SelectedState(this.subCategories, this.selectedDrop2);
}

class Drop3SelectedState extends Drop1State {
  final List<String> sub2Categories;
  final String selectedDrop3;
  Drop3SelectedState(this.sub2Categories, this.selectedDrop3);
}

class Drop1ErrorState extends Drop1State {}
