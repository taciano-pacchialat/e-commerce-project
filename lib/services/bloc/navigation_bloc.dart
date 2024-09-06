import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_events.dart';
import 'navigation_states.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const HomeState(isLoading: false)) {
    on<NavigateToHome>(
        (event, emit) => emit(const HomeState(isLoading: false)));
    on<NavigateToCategories>(
        (event, emit) => emit(const CategoriesState(isLoading: false)));
    on<NavigateToHelpSupport>(
        (event, emit) => emit(const HelpSupportState(isLoading: false)));
    on<NavigateToProductDetail>(
        (event, emit) => emit(ProductDetailState(event.productId)));
  }
}
