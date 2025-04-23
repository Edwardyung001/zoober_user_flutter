import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';
import 'package:zooberuserapp/UserApp/Splashscreen/ui/splashscreen.dart';
import 'package:zooberuserapp/UserApp/auth/data/datasource/login_datasoure.dart';
import 'package:zooberuserapp/UserApp/auth/data/datasource/signup_datasource.dart';
import 'package:zooberuserapp/UserApp/auth/data/repository/login_repository_impl.dart';
import 'package:zooberuserapp/UserApp/auth/data/repository/signup_repository_impl.dart';
import 'package:zooberuserapp/UserApp/auth/domain/usecase/login_usecase.dart';
import 'package:zooberuserapp/UserApp/auth/domain/usecase/signup_usecase.dart';
import 'package:zooberuserapp/UserApp/home/ui/data/datasource/favourite_datasource.dart';
import 'package:zooberuserapp/UserApp/home/ui/data/datasource/fetching_favourite_datasource.dart';
import 'package:zooberuserapp/UserApp/home/ui/data/datasource/fetching_profile_datasource.dart';
import 'package:zooberuserapp/UserApp/home/ui/data/datasource/update_profile_datasource.dart';
import 'package:zooberuserapp/UserApp/home/ui/data/repository/favourite_repository.dart';
import 'package:zooberuserapp/UserApp/home/ui/data/repository/fetching_favourite_repository_impl.dart';
import 'package:zooberuserapp/UserApp/home/ui/data/repository/fetching_profile_repository_impl.dart';
import 'package:zooberuserapp/UserApp/home/ui/data/repository/update_profile_repository_impl.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/usecase/favourite_usecase.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/usecase/fetching_favourite_usecase.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/usecase/fetching_profile_usecase.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/usecase/update_profile_usecase.dart';
import 'package:zooberuserapp/UserApp/home/ui/presentation/bloc/home_bloc.dart';
import 'package:zooberuserapp/network/api_connection.dart';
import 'UserApp/auth/presentation/bloc/auth_bloc.dart';
import 'UserApp/home/ui/presentation/screen/profilescreen.dart' show ProfileScreen;
import 'constants/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final dioClient = DioClient(dio);
    final signupDatasource = SignupDatasource(dioClient);
    final signupRepository = SignupRepositoryImpl(signupDatasource);
    final signupUseCase = SignupUseCase(signupRepository);
    final loginDatasource = LoginDatasource(dioClient);
    final loginRepository = LoginRepositoryImpl(loginDatasource);
    final loginUseCase = LoginUseCase(loginRepository);
    final fetchingProfileDatasource = FetchingProfileDatasource(dioClient);
    final fetchingProfileRepository = FetchingProfileRepositoryImpl(fetchingProfileDatasource);
    final fetchingProfileUseCase = FetchingProfileUseCase(fetchingProfileRepository);
    final favouriteDatasource = FavouriteDatasource(dioClient);
    final favouriteRepository = FavouriteRepositoryImpl(favouriteDatasource);
    final favouriteUseCase = FavouriteUseCase(favouriteRepository);
    final updateProfileDatasource = UpdateProfileDatasource(dioClient);
    final updateProfileRepository = UpdateProfileRepositoryImpl(updateProfileDatasource);
    final updateProfileUseCase = UpdateProfileUseCase(updateProfileRepository);
    final fetchingFavouriteDatasource = FetchingFavouriteDatasource(dioClient);
    final fetchingFavouriteRepository = FetchingFavouriteRepositoryImpl(fetchingFavouriteDatasource);
    final fetchingFavouriteUseCase = FetchingFavouriteUseCase(fetchingFavouriteRepository);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(signupUseCase,loginUseCase),
        ),
        BlocProvider(
          create: (_) => HomeBloc(favouriteUseCase,updateProfileUseCase,fetchingProfileUseCase,fetchingFavouriteUseCase),
        ),
        // Add other BLoCs here if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zoober Ride App',
        theme: ThemeData(
          primaryColor: white,
          scaffoldBackgroundColor: const Color.fromARGB(255, 245, 245, 245),
          textTheme: GoogleFonts.mulishTextTheme(),
          useMaterial3: true,
        ),
        home: const Splashscreen(),
      ),
    );
  }
}
