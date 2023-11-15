import 'package:flutter/material.dart';

@immutable
class ServiceTimeFrame {
  final int? startTime;
  final int? endTime;

  const ServiceTimeFrame({
    this.startTime,
    this.endTime,
  });

  factory ServiceTimeFrame.fromJson(Map<String, dynamic> json) => ServiceTimeFrame(
        startTime: json["startTime"],
        endTime: json["endTime"],
      );

  Map<String, dynamic> toJson() => {
        "startTime": startTime,
        "endTime": endTime,
      };

  factory ServiceTimeFrame.empty() => const ServiceTimeFrame();
}
