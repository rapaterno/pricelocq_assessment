import 'package:freezed_annotation/freezed_annotation.dart';

part 'time.freezed.dart';

@freezed
class Time with _$Time {
  const factory Time(
      {required int hour, required int minute, required int second}) = _Time;

  /// Given input [text] should be in the format [HH:MM:SS]
  factory Time.from24HrFormat(String text) {
    try {
      final timeParts = text.split(':');
      final hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts[1]);
      final second = int.parse(timeParts[2]);
      return Time(hour: hour, minute: minute, second: second);
    } catch (e) {
      return const Time(hour: 0, minute: 0, second: 0);
    }
  }
}
