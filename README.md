# Pushable Button

A 3D pushable button. Ideal for important CTAs in the app.

![](media/pushable_button.gif)

## Usage

```dart
PushableButton(
  child: Text('ENROLL NOW', style: someTextStyle),
  height: 60,
  elevation: 8,
  hslColor: HSLColor.fromAHSL(1.0, 120, 1.0, 0.37),
  shadow: BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 5,
    blurRadius: 7,
    offset: Offset(0, 2),
  ),
  onPressed: () => setState(() => _selection = '2'),
)
```

## Configurable Properties

- **child**: child widget to show inside the button
- **height**: height of the top layer
- **elevation**: gap between the top and bottom layer
- **hslColor**: color of the top layer. `HSLColor` is used instead of `Color` so that the bottom layer is automatically calculated by reducing the luminosity
- **shadow**: which shadow to use
- **onPressed**: button callback

### [LICENSE: MIT](LICENSE.md)