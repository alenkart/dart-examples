# dart-examples
Dart examples

## @Annotantions
To make a custom annotation in dart is necessary to create a constant object, the following example are valid annotation declarations:

### Creating an annotation
```dart
const annotationA = "annotation";
const annotationB = 1;

@annotationA
@annotationB
method() {}
```
A class with a constant constructor can be use as annotation
```dart
class MyAnnotantion {
  final String data;
  //constan constructor
  const MyAnnotantion(this.data);
}
```
### Using the example annotation
Applying the custom annotation to an example class
```dart
@MyAnnotantion('Class')
class Example {
  @MyAnnotantion('Property')
  String variable;
  
  @MyAnnotantion('Instance method')
  instanceMethod(@MyAnnotantion('Instance method parameter') variable) {}
  
  @MyAnnotantion('Static method')
  static staticMethod(@MyAnnotantion('Static method parameter') variable) {}
}
```

#### Class metadata
```dart
@MyAnnotantion('Class')
class Example
```
```dart
final object = Example();
final instanceMirror = reflect(object);
final classMirror = instanceMirror.type;

classMirror.metadata.forEach((metadata) {
    print(metadata.reflectee.data);
});
```
Result: Class

#### Class property metadata
```dart
@MyAnnotantion('Property')
String variable;
```
```dart
final object = Example();
final instanceMirror = reflect(object);
final classMirror = instanceMirror.type;

classMirror.declarations.forEach((symbol, declaretion) {
    if (declaretion is VariableMirror) {
        declaretion.metadata.forEach((metadata) {
          print(metadata.reflectee.data);
        });
    }
});
```
Result: Property

#### Class method metadata
```dart
@MyAnnotantion('Instance method')
instanceMethod(@MyAnnotantion('Instance method parameter') variable) {}

@MyAnnotantion('Static method')
static staticMethod(@MyAnnotantion('Static method parameter') variable) {}
```
```dart
final object = Example();
final instanceMirror = reflect(object);
final classMirror = instanceMirror.type;

classMirror.declarations.forEach((symbol, declaretion) {
  if (declaretion is MethodMirror) {
    declaretion.metadata.forEach((metadata) {
      print(metadata.reflectee.data);
    });
  }
});
```
Result: Instance method, Static method

#### Class method parameter metadata
```dart
//instanceMethod
@MyAnnotantion('Instance method parameter') variable

//staticMethod
@MyAnnotantion('Static method parameter') variable
```
```dart
final object = Example();
final instanceMirror = reflect(object);
final classMirror = instanceMirror.type;

classMirror.instanceMembers.forEach((symbol, method) {
  method.parameters.forEach((parameter) {
    parameter.metadata.forEach((metadata) {
      print(metadata.reflectee.data);
    });
  });
});
```
Result: Instance method parameter, Static method parameter
