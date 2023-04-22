
import 'package:douglas_peucker/douglas_peucker.dart';


void main() {
  List<DpPoint> points = [];

  points.add(DpPoint(0,-1));
  points.add(DpPoint(0,0));
  points.add(DpPoint(1,3));
  points.add(DpPoint(4,6));
  points.add(DpPoint(10,9));

  final newPolyline = DouglasPeucker.simplify(
    points,
    tolerance: 0.0004,
    highestQuality:false
  );

  newPolyline.forEach((element) { 
    print('x: ${element.x}, y: ${element.y}');
  });
}