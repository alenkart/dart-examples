import 'dart:mirrors';

/* Annotention helper */
class AnnotationHelper {
  ClassMirror classMirror;
  InstanceMirror instanceMirror;

  AnnotationHelper(Object object) {
    this.instanceMirror = reflect(object);
    this.classMirror = instanceMirror.type;
  }

  printClass() {
    classMirror.metadata.forEach((metadata) {
      print(metadata.reflectee.data);
    });
  }

  printProperty() {
    classMirror.declarations.forEach((symbol, declaretion) {
      if (declaretion is VariableMirror) {
        declaretion.metadata.forEach((metadata) {
          print(metadata.reflectee.data);
        });
      }
    });
  }

  printMethod() {
    classMirror.declarations.forEach((symbol, declaretion) {
      if (declaretion is MethodMirror) {
        declaretion.metadata.forEach((metadata) {
          print(metadata.reflectee.data);
        });
      }
    });
  }

  printParameter() {
    classMirror.instanceMembers.forEach((symbol, method) {
      method.parameters.forEach((parameter) {
        parameter.metadata.forEach((metadata) {
          print(metadata.reflectee.data);
        });
      });
    });
  }

  printStaticParameter() {
    classMirror.staticMembers.forEach((symbol, method) {
      method.parameters.forEach((parameter) {
        parameter.metadata.forEach((metadata) {
          print(metadata.reflectee.data);
        });
      });
    });
  }
}
