## [2.1.0] - [October 30, 2026]

### Changes

- Migrated from `package:flutter/material.dart` to the standalone `material_ui` package
- Bumped minimum Flutter version to 3.44 and minimum Dart SDK to 3.12
- The parallax effect now translates the `body` instead of resizing it, so the `body` is no longer laid out again on every frame

### Fixes

- Fixed a crash when the `SlidingUpPanel` has no `Scaffold` ancestor, or a `Scaffold` without an `AppBar`
- The `body` now fills the space given to the `SlidingUpPanel` in every app, including apps still built with `package:flutter/material.dart`
- Replaced deprecated `Color.withOpacity` with `Color.withValues`

### Deprecations

- `pageHaveAppBar` and `supplementTopSpacing` no longer have any effect, since the `body` already fills the space given to the `SlidingUpPanel`. They will be removed in the next major version

### Documentation

- Updated the example app to `material_ui`, `flutter_map` 8 and `latlong2`, and regenerated its Android and iOS projects
- Added widget tests for the `body` size and the parallax effect

## [2.0.2] - [October 1, 2026]

### Features

- Added `panelMaxWidth` to limit the width of the sliding panel

## [2.0.1] - [October 1, 2026]

### Features

- Added `pageHaveAppBar` to subtract the `AppBar` height from the `body` height
- Added `supplementTopSpacing` to subtract extra top space from the `body` height

### Fixes

- The `body`, backdrop and panel now size themselves to their parent instead of `MediaQuery.size`

## [2.0.0+1] - [April 26, 2021]

### Features

- Formatted code according to dartfmt

### Documentation

- Updated documentation to reflect new features and fixes

## [2.0.0] - [April 26, 2021]

### Features

- Addressed issue #223,#240 - Added null safety support

### Documentation

- Updated documentation to reflect new features and fixes

## [1.0.2] - [April 13, 2020]

### Features

- Addressed issue #71, #103 - Added an optional `header` widget that floats above the `panel` and attaches to the top
- Added an optional `footer` widget that floats above the `panel` and attaches to the bottom

### Documentation

- Updated documentation to reflect new features and fixes

## [1.0.1] - [April 2, 2020]

### Fixes

- Addressed issue #94: Too much widget rebuild occurring when the user slides the panel. This fix results in huge performance benefits when using the `panelChild` and `panelBuilder` properties
- Addressed issues #102, #111: Fixed issue where tapping on the panel closes it (when using the `panelBuilder`)
- Addressed issues #24, #70, #108, #121: Changed `backdropTapClosesPanel` to use `onTap` and `onVerticalDragEnd` so swipes on the backdrop cause the panel to close

### Features

- Addressed issue #107: Added duration and curve properties to the `PanelController`'s `animatePanelToPosition` method
- Addressed issues #12,#77,#86,#100: Added a `snapPoint` property to allow the panel to snap to a position midway during its slide

### Documentation

- Updated documentation to reflect new features and fixes
- Updated copyright year in the LICENSE

## [1.0.0] - [January 25, 2020]

#### Fixes

- Addressed issue #69: Used a FadeTransition to handle opacity changes (as per Flutter documentation)
- Cleaned up `PanelController` code to make maintenance easier
- Added clearer assert statements and messages to indicate why calling `PanelController` methods would fail before attaching the `PanelController`.

#### Features

- Addressed issues #17, #55, #60: Added the ability to link / nested the scroll position of the panel content with the position of the panel (i.e. infinite scrolling).
- Added the `panelBuilder` property that's required to implement the nested scrolling as described above.
- Added an `isAttached` property to the `PanelController` to indicate whether or not the `PanelController` is attached to an instance of the `SlidingUpPanel`

#### Breaking Changes

The following `PanelController` methods now return `Future<void>` instead of `void`:

- `close()`
- `open()`
- `hide()`
- `show()`
- `animatePanelToPosition(double value)`

The following `PanelController` methods have changed to Dart properties to better reflect Dart language conventions:

