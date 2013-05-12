classify_css
============

An CSS classifier. Parses a string of CSS and wraps each token with a `span` 
and a defined set of CSS classes. Used to add syntax coloring to documentation 
and code examples.

Installation
------------

Add this to your `pubspec.yaml` (or create it):
```yaml
dependencies:
  classify_css: any
```
Then run the [Pub Package Manager][pub] (comes with the Dart SDK):

    pub install

Usage
-----

```dart
import "package:classify_css/classify_css.dart";

main() {
  print(classifyCss("html { padding: 10px; }"));
}
```

[dartdoc]: https://github.com/d2m/dartdoc
[pub]: http://www.dartlang.org/docs/pub-package-manager/
