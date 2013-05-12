library classifyCssTests;

import 'package:classify_css/classify_css.dart';
import 'package:unittest/unittest.dart';

void main() {
  group('Classifies as type', () {
    validate('when core type or void', 
    	'html { padding:10px; }', 
    	'');
	});
}

validate(String description, String input, String expected, 
         {bool verbose: false}) {
	test(description, () {
		var actual = classifyCss(input);
		var passed = (actual == expected);
		if (!passed) {
		  print('FAIL: $description');
      print('  expect: $expected');
      print('  actual: $actual');
      print('');
		}
		expect(passed, isTrue, verbose: verbose);
	});
}