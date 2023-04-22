# Douglas Peucker Dart

Polyline simplification library for dart projects like flutter.

Original Author: **[Darwin Morocho](https://github.com/darwin-morocho/douglas-peucker-dart)**

Null-safety fork by **[Carlos Eduardo Leite de Andrade](https://github.com/caduandrade/douglas-peucker-dart)**

Extracted from PHP: **[AKeN / simplify-php](https://github.com/AKeN/simplify-php)** (by Rotari Gheorghe)

---

## **HOW TO USE**

For the most basic use case, pass a list of `DpPoint`s (stands for Douglas Peucker points) to the static `simplify` method of `DouglasPeucker` class, optionally specifying the `tolerance` (epsilon) and `highestQuality` (defaults to `false`).

 ```dart
 import 'package:douglas_peucker/douglas_peucker.dart';

...

List<DpPoint> points = [];

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
```

Or if you want to use your own custom point class, you can have your custom class implement the `DpPoint` interface.

```dart
import 'package:douglas_peucker/douglas_peucker.dart';

class MyTripPoints implements IDpPoint {
    final double locX;
    final double locY;

    MyTripPoints(this.locX, this.locY);

    // Implement the x and y getters
    @override
    double get x => locX;
    @override
    double get y => locY;

    @override
    String toString() {
        return 'MyTripPoints(x: $locX, y: $locY)';
    }
}
```

Then you can use your custom class as follows:

```dart
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
```