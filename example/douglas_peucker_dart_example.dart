import 'package:douglas_peucker/douglas_peucker.dart';


// Custom Point class which implements IDpPoint interface
class MyTripPoints implements IDpPoint {
  final double locX;
  final double locY;

  MyTripPoints(this.locX, this.locY);

  @override
  double get x => locX;
  @override
  double get y => locY;

  @override
  String toString() {
    return 'MyTripPoints(x: $locX, y: $locY)';
  }
}



void main() {

  // > Using provided DpPoint class
  List<DpPoint> points = [
    DpPoint(0,-1),
    DpPoint(0,0),
    DpPoint(1,3),
    DpPoint(4,6),
    DpPoint(10,9)
  ];

  List<DpPoint> newPolyline = DouglasPeucker.simplify(
    points,
    tolerance: 1, 
    highestQuality:false
  );

  newPolyline.forEach(print);


  // > Using custom Point class with IDpPoint interface
  List<MyTripPoints> myPoints = [
    MyTripPoints(0,-1),
    MyTripPoints(0,0),
    MyTripPoints(1,3),
    MyTripPoints(4,6),
    MyTripPoints(10,9)
  ];

  List<MyTripPoints> newMyPolyline = DouglasPeucker.simplify(
    myPoints,
    tolerance: 1, 
    highestQuality:false
  );

  newMyPolyline.forEach(print);
}
