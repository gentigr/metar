import 'package:metar/src/common/runway_number.dart';
import 'package:test/test.dart';

import '../../test_utils.dart';

void main() {
  group('RunwayNumber', () {
    group('constructor', () {
      runwayNumberConstructor();
    });
    group('constructorFromString', () {
      runwayNumberConstructorFromString();
    });
    group('asInteger', () {
      runwayNumberAsInteger();
    });
    group('toString', () {
      runwayNumberToString();
    });
    group('equalityOperator', () {
      runwayNumberEqualityOperator();
    });
    group('hashCode', () {
      runwayNumberHashCode();
    });
  });
}

void runwayNumberConstructor() {
  test('Test runway number within limits', () {
    expect(RunwayNumber(10), isA<RunwayNumber>());
  });

  test('Test lower limit', () {
    var err = 'Runway number value must be within [1; 36] range, provided: `0`';
    expectFormatException(() => RunwayNumber(0), err);
  });

  test('Test upper limit', () {
    var m = 'Runway number value must be within [1; 36] range, provided: `37`';
    expectFormatException(() => RunwayNumber(37), m);
  });
}

void runwayNumberConstructorFromString() {
  test('Test string value', () {
    var err = 'Invalid radix-10 number';
    expectFormatException(() => RunwayNumber.fromString('d'), err);
  });

  test('Test digit value', () {
    expect(RunwayNumber.fromString('03'), isA<RunwayNumber>());
  });
}

void runwayNumberAsInteger() {
  test('Test integer value', () {
    expect(RunwayNumber(10).asInteger, 10);
  });
}

void runwayNumberToString() {
  test('Test with leading zero', () {
    expect(RunwayNumber(1).toString(), '01');
  });

  test('Test with no leading zero', () {
    expect(RunwayNumber(21).toString(), '21');
  });
}

void runwayNumberEqualityOperator() {
  test('Test equality operator for non-equality', () {
    expect(RunwayNumber(1) == RunwayNumber(2), false);
  });

  test('Test equality operator for equality', () {
    expect(RunwayNumber(1) == RunwayNumber(1), true);
  });
}

void runwayNumberHashCode() {
  test('Test hash generation for non-equality', () {
    expect(RunwayNumber(1).hashCode == RunwayNumber(2).hashCode, false);
  });

  test('Test hash generation for equality', () {
    expect(RunwayNumber(1).hashCode == RunwayNumber(1).hashCode, true);
  });
}
