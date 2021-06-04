// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const Duration _kCustomBottomSheetDuration = const Duration(milliseconds: 200);
const double _kMinFlingVelocity = 700.0;
const double _kCloseProgressThreshold = 0.5;

/// A material design bottom sheet.
///
/// There are two kinds of bottom sheets in material design:
///
///  * _Persistent_. A persistent bottom sheet shows information that
///    supplements the primary content of the app. A persistent bottom sheet
///    remains visible even when the user interacts with other parts of the app.
///    Persistent bottom sheets can be created and displayed with the
///    [ScaffoldState.showCustomBottomSheet] function.
///
///  * _Modal_. A modal bottom sheet is an alternative to a menu or a dialog and
///    prevents the user from interacting with the rest of the app. Modal bottom
///    sheets can be created and displayed with the [showModalCustomBottomSheet]
///    function.
///
/// The [CustomBottomSheet] widget itself is rarely used directly. Instead, prefer to
/// create a persistent bottom sheet with [ScaffoldState.showCustomBottomSheet] and a modal
/// bottom sheet with [showModalCustomBottomSheet].
///
/// See also:
///
///  * [ScaffoldState.showCustomBottomSheet]
///  * [showModalCustomBottomSheet]
///  * <https://material.google.com/components/bottom-sheets.html>
class CustomBottomSheet extends StatefulWidget {
  /// Creates a bottom sheet.
  ///
  /// Typically, bottom sheets are created implicitly by
  /// [ScaffoldState.showCustomBottomSheet], for persistent bottom sheets, or by
  /// [showModalCustomBottomSheet], for modal bottom sheets.
  const CustomBottomSheet({
    Key? key,
    required this.animationController,
    required this.onClosing,
    required this.builder,
  }) : super(key: key);

  /// The animation that controls the bottom sheet's position.
  ///
  /// The CustomBottomSheet widget will manipulate the position of this animation, it
  /// is not just a passive observer.
  final AnimationController animationController;

  /// Called when the bottom sheet begins to close.
  ///
  /// A bottom sheet might be be prevented from closing (e.g., by user
  /// interaction) even after this callback is called. For this reason, this
  /// callback might be call multiple times for a given bottom sheet.
  final VoidCallback onClosing;

  /// A builder for the contents of the sheet.
  ///
  /// The bottom sheet will wrap the widget produced by this builder in a
  /// [Material] widget.
  final WidgetBuilder builder;

  @override
  _CustomBottomSheetState createState() => new _CustomBottomSheetState();

  /// Creates an animation controller suitable for controlling a [CustomBottomSheet].
  static AnimationController createAnimationController(TickerProvider vsync) {
    return new AnimationController(
      duration: _kCustomBottomSheetDuration,
      debugLabel: 'CustomBottomSheet',
      vsync: vsync,
    );
  }
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final GlobalKey _childKey =
      new GlobalKey(debugLabel: 'CustomBottomSheet child');

  double get _childHeight {
    final RenderBox? renderBox =
        _childKey.currentContext?.findRenderObject() as RenderBox;

    return renderBox?.size.height ?? 0;
  }

  bool get _dismissUnderway =>
      widget.animationController.status == AnimationStatus.reverse;

  void _handleDragUpdate(DragUpdateDetails details) {
    if (_dismissUnderway) return;
    widget.animationController.value -=
        details.primaryDelta ?? 0 / (_childHeight);
    // details.primaryDelta ?? 0 / (_childHeight ?? details.primaryDelta);
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_dismissUnderway) return;
    if (details.velocity.pixelsPerSecond.dy > _kMinFlingVelocity) {
      final double flingVelocity =
          -details.velocity.pixelsPerSecond.dy / _childHeight;
      if (widget.animationController.value > 0.0)
        widget.animationController.fling(velocity: flingVelocity);
      if (flingVelocity < 0.0) widget.onClosing();
    } else if (widget.animationController.value < _kCloseProgressThreshold) {
      if (widget.animationController.value > 0.0)
        widget.animationController.fling(velocity: -1.0);
      widget.onClosing();
    } else {
      widget.animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onVerticalDragUpdate: _handleDragUpdate,
      onVerticalDragEnd: _handleDragEnd,
      child: new Material(key: _childKey, child: widget.builder(context)),
    );
  }
}

// PERSISTENT BOTTOM SHEETS

// See scaffold.dart

// MODAL BOTTOM SHEETS

class _ModalCustomBottomSheetLayout extends SingleChildLayoutDelegate {
  _ModalCustomBottomSheetLayout(this.progress, this.bottomInset);

  final double progress;
  final double bottomInset;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return new BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
      minHeight: 0.0,
      maxHeight: constraints.maxHeight * 9.0 / 16.0,
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return new Offset(
      0.0,
      size.height - bottomInset - childSize.height * progress,
    );
  }

  @override
  bool shouldRelayout(_ModalCustomBottomSheetLayout oldDelegate) {
    return progress != oldDelegate.progress ||
        bottomInset != oldDelegate.bottomInset;
  }
}

class _ModalCustomBottomSheet<T> extends StatefulWidget {
  const _ModalCustomBottomSheet({Key? key, required this.route})
      : super(key: key);

  final _ModalCustomBottomSheetRoute<T> route;

  @override
  _ModalCustomBottomSheetState<T> createState() =>
      new _ModalCustomBottomSheetState<T>();
}

