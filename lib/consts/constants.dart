import 'package:flutter/material.dart';

class ChartData {
  ChartData({this.x, this.y, this.y2});

  final double x;
  final double y;
  final double y2;
}

///Chart sample data
class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.eightsSeriesYValue,
      this.fifthSeriesYValue,
      this.fourthSeriesYValue,
      this.seventhSeriesYValue,
      this.sixthSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num thirdSeriesYValue;

  /// Holds y value of the datapoint(for 4th series)
  final num fourthSeriesYValue;

  /// Holds y value of the datapoint(for 5th series)
  final num fifthSeriesYValue;

  /// Holds y value of the datapoint(for 6th series)
  final num sixthSeriesYValue;

  /// Holds y value of the datapoint(for 7th series)
  final num seventhSeriesYValue;

  /// Holds y value of the datapoint(for 8th series)
  final num eightsSeriesYValue;

  /// Holds point color of the datapoint
  final Color pointColor;

  /// Holds size of the datapoint
  final num size;

  /// Holds datalabel/text value mapper of the datapoint
  final String text;

  /// Holds open value of the datapoint
  final num open;

  /// Holds close value of the datapoint
  final num close;

  /// Holds low value of the datapoint
  final num low;

  /// Holds high value of the datapoint
  final num high;

  /// Holds open value of the datapoint
  final num volume;
}
