# sliver_app_bar_stretch

This is a demo that shows how to temporary fix [Unable to stretch SliverAppBar issue](https://github
.com/flutter/flutter/issues/54059), which is to allow `NestedScrollView` support `SliverAppBar.stretch` effect.

Have a play at this demo web app (resize to phone screen size for best result): https://himalaya-nuts.github
.io/sliver_app_bar_stretch

This method is a quick hack, optimal effect requires extensive refactoring of `NestedScrollView`, thus official
Flutter team is not picking up this issue yet . Some limitations apply:

1. The body scroll view must have `BouncingScrollPhysics`, when the SliverAppBar background stretches, so does the body scroll view.
2. SliverAppBar and body scroll physics does not connect seamlessly. As a result, the SliverAppBar won't stretch by carried momentum (when you quick fling down then not touching the screen), your fingertip has to be touching the screen when stretching the SliverAppBar.
