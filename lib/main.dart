import 'package:e_commerce_project/views/store/categories_view.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/helpers/loading_screen.dart';
import 'package:e_commerce_project/services/bloc/navigation_events.dart';
import 'package:e_commerce_project/services/bloc/navigation_states.dart';
import 'package:e_commerce_project/views/store/main_store_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'services/bloc/navigation_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Charly Store',
      home: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: const HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NavigationBloc>().add(NavigateToHome());
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        if (state is HomeState) {
          return const MainStoreView();
        } else if (state is CategoriesState) {
          return CategoriesView();
        } else if (state is HelpSupportState) {
          return const Scaffold(
            body: Text('Not yet implemented!!'),
          );
        } else {
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
