import 'package:flutter/material.dart';
import 'package:frontend/services/bloc/navigation_events.dart';
import 'package:frontend/services/bloc/navigation_states.dart';
import 'package:frontend/views/store/main_store_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
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
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NavigationBloc>().add(NavigateToHome());
    return BlocConsumer<NavigationBloc, NavigationState>(
      listener: (context, state) {
        if (state.isLoading) {
          // TODO show loading screen
        } else {
          // TODO hide loading screen
        }
      },
      builder: (context, state) {
        if (state is HomeState) {
          return const MainStoreView();
        } else if (state is CategoriesState) {
          return const CategoriesView();
        } else if (state is HelpSupportState) {
          return const HelpSupportView();
        } else {
          return const Scaffold(
            body: CircularProgressIndicator(),
          )
        }
      },
    );
  }
}
