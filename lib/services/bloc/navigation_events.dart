import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class IsLoading extends NavigationEvent {}

class NavigateToHome extends NavigationEvent {}

class NavigateToStore extends NavigationEvent {
  final String categoryId;

  const NavigateToStore({required this.categoryId});

  @override
  List<Object> get props => [categoryId];
}

class NavigateToCategories extends NavigationEvent {}

class NavigateToHelpSupport extends NavigationEvent {}
