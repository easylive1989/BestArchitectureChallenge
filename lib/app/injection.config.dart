// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/remote/post_api.dart' as _i6;
import '../data/repository/sorted_post_repository.dart' as _i7;
import '../domain/bloc/post_cubit.dart' as _i4;
import '../domain/repository/post_repository.dart' as _i5;
import 'app_config.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AppConfig>(() => _i3.AppConfig());
  gh.factory<_i4.PostCubit>(
      () => _i4.PostCubit(postRepository: get<_i5.PostRepository>()));
  gh.singleton<_i6.PostApi>(_i6.PostApi(appConfig: get<_i3.AppConfig>()));
  gh.singleton<_i5.PostRepository>(
      _i7.SortedPostRepository(postApi: get<_i6.PostApi>()));
  return get;
}
