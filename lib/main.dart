import 'package:can_watering/data/database.dart';
import 'package:can_watering/domain/bloc/plant_bloc.dart';
import 'package:can_watering/locator.dart';
import 'package:can_watering/presentation/page/home_page.dart';
import 'package:can_watering/presentation/screen/loading_screen.dart';
import 'package:can_watering/presentation/screen/unknown_state_screen.dart';
import 'package:can_watering/service/screen_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  registerServices();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlantBloc(
        locator<Database>(),
        locator<ScreenService>(),
      ),
      child: MaterialApp(
        navigatorKey: locator<ScreenService>().navigatorKey,
        scaffoldMessengerKey: locator<ScreenService>().messengerKey,
        title: 'Can Watering',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Builder(builder: (context) {
          return BlocBuilder(
            bloc: context.read<PlantBloc>(),
            builder: (context, state) {
              if (state is LoadingState) {
                return const LoadingScreen();
              } else if (state is HomeState) {
                return HomePage(plants: state.plants);
              }
              return const UnknownStateScreen();
            },
            buildWhen: (previous, current) {
              return (current is LoadingState || current is HomeState);
            },
          );
        }),
      ),
    );
  }
}
