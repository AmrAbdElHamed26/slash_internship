import 'package:get_it/get_it.dart';
import 'package:slash_task/product_details_module/data_layer/data_source/product_details_data_source.dart';
import 'package:slash_task/product_details_module/data_layer/repository/product_details_repo.dart';
import 'package:slash_task/product_details_module/domain_layer/use_cases/get_product_details_use_case.dart';
import 'package:slash_task/product_details_module/presentation_layer/controller/product_details_bloc.dart';

import '../product_details_module/domain_layer/repository/base_product_details_repo.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    /// blocs

    getIt.registerFactory<ProductDetailsBloc>(() => ProductDetailsBloc(getIt()));

    ///Use Cases

    getIt.registerLazySingleton(() => GetProductDetailsUseCase(getIt()));

    /// repo
    getIt.registerLazySingleton<BaseProductDetailsRepo>(() => ProductDetailsRepo(getIt()));

    /// data source 
    getIt.registerLazySingleton<BaseProductDetailsDataSource>(() => ProductDetailsDataSource());
  }
}
