import 'package:bloc/bloc.dart';
import 'package:e_commerce_bloc/src/data/repository/storerepository.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  StoreRepository repository = StoreRepository();

  Future<void> startSplash() async {
    repository.createNewBrand();

    Future.delayed(const Duration(seconds: 2), () {
      emit(SplashEnd());
    });
  }
}
