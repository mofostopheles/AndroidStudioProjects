import 'dart:math';

class GrammarLists
{
  static getRandFromRange(int maxNum) {
    var randClass = Random();
    var randNum = randClass.nextInt(maxNum);
    return randNum;
  }

}