// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/post/post_cubit.dart' as _i6;
import '../data/external/post_api.dart' as _i7;
import '../data/repository/post_api_adapter.dart' as _i8;
import '../domain/repository/post_repository.dart' as _i5;
import '../domain/use_case/post_service.dart' as _i4;
import 'app_config.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AppConfig>(() => _i3.AppConfig());
  gh.factory<_i4.PostService>(
      () => _i4.PostService(postRepository: get<_i5.PostRepository>()));
  gh.factory<_i6.PostCubit>(
      () => _i6.PostCubit(postService: get<_i4.PostService>()));
  gh.singleton<_i7.PostApi>(_i7.PostApi(appConfig: get<_i3.AppConfig>()));
  gh.singleton<_i5.PostRepository>(
      _i8.PostApiAdapter(postApi: get<_i7.PostApi>()));
  return get;
}
