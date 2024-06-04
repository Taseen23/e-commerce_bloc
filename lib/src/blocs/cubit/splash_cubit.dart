import 'package:bloc/bloc.dart';
import 'package:e_commerce_bloc/src/data/repository/productrepository.dart';
import 'package:e_commerce_bloc/src/data/repository/storerepository.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  ProductRepository repository = ProductRepository();

  Future<void> startSplash() async {
    await repository.createNewProducts();
    Future.delayed(const Duration(seconds: 2), () {
      emit(SplashEnd());
    });
  }
}
