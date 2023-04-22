import 'dart:math';

import 'dp_point.dart';




class DouglasPeucker {
  /// polyline simplification  it uses a combination of Douglas-Peucker and Radial Distance algorithms.
  ///
  /// [points] List<Point>
  /// [tolerance] double tolerance
  /// [highestQuality] bool
  static List<T> simplify <T extends IDpPoint>(
    List<T> points,
    { double tolerance = 1, bool highestQuality = false }
  ) {
    if (points.length < 2) return points;

    final double sqTolerance = pow(tolerance, 2).toDouble();

    if (!highestQuality) points = simplifyRadialDistance(points, sqTolerance);
    
    points = simplifyDouglasPeucker(points, sqTolerance);

    return points;
  }


  static List<T> simplifyRadialDistance<T extends IDpPoint>(
    List<T> points,
    double sqTolerance
  ) {
    var prevPoint = points[0];
    List<T> newPoints = [];
    newPoints.add(prevPoint);
    T? point;

    for (T iPoint in points) {
      point = iPoint;
      if (getSquareDistance(point, prevPoint) > sqTolerance) {
        newPoints.add(point);
        prevPoint = point;
      }
    }

    if (prevPoint.x != point?.x && prevPoint.y != point?.y) {
      newPoints.add(point!);
    }

    return newPoints;
  }


  static getSquareDistance(IDpPoint p1, IDpPoint p2) {
    final dx = p1.x - p2.x;
    final dy = p1.y - p2.y;
    return pow(dx, 2) + pow(dy, 2);
  }


  static getSquareSegmentDistance(IDpPoint p, IDpPoint p1, IDpPoint p2) {
    var x = p1.x;
    var y = p1.y;
    var dx = p2.x - x;
    var dy = p2.y - y;
    if (dx != 0 || dy != 0) {
      final t = ((p.x - x) * dx + (p.y - y) * dy) / (dx * dx + dy * dy);
      if (t > 1) {
        x = p2.x;
        y = p2.y;
      } else if (t > 0) {
        x += dx * t;
        y += dy * t;
      }
    }
    dx = p.x - x;
    dy = p.y - y;
    return dx * dx + dy * dy;
  }


  static List<T> simplifyDouglasPeucker<T extends IDpPoint>(
    List<T> points, 
    double sqTolerance
  ) {
    final len = points.length;
    var markers = List<int?>.filled(len, null, growable: true);
    var first = 0;
    var last = len - 1;
    List<int> firstStack = [];
    List<int> lastStack = [];
    List<T> newPoints = [];

    markers[first] = markers[last] = 1;
    var index = 0;

    while (true) {
      double maxSqDist = 0;
      for (var i = first + 1; i < last; i++) {
        var sqDist =
            getSquareSegmentDistance(points[i], points[first], points[last]);

        if (sqDist > maxSqDist) {
          index = i;
          maxSqDist = sqDist;
        }
      }

      if (maxSqDist > sqTolerance) {
        markers[index] = 1;

        firstStack.add(first);
        lastStack.add(index);
        firstStack.add(index);
        lastStack.add(last);
      }

      if (firstStack.length == 0 || lastStack.length == 0) {
        break;
      }

      first = firstStack.removeLast();
      last = lastStack.removeLast();
    }

    for (var i = 0; i < len; i++) {
      if (markers[i] != null) {
        newPoints.add(points[i]);
      }
    }

    return newPoints;
  }
}
