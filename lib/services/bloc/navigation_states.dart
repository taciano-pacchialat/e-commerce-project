import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class IsLoadingState extends NavigationState {
  const IsLoadingState();
}

class HomeState extends NavigationState {
  const HomeState();
}

class StoreState extends NavigationState {
  final String categoryId;
  const StoreState({required this.categoryId});

  @override
  List<Object> get props => [categoryId];
}

class CategoriesState extends NavigationState {
  const CategoriesState();
}

class HelpSupportState extends NavigationState {
  const HelpSupportState();
}
