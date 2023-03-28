import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_1/models/model.dart';
import 'package:proj_1/state/home_cubit.dart';

class BeerCubit extends Cubit<List<Beer>> {
  final BeerRepository _repository = BeerRepository();

  BeerCubit() : super([]);

  void getAles() async {
    try {
      final beers = await _repository.getAles();
      emit(beers);
    // ignore: empty_catches
    } catch (error) {
      
    }
  }
}