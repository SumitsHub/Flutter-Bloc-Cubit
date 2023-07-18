part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  const WeatherLoaded(this.weather);

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    if (identical(this, other)) return true;

    return other is WeatherLoaded && other.weather == weather;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => weather.hashCode;
}

class WeatherError extends WeatherState {
  final String message;
  const WeatherError(this.message);

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    if (identical(this, other)) return true;

    return other is WeatherError && other.message == message;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => message.hashCode;
}
