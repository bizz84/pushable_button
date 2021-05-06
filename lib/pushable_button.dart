library pushable_button;

import 'package:flutter/material.dart';

import 'animation_controller_state.dart';

class PushableButton extends StatefulWidget {
  const PushableButton({
    Key? key,
    this.child,
    required this.hsvColor,
    //required this.bottomColor,
    required this.height,
    this.elevation = 8.0,
    this.shadow,
    this.onPressed,
  })  : assert(height > 0),
        super(key: key);
  final Widget? child;
  final HSVColor hsvColor;
  //final Color bottomColor;
  final double height;
  final double elevation;
  final BoxShadow? shadow;
  final VoidCallback? onPressed;

  @override
  _PushableButtonState createState() =>
      _PushableButtonState(Duration(milliseconds: 100));
}

class _PushableButtonState extends AnimationControllerState<PushableButton> {
  _PushableButtonState(Duration duration) : super(duration);

  bool _isDragInProgress = false;
  Offset _gestureLocation = Offset.zero;

  void _handleTapDown(TapDownDetails details) {
    //print('tap down: ${details.localPosition}');
    _gestureLocation = details.localPosition;
    animationController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    //print('tap up: ${details.localPosition}');
    animationController.reverse();
    widget.onPressed?.call();
  }

  void _handleTapCancel() {
    //print('tap cancel');
    Future.delayed(Duration(milliseconds: 100), () {
      if (!_isDragInProgress) {
        animationController.reverse();
      }
    });
  }

  void _handleDragStart(DragStartDetails details) {
    //print(
    //    'drag start (in progress: $_isDragInProgress): ${details.localPosition}');
    _gestureLocation = details.localPosition;
    _isDragInProgress = true;
    animationController.forward();
  }

  void _handleDragEnd(Size buttonSize) {
    //print('drag end (in progress: $_isDragInProgress)');
    if (_isDragInProgress) {
      _isDragInProgress = false;
      animationController.reverse();
    }
    if (_gestureLocation.dx >= 0 &&
        _gestureLocation.dy < buttonSize.width &&
        _gestureLocation.dy >= 0 &&
        _gestureLocation.dy < buttonSize.height) {
      widget.onPressed?.call();
    }
  }

  void _handleDragCancel() {
    //print('drag cancel (in progress: $_isDragInProgress)');
    if (_isDragInProgress) {
      _isDragInProgress = false;
      animationController.reverse();
    }
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    //print('horizontal drag update: ${details.localPosition}');
    _gestureLocation = details.localPosition;
  }

  @override
  Widget build(BuildContext context) {
    final totalHeight = widget.height + widget.elevation;
    return SizedBox(
      height: totalHeight,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final buttonSize = Size(constraints.maxWidth, constraints.maxHeight);
          return GestureDetector(
            onTapDown: _handleTapDown,
            onTapUp: _handleTapUp,
            onTapCancel: _handleTapCancel,
            onHorizontalDragStart: _handleDragStart,
            onHorizontalDragEnd: (_) => _handleDragEnd(buttonSize),
            onHorizontalDragCancel: _handleDragCancel,
            onHorizontalDragUpdate: _handleDragUpdate,
            onVerticalDragStart: _handleDragStart,
            onVerticalDragEnd: (_) => _handleDragEnd(buttonSize),
            onVerticalDragCancel: _handleDragCancel,
            onVerticalDragUpdate: _handleDragUpdate,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                final top = animationController.value * widget.elevation;
                final hsvColor = widget.hsvColor;
                final bottomHsvColor = hsvColor.withValue(hsvColor.value - 0.3);
                return Stack(
                  children: [
                    // Draw bottom layer first
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: totalHeight - top,
                        decoration: BoxDecoration(
                          color: bottomHsvColor.toColor(),
                          boxShadow:
                              widget.shadow != null ? [widget.shadow!] : [],
                          borderRadius:
                              BorderRadius.circular(widget.height / 2),
                        ),
                      ),
                    ),
                    // Then top (pushable) layer
                    Positioned(
                      left: 0,
                      right: 0,
                      top: top,
                      child: Container(
                        height: widget.height,
                        decoration: ShapeDecoration(
                          color: hsvColor.toColor(),
                          shape: StadiumBorder(),
                        ),
                        child: Center(child: widget.child),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
