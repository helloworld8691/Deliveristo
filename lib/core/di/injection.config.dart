// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:deliveristo/core/data/network/api_helper.dart' as _i3;
import 'package:deliveristo/core/data/network/repository/dog_repo.dart' as _i8;
import 'package:deliveristo/core/di/app_module.dart' as _i9;
import 'package:deliveristo/core/routers/route.dart' as _i4;
import 'package:deliveristo/ui/dashboard/interactor.dart' as _i5;
import 'package:deliveristo/ui/dashboard/viewmodel.dart' as _i6;
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.APIHelper>(() => _i3.APIHelper());
    gh.singleton<_i4.AppRouter>(_i4.AppRouter());
    gh.factory<_i5.DashboardInteractor>(() => _i5.DashboardInteractor());
    gh.factory<_i6.DashboardViewModel>(() => _i6.DashboardViewModel());
    gh.lazySingleton<_i7.Dio>(() => appModule.dio);
    gh.factory<_i8.DogRepo>(() => _i8.DogRepoImp());
    return this;
  }
}

class _$AppModule extends _i9.AppModule {}
