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
  const StoreState();
}

class CategoriesState extends NavigationState {
  const CategoriesState();
}

class HelpSupportState extends NavigationState {
  const HelpSupportState();
}
