import 'commons.dart';

/* Applying the custom Annotention to a class */
@MyAnnotantion('Class')
class Example {
  @MyAnnotantion('Property')
  String variable;

  @MyAnnotantion('Instance method')
  instanceMethod(@MyAnnotantion('Instance method parameter') variable) {}

  @MyAnnotantion('Static method')
  static staticMethod(@MyAnnotantion('Static method parameter') variable) {}
}