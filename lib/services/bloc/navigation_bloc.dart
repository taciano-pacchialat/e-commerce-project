import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_events.dart';
import 'navigation_states.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const HomeState()) {
    on<NavigateToHome>((event, emit) => emit(const HomeState()));

    on<NavigateToStore>(
      (event, emit) => emit(StoreState(categoryId: event.categoryId)),
    );

    on<NavigateToCategories>((event, emit) => emit(const CategoriesState()));

    on<NavigateToHelpSupport>((event, emit) => emit(const HelpSupportState()));

    on<IsLoading>((event, emit) => emit(const IsLoadingState()));
  }
}
