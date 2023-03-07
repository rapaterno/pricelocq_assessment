import 'package:freezed_annotation/freezed_annotation.dart';

part 'time.freezed.dart';

@freezed
class Time with _$Time {
  const Time._();
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

  bool isStartOfDay() => hour == 0 && minute == 0 && second == 0;
  bool isEndOfDay() => hour == 23 && minute == 59 && second == 59;

  bool isBefore(Time time) {
    if (time.hour > hour) {
      return true;
    } else if (time.hour == hour && time.minute > minute) {
      return true;
    } else if (time.hour == hour &&
        time.minute == minute &&
        time.second > second) {
      return true;
    }

    return false;
  }

  String toFormattedString() {
    final minuteText = minute.toString().padLeft(2, '0');
    if (hour == 0) {
      return '12:${minuteText}AM';
    } else if (hour > 12) {
      return '${hour - 12}:${minuteText}PM';
    } else {
      return '$hour:${minuteText}AM';
    }
  }
}
