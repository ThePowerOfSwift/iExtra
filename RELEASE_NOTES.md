# Release Notes

There are no release notes before v`1.2.0`. For these versions, please check the
git tags.

Note that iExtra doesn't use semver. Breaking changes can occur on minor version
bumps, but not on revision bumps.



## 1.2.6

New features:

- I have added a `capitalizedFirst` `StringProtocol` extension, that capitalizes
the first character and leaves the remaining characters unchanged.

- I have added a new `calculateAverageColor` `UIImage` extension that calculates
the average color of an image.

- I have made the private `setupAsyncTag` extension public and modified it so it
extends `UIView` instead of `UIImageView`. It's a convenient tool for when async
operations may become obsolete, e.g. when loading images while scrolling through
a collection of cells.

- I have added more color extensions to `UISearchBar+Style` like setting a color
for the search icon, clear buttons etc.

- I have added a `UITextField+Placeholder` extension that lets you set a colored
text field placeholder text.


Bug fixes:

- I have also fixed a rotation bug for the `startRotation` UIView extension, which
only rotated with PI, instead of a full revolution.



## 1.2.5

This version contains new corner radius and shadow extensions for `UIView`. They
are protocol-based, which means that they can be specified as e.g. enums in apps
that use them.

I have also adjusted the rotation extension and made the optional completion nil
by default.



## 1.2.4

This version contains `UIView` animation extensions, e.g. tap, press and release,
fade to alpha and rotate animations.

It also contains a custom back button extension that I use until I've managed to
find a way to adjust image insets when using the standard appearance approach.



## 1.2.3

This version of iExtra only contains nonfunctional Swiftlint conformance changes.



## 1.2.2

`MainBundleFileFinder` and `MainBundleImageFileFinder` have been rewritten. This
fixes a bug in the image file finder as well.

`MapAnnotation` has a new initializer that lets you create a complete instance.



## 1.2.1

I have added a new `ThemedLabel` class, which lets you set label appearane fonts
more easily, instead of having to add a theme font property extension on UILabel.



## 1.2.0

I have begun adding theme components to the library. For now, this namespace has
a `Theme` protocol, a themed button class and an extension to reapply the global
appearance of an app.

I have added two commented-out `IoCContainer` implementations - `DipIoCContainer`
and `SwinjectIoCContainer`. You can copy and paste the commented out code into a
project where you use these libraries for IoC. I hope it saves you some time.

Breaking changes:

* The block-based gesture recognizer extensions have been renamed. The block now
  completes with the gesture that triggered the action.

* The `IoCContainer` protocol has been extended with more resolve functions. You
  have to implement these functions in your container implementation from now on.