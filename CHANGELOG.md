## 0.0.2

Updated GitHub media images.

## 0.0.1

Initial version of the package supporting these properties:

- **child**: child widget (normally a `Text` or `Icon`)
- **height**: height of the top layer
- **elevation**: elevation or "gap" between the top and bottom layer
- **hslColor**: color of the top layer. `HSLColor` is used instead of `Color` so that the bottom layer is automatically calculated by reducing the luminosity
- **shadow**: an optional shadow to make the button look better
- **onPressed**: button callback
