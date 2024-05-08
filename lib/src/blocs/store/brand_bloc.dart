import 'package:bloc/bloc.dart';
import 'package:e_commerce_bloc/src/data/models/brand_model.dart';
import 'package:equatable/equatable.dart';

import '../../data/repository/storerepository.dart';

part 'brand_event.dart';
part 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  StoreRepository repository;
  BrandBloc(this.repository) : super(BrandInitial()) {
    on<FetchBrands>(
      (event, emit) async {
        try {
          final brands = await repository.fetchBrands();
          emit(BrandFetchSuccess(brands));
        } catch (e) {
          emit(const BrandFetchFailed('Failed to load Brands'));
        }
      },
    );
  }
}
