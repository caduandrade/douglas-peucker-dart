
// Replaces the original Point class fromtthe original package, so to prevent name conflicts
// and also extensible to other types of points (e.g. LatLng) as long as they implement the
// IDpPoint interface.

abstract class IDpPoint {
  double get x;
  double get y;
}


class DpPoint implements IDpPoint {
  final double x;
  final double y;

  DpPoint(this.x, this.y);
  
  @override
  String toString() {
    return 'DpPoint(x: $x, y: $y)';
  }
}