import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/drop1_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> list = ['One', 'Two', 'Three', 'Four'];
  late String dropdownValue = 'Select';

  Drop1Bloc drop1bloc = Drop1Bloc();
  Drop1Bloc drop2bloc = Drop1Bloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    drop1bloc.add(Drop1LoadedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer(
            bloc: drop1bloc,
            listenWhen: (p, c) => c is Drop1ActionState,
            buildWhen: (p, c) => c is! Drop1ActionState,
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is Drop1InitialState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Drop1LoadedState) {
                return DropdownMenu<String>(
                  hintText: state.selectedDrop1,
                  // initialSelection: state.categories[0],
                  onSelected: (String? value) {
                    drop2bloc.add(Drop1SelectedEvent(value!));
                  },
                  dropdownMenuEntries: state.categories.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(value: value, label: value);
                  }).toList(),
                );
              } else if (state is Drop1ErrorState) {
                return const ColoredBox(color: Colors.red);
              } else {
                return const Text('error');
              }
            },
          ),
          BlocBuilder(
            bloc: drop2bloc,
            builder: (context, state) {
              if (state is Drop2SelectedState) {
                return DropdownMenu<String>(
                  initialSelection: state.subCategories[0],
                  // onSelected: (String? value) {
                  //   drop1bloc.add(Drop1SelectedEvent(value!));
                  // },
                  dropdownMenuEntries: state.subCategories.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(value: value, label: value);
                  }).toList(),
                );
              } else {
                return Text('rrrrr');
              }
            },
          ),
        ],
      ),
    );
  }
}