- `setPanelPosition()` -> `panelPosition` [as a setter]
- `getPanelPosition()` -> `panelPosition` [as a getter]
- `isPanelAnimating()` -> `isPanelAnimating`
- `isPanelOpen()` -> `isPanelOpen`
- `isPanelClosed()` -> `isPanelClosed`
- `isPanelShown()` -> `isPanelShown`

For example, here's how you would have previously used `setPanelPosition()` and `getPanelPosition()` vs. how you would now use the `panelPosition` property:

```dart
// OLD, no longer supported
print(pc.getPanelPosition()); // print a value between 0.0 and 1.0
pc.setPanelPosition(0.5);     // sets the panelPosition to 0.5
```

```dart
// NEW
print(pc.panelPosition); // print a value between 0.0 and 1.0
pc.panelPosition = 0.5;  // sets the panelPosition to 0.5
```

And here's how you would have previously called `isPanelAnimating()` vs. how you would now call `isPanelAnimating`.

```dart
panelController.isPanelAnimating(); // OLD, no longer supported
```

```dart
panelController.isPanelAnimating; // NEW
```

#### Documentation

- Updated the documentation to reflect changes
- Updated example to use nested scrolling

<br><br>

## [0.3.6] - [September 25, 2019]

#### Fixes

- Fixed issues #54, #59 where panel listeners would be called before UI was rendered (related to `defaultPanelState`)

#### Documentation

- Updated the documentation to reflect fixes

<br><br>

## [0.3.5] - [August 31, 2019]

#### Features

- Added the `defaultPanelState` property that changes whether the panel is either open or closed by default (`PanelState.OPEN` or `PanelState.CLOSED`)

#### Documentation

- Updated the documentation to reflect new features

<br><br>

## [0.3.4] - [April 16, 2019]

#### Features

- Added the `slideDirection` property that changes how the panel slides open (either up or down)

#### Documentation

- Updated the documentation to reflect new features

<br><br>

## [0.3.3] - [April 6, 2019]

#### Features

- Added the `isDraggable` property that allows/prevents dragging of the panel

#### Documentation

- Updated the documentation to reflect new features

<br><br>

## [0.3.2] - [April 5, 2019]

#### Documentation

- Fixed problem where images would wrap on pub (instead of displaying on one line)

<br><br>

## [0.3.1] - [April 5, 2019]

#### Features

- Configuration options to `SlidingUpPanel`
  - `parallaxEnabled`
  - `parallaxOffset`

#### Documentation

- Created a new example app (Maps)
- Updated documentation to reflect new features

<br><br>

## [0.3.0] - April 2, 2019

#### Features

- Added ability to close the `panel` when the backdrop is tapped

- Added callbacks to the `SlidingUpPanel`
  - `onPanelSlide`
  - `onPanelOpened`
  - `onPanelClosed`

- Added methods to the `PanelController`
  - `setPanelPosition`
  - `animatePanelToPosition`
  - `getPanelPosition`
  - `isPanelAnimating`
  - `isPanelOpen`
  - `isPanelClosed`
  - `isPanelShown`

#### Bug Fixes

- Fixed issue where the `collapsed` widget would accept touch events even when invisible (i.e. even when the panel was fully open)

#### Documentation

- Updated documentation to reflect new features
- Added clarification on `PanelController` lifecycle
- Added an explanation about nesting the `Scaffold` when displaying a backdrop

<br><br>

## [0.2.0] - April 1, 2019

Added the backdrop feature:

- Body darkens as the panel opens
- The backdrop color is customizable
- The backdrop opacity is also customizable
- Off by default

Other changes:

- Removed the README from the example app (pub will display the code on the website now)
- Specified Dart as the language in the README code snippets

<br><br>

## [0.1.2] - March 31, 2019

- Updated documentation to be more comprehensive

<br><br>

## [0.1.1] - March 31, 2019

- Added a CHANGELOG file

<br><br>

## [0.1.0] - March 31, 2019

This is the initial release of the sliding_up_panel package. This includes features such as

- A sliding up panel that responds to user gestures
- Customizing the look and feel of the sliding panel
- Manually controlling the sliding panel via the PanelController
