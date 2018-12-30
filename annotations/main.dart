import './lib/commons.dart';
import './lib/example.dart';

main(List<String> args) async {
  final example = Example();

  final helper = AnnotationHelper(example);
  helper.printClass();
  helper.printProperty();
  helper.printMethod();
  helper.printParameter();
  helper.printStaticParameter();
}
