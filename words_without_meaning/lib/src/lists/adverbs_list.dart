import 'package:words_without_meaning/src/lists/adjectives_list.dart';
import 'package:words_without_meaning/src/lists/GrammarLists.dart';

class Adverbs extends GrammarLists
{
  static var adverbs =
  [
    "then",
    "thereafter",
    "after which then",
  ];

  static var adverbs2 =
  [
    "was",
    "thereafter was",
    "continued",
    "endured",
    "lasted",
    "lingered",
    "lived",
    "persisted",
    "prevailed",
    "stood",
    "stopped",
    "survived",
    "abided",
    "bade",
    "remained",
    "halted",
  ];

  static var timeAdverbs =
  [
    "never",
    "always",
    "at no time",
    "nevermore",
    "in no way ever",
    "never at all",
    "do not ever",
    "not in any way",
    "not in the least",
    "not on your life",
    "not under any condition",
    "consistently",
    "constantly",
    "ever",
    "invariably",
    "regularly",
    "repeatedly",
    "perpetually",
    "eternally",
    "everlastingly",
    "evermore",
    "for keeps",
    "forevermore",
    "in perpetuum",
    "till blue in the face",
    "till the cows come home",
    "till hell freezes over",
    "unceasingly",
    "without exception",
  ];

  static String convertedAdjective()
  {
    return Adjectives.convertToAdverb(Adjectives.adjectives[ GrammarLists.getRandFromRange(Adjectives.adjectives.length) ]);
  }
}