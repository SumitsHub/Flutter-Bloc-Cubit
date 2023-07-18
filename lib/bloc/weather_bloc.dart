import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_cubit_tutorial/data/model/weather.dart';
import 'package:block_cubit_tutorial/data/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is GetWeather) {
        emit(WeatherLoading());
        try {
          final weather = await _weatherRepository.fetchWeather(event.cityName);
          emit(WeatherLoaded(weather));
        } on NetworkException {
          emit(WeatherError('Failed to fetch'));
        }
      }
    });
  }
}
