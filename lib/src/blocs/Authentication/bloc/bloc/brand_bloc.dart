import 'package:bloc/bloc.dart';
import 'package:e_commerce_bloc/src/data/models/brand_model.dart';
import 'package:equatable/equatable.dart';

part 'brand_event.dart';
part 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  BrandBloc() : super(BrandInitial()) {
    on<BrandEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