class _ModalCustomBottomSheetState<T>
    extends State<_ModalCustomBottomSheet<T>> {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: widget.route.dismissOnTap ? () => Navigator.pop(context) : null,
      child: new AnimatedBuilder(
        animation: widget.route._animationController!,
        builder: (BuildContext context, Widget? child) {
          double bottomInset = widget.route.resizeToAvoidBottomPadding
              ? MediaQuery.of(context).viewInsets.bottom
              : 0.0;

          return new ClipRect(
                child: new CustomSingleChildLayout(
                  delegate: new _ModalCustomBottomSheetLayout(
                    widget.route.animation?.value ?? 0,
                    bottomInset,
                  ),
                  child: new CustomBottomSheet(
                    animationController: widget.route._animationController!,
                    onClosing: () => Navigator.pop(context),
                    builder: widget.route.builder,
                  ),
                ),
              ).child ??
              Container();
        },
      ),
    );
  }
}

class _ModalCustomBottomSheetRoute<T> extends PopupRoute<T> {
  _ModalCustomBottomSheetRoute({
    required this.builder,
    required this.theme,
    required this.barrierLabel,
    RouteSettings? settings,
    required this.resizeToAvoidBottomPadding,
    required this.dismissOnTap,
  }) : super(settings: settings);

  final WidgetBuilder builder;
  final ThemeData theme;
  final bool resizeToAvoidBottomPadding;
  final bool dismissOnTap;

  @override
  Duration get transitionDuration => _kCustomBottomSheetDuration;

  @override
  bool get barrierDismissible => true;

  @override
  final String barrierLabel;

  @override
  Color get barrierColor => Colors.black54;

  AnimationController? _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController = CustomBottomSheet.createAnimationController(
      navigator!.overlay as TickerProvider,
    );

    return _animationController!;
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // By definition, the bottom sheet is aligned to the bottom of the page
    // and isn't exposed to the top padding of the MediaQuery.
    Widget bottomSheet = new MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: new _ModalCustomBottomSheet<T>(route: this),
    );
    bottomSheet = new Theme(data: theme, child: bottomSheet);

    return bottomSheet;
  }
}

/// Shows a modal material design bottom sheet.
///
/// A modal bottom sheet is an alternative to a menu or a dialog and prevents
/// the user from interacting with the rest of the app.
///
/// A closely related widget is a persistent bottom sheet, which shows
/// information that supplements the primary content of the app without
/// preventing the use from interacting with the app. Persistent bottom sheets
/// can be created and displayed with the [showCustomBottomSheet] function or the
/// [ScaffoldState.showCustomBottomSheet] method.
///
/// The `context` argument is used to look up the [Navigator] and [Theme] for
/// the bottom sheet. It is only used when the method is called. Its
/// corresponding widget can be safely removed from the tree before the bottom
/// sheet is closed.
///
/// Returns a `Future` that resolves to the value (if any) that was passed to
/// [Navigator.pop] when the modal bottom sheet was closed.
///
/// See also:
///
///  * [CustomBottomSheet], which is the widget normally returned by the function
///    passed as the `builder` argument to [showModalCustomBottomSheet].
///  * [showCustomBottomSheet] and [ScaffoldState.showCustomBottomSheet], for showing
///    non-modal bottom sheets.
///  * <https://material.google.com/components/bottom-sheets.html#bottom-sheets-modal-bottom-sheets>
Future<T?>? showModalCustomBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool dismissOnTap: true,
  bool resizeToAvoidBottomPadding: true,
}) {
  return Navigator.push(
    context,
    new _ModalCustomBottomSheetRoute<T>(
      builder: builder,
      theme: Theme.of(context),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      resizeToAvoidBottomPadding: resizeToAvoidBottomPadding,
      dismissOnTap: dismissOnTap,
    ),
  );
}

/// Shows a persistent material design bottom sheet in the nearest [Scaffold].
///
/// A persistent bottom sheet shows information that supplements the primary
/// content of the app. A persistent bottom sheet remains visible even when the
/// user interacts with other parts of the app. A [Scaffold] is required in the
/// given `context`; its [ScaffoldState.showCustomBottomSheet] method is used to
/// actually show the bottom sheet.
///
/// A closely related widget is a modal bottom sheet, which is an alternative
/// to a menu or a dialog and prevents the user from interacting with the rest
/// of the app. Modal bottom sheets can be created and displayed with the
/// [showModalCustomBottomSheet] function.
///
/// Returns a controller that can be used to close and otherwise manipulate the
/// bottom sheet.
///
/// To rebuild the bottom sheet (e.g. if it is stateful), call
/// [PersistentCustomBottomSheetController.setState] on the value returned from this
/// method.
///
/// The `context` argument is used to look up the [Scaffold] for the bottom
/// sheet. It is only used when the method is called. Its corresponding widget
/// can be safely removed from the tree before the bottom sheet is closed.
///
/// See also:
///
///  * [CustomBottomSheet], which is the widget typically returned by the `builder`.
///  * [showModalCustomBottomSheet], which can be used to display a modal bottom
///    sheet.
///  * [Scaffold.of], for information about how to obtain the [BuildContext].
///  * <https://material.google.com/components/bottom-sheets.html#bottom-sheets-persistent-bottom-sheets>
PersistentBottomSheetController<T> showCustomBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
}) {
  return Scaffold.of(context).showBottomSheet<T>(builder);
}
