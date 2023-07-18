import 'package:bloc/bloc.dart';
import 'package:block_cubit_tutorial/data/model/weather.dart';
import 'package:block_cubit_tutorial/data/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;
  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async {
    emit(WeatherLoading());
    try {
      final weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } on NetworkException {
      emit(WeatherError('Failed to fetch'));
    }
  }
}
