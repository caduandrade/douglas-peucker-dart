import 'package:douglas_peucker/douglas_peucker.dart';
import 'package:test/test.dart';



void main() {
  group('Douglas Peeucker Test', () {

    test('Empty points', () {
      List<DpPoint> points = [];
      final newPolyline = DouglasPeucker.simplify(points);
      expect(newPolyline.length, 0);
    });

    test('One point', () {
      List<DpPoint> points = [DpPoint(0, 0)];
      final newPolyline = DouglasPeucker.simplify(points);
      expect(newPolyline.length, 1);
    });

    test('Two points', () {
      List<DpPoint> points = [DpPoint(0, 0), DpPoint(1, 1)];
      final newPolyline = DouglasPeucker.simplify(points);
      expect(newPolyline.length, 2);
    });

    // Straight line
    test('Straight line', () {
      List<DpPoint> points = [];

      for (int i = 0; i <= 50; i++) points.add(DpPoint(i.toDouble(), i.toDouble()));

      final newPolyline = DouglasPeucker.simplify(points);
      expect(newPolyline.length, 2);
      expect(newPolyline[0].x, 0);
      expect(newPolyline[0].y, 0);
      expect(newPolyline[1].x, 50);
      expect(newPolyline[1].y, 50);
    });
  });
}
