import 'package:e_commerce_project/constants/text_themes/app_text_themes.dart';
import 'package:e_commerce_project/mock/mock_categories.dart';
import 'package:e_commerce_project/mock/mock_products.dart';
import 'package:e_commerce_project/services/cache/categories_cache.dart';
import 'package:e_commerce_project/services/cache/product_cache.dart';
import 'package:e_commerce_project/views/categories_view.dart';
import 'package:e_commerce_project/views/help_support_view.dart';
import 'package:e_commerce_project/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/helpers/loading_screen.dart';
import 'package:e_commerce_project/services/bloc/navigation_events.dart';
import 'package:e_commerce_project/services/bloc/navigation_states.dart';
import 'package:e_commerce_project/views/store/main_store_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'services/bloc/navigation_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CategoriesCache().initializeCache(mockCategories);
  ProductCache().initializeCache(mockProducts);
  runApp(
    MaterialApp(
      title: 'Charly\'s Hideout',
      home: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: const HomePage(),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: AppTextThemes.lightTextTheme),
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
          return const HomePageView();
        } else if (state is StoreState) {
          return const StoreView();
        } else if (state is CategoriesState) {
          return const CategoriesView();
        } else if (state is HelpSupportState) {
          return HelpSupportView();
        } else if (state is IsLoadingState) {
          return const LoadingScreen();
        } else {
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
