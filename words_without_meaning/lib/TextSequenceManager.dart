import 'dart:math';
import 'package:words_without_meaning/lists/nouns_list.dart';
import 'package:words_without_meaning/lists/verbs_list.dart';
import 'package:words_without_meaning/lists/adjectives_list.dart';
import 'package:words_without_meaning/lists/pronouns_list.dart';
import 'package:words_without_meaning/lists/prepositions_list.dart';
import 'package:words_without_meaning/lists/qualities_list.dart';
import 'package:words_without_meaning/lists/quantities_list.dart';
import 'package:words_without_meaning/lists/states_of_existence_list.dart';
import 'package:words_without_meaning/lists/ways_to_start_a_thought.dart';
import 'package:words_without_meaning/lists/particles_list.dart';

class TextSequenceGenerator
{
  static String getSequencedPair()
  {
    return TextListManager.getNoun() + " " + TextListManager.getNoun();
  }

  static String getNNounsSequence()
  {
    var tmpString = "";
    var randInt = TextListManager.getRandFromRange(4);

    if (randInt == 0)
    {
      randInt = 1;
    }

    for (var i=0;i<(1+randInt);i++)
    {
      tmpString += TextListManager.getNoun() + " ";
    }

    return tmpString;
  }

  static List<String> getRandomSequence()
  {
    var tmpString = "";
    var tmpSubject = "";
    var tmpPunct = "";
    var randInt = TextListManager.getRandFromRange(6);

    //randomly select a sentence pattern
//    randInt = 0;
    print("pattern number: " + randInt.toString());
    switch (randInt) {
      case 0:
        //I did something
        //subjectivePronouns
        tmpString = tmpSubject = TextListManager.getSubjectivePronoun() + " " +
                    TextListManager.getVerbPastTense() + " " +
                    TextListManager.getParticle() + " " +
                    TextListManager.getNoun() + " " +
                    TextListManager.getPreposition() + " " +
                    TextListManager.getParticle() + " " +
                    TextListManager.getAdjective() + " " +
                    "\n" + "\n";
                    if (tmpSubject.contains("who"))
                    {
                      tmpPunct = "?";
                    }

        tmpString += TextListManager.getNoun() + tmpPunct + " " +
                    "\n" + "\n" +
                    TextListManager.getVerbPastTense() + " " +
                    TextListManager.getPreposition() + " " +
                    TextListManager.getParticle() + " " +
                    TextListManager.getDesirableQuality() + " " +
                    TextListManager.getConcept() + " " +
                    "\n" + "\n" +
                    TextListManager.getNoun() + TextListManager.randomMakePlural() +
                    "\n" + "\n" +
                    TextListManager.getAdjective() + " " + TextListManager.getNoun();
        break;
      case 1:
        tmpString = TextListManager.getSubjectivePronoun() + " " +
                    //TextListManager.getNoun() + " " +
                    TextListManager.getVerbPastTense() + " " +
                    TextListManager.getPossessivePronouns2() + " " +
                    TextListManager.getNoun() + " " +
                    TextListManager.getNoun() + " " +
                    TextListManager.getPreposition() + " " +
                    TextListManager.getPossessivePronouns2() + " " +
                    TextListManager.getAdjective() + " " +
                    TextListManager.getNoun() + " " +
                    "\n" + "\n" +
                    TextListManager.getPreposition2() + " " +
                    TextListManager.getIndefinitePronouns() + " " +
                    TextListManager.getNoun() + " " +
                    TextListManager.getPreposition() + " " +
                    TextListManager.getParticle() + " " +
                    TextListManager.getAdjective() + " " +
                    TextListManager.getNoun() + " " + TextListManager.getNoun() + ", " +
                    "\n" + "\n" + "then " +
                    TextListManager.getVerbOfFinality() + ", " +
                    TextListManager.getPastTenseVerbStateOfExistence() + " " +
                    TextListManager.getNoun();

        break;
      case 2:
        // it boils down to this: the truth is a lie
        tmpString = TextListManager.getWayToStartAThought() + "\n" +
                    TextListManager.getDemonstrativePronouns2() + " " +
                    TextListManager.getNoun() + " is " +
                    TextListManager.getStateOfExistence() + "\n" + "\n" +
                    TextListManager.getAdjective() + " " +
                    TextListManager.getNoun();
        break;
      case 3:
        tmpString = TextListManager.getNoun() + " " +
                    TextListManager.getNoun();
        break;
      case 4:
        tmpString = TextListManager.getNoun() + TextListManager.randomMakePlural() +
                    " of " +
                    TextListManager.getNoun();
        break;
      case 5:
        tmpString = "An " +
                    TextListManager.getQuantity() +
                    " of " +
                    TextListManager.getStateOfExistence() + " " +
                    TextListManager.getConcept() + " " +
                    TextListManager.getNoun() + "\n" + "\n" +
                    TextListManager.getParticle() + " " +
                    TextListManager.getNoun() + " " + TextListManager.getConcept();
        break;
      case 6:
        var tmpIndefPronoun = TextListManager.getIndefinitePronouns();
        tmpString = TextListManager.getSubjectivePronoun() + " " +
                    "left for a " +
                    TextListManager.getAdjective() + " " +
                    TextListManager.getTravelling() + " " +
                    tmpIndefPronoun + " " +
                    TextListManager.getVerbPastTense() + " " +
                    tmpIndefPronoun  + " " +
                    TextListManager.getVerbPastTense();

        break;
    }

//    tmpString = "grew towards a interesting truth";
//    tmpString = "An only something An hotdog #noun a earful A hour a horse #possessivePronouns2 window an mineral facility";
    tmpString = scrubGrammar(tmpString);

    return [tmpString, randInt.toString()];
  }


  static String scrubGrammar(String pString)
  {
    // hashtag content replacement ------------------------------------------------------
    pString = pString.replaceAll("#noun", TextListManager.getNoun());
    pString = pString.replaceAll("#possessivePronouns2", TextListManager.getPossessivePronouns2());

    // grammar errors -------------------------------------------------------------------

    ///////// ISOLATE e.g. " an captivating " PROBLEMS /////////
    pString = pString.splitMapJoin((new RegExp(r"\san\s[qwrtypsdfghklzxcvbnm]")),
      onMatch:    (m) => ' a${m.group(0).substring(3)}',);

    ///////// ISOLATE e.g. "An pound of " PROBLEMS /////////
    pString = pString.splitMapJoin((new RegExp(r"An\s[qwrtypsdfghklzxcvbnm]")),
      onMatch:    (m) => 'A${m.group(0).substring(2)}',);

    ///////// ISOLATE e.g. " a understanding" PROBLEMS /////////
    pString = pString.splitMapJoin((new RegExp(r"\sa\s(un)")),
      onMatch:    (m) => ' an ${m.group(0).substring(2)}',);

    ///////// ISOLATE e.g. " a interesting" PROBLEMS /////////
    pString = pString.splitMapJoin((new RegExp(r"\sa\s(in)")),
      onMatch:    (m) => ' an ${m.group(0).substring(2)}',);

    ///////// ISOLATE e.g. " a irritable" PROBLEMS /////////
    pString = pString.splitMapJoin((new RegExp(r"\sa\s(ir)")),
      onMatch:    (m) => ' an ${m.group(0).substring(2)}',);

    ///////// ISOLATE e.g. " a earful " PROBLEMS /////////
    pString = pString.splitMapJoin((new RegExp(r"\sa\s[eauio]")),
      onMatch:    (m) => ' an ${m.group(0).substring(2)}',);

    ///////// ISOLATE e.g. "A hour of" PROBLEMS /////////
    pString = pString.splitMapJoin((new RegExp(r"A\s(hour)")),
      onMatch:    (m) => 'An${m.group(0).substring(1)}',);

    ///////// ISOLATE e.g. "A for " PROBLEMS /////////
    pString = pString.splitMapJoin((new RegExp(r"A\s(for)")),
      onMatch:    (m) => 'A',);

    ///////// ISOLATE e.g. "A within " PROBLEMS /////////
    pString = pString.splitMapJoin((new RegExp(r"A\s(within)")),
      onMatch:    (m) => 'A',);

    ///////// ISOLATE e.g. "An only " PROBLEMS /////////
    pString = pString.splitMapJoin((new RegExp(r"An\s(only)")),
      onMatch:    (m) => 'Only',);

    return pString;
  }
}

class TextListManager
{
  static getNoun()
  {
    return Nouns.nouns[getRandFromRange(Nouns.nouns.length)];
  }

  static randomMakePlural()
  {
    if (getRandFromRange(24) % 3 == 0)
      {
        return "s";
      }
      else
        {
          return "";
        }
  }

  static getConcept()
  {
    return Nouns.concepts[getRandFromRange(Nouns.concepts.length)];
  }

  static getVerb()
  {
    return Verbs.verbs[getRandFromRange(Verbs.verbs.length)];
  }

  static getVerbPastTense()
  {
    return Verbs.verbsPastTense[getRandFromRange(Verbs.verbsPastTense.length)];
  }

  static getVerbOfFinality()
  {
    return Verbs.verbsOfFinality[getRandFromRange(Verbs.verbsOfFinality.length)];
  }

  static getAdverb()
  {
    return  Adjectives.convertToAdverb(Adjectives.adjectives[getRandFromRange(Verbs.verbs.length)]);
  }

  static getSubjectivePronoun()
  {
    return Pronouns.subjectivePronouns[getRandFromRange(Pronouns.subjectivePronouns.length)];
  }

  static getPersonalPronoun()
  {
    return Pronouns.personalPronouns[getRandFromRange(Pronouns.personalPronouns.length)];
  }

  static getObjectivePronouns()
  {
    return Pronouns.objectivePronouns[getRandFromRange(Pronouns.objectivePronouns.length)];
  }

  static getPossessivePronouns()
  {
    return Pronouns.possessivePronouns[getRandFromRange(Pronouns.possessivePronouns.length)];
  }

  static getPossessivePronouns2()
  {
    return Pronouns.possessivePronouns2[getRandFromRange(Pronouns.possessivePronouns2.length)];
  }

  static getDemonstrativePronouns()
  {
    return Pronouns.demonstrativePronouns[getRandFromRange(Pronouns.demonstrativePronouns.length)];
  }

  static getDemonstrativePronouns2()
  {
    return Pronouns.demonstrativePronouns2[getRandFromRange(Pronouns.demonstrativePronouns2.length)];
  }

  static getInterrogativePronouns()
  {
    return Pronouns.interrogativePronouns[getRandFromRange(Pronouns.interrogativePronouns.length)];
  }

  static getRelativePronouns()
  {
    return Pronouns.relativePronouns[getRandFromRange(Pronouns.relativePronouns.length)];
  }

  static getReflexivePronouns()
  {
    return Pronouns.reflexivePronouns[getRandFromRange(Pronouns.reflexivePronouns.length)];
  }

  static getIntensivePronouns()
  {
    return Pronouns.intensivePronouns[getRandFromRange(Pronouns.intensivePronouns.length)];
  }

  static getReciprocalPronouns()
  {
    return Pronouns.reciprocalPronouns[getRandFromRange(Pronouns.reciprocalPronouns.length)];
  }

  static getIndefinitePronouns()
  {
    return Pronouns.indefinitePronouns[getRandFromRange(Pronouns.indefinitePronouns.length)];
  }

  static getPreposition()
  {
    return PrepositionsList.prepositionsList[getRandFromRange(PrepositionsList.prepositionsList.length)];
  }

  static getPreposition2()
  {
    return PrepositionsList.prepositionsList2[getRandFromRange(PrepositionsList.prepositionsList2.length)];
  }

  static getAdjective()
  {
    return Adjectives.adjectives[getRandFromRange(Adjectives.adjectives.length)];
  }

  static getPastTenseVerbStateOfExistence()
  {
    return Verbs.pastTenseVerbStateOfExistence[getRandFromRange(Verbs.pastTenseVerbStateOfExistence.length)];
  }

  static getDesirableQuality()
  {
    return Qualities.desirableQualitiesList[getRandFromRange(Qualities.desirableQualitiesList.length)];
  }

  static getParticle()
  {
    return Particles.particlesList[getRandFromRange(Particles.particlesList.length)];
  }

  static getWayToStartAThought()
  {
    return WaysToStartAThought.waysToStartAThought[getRandFromRange(WaysToStartAThought.waysToStartAThought.length)];
  }

  static getStateOfExistence()
  {
    return StatesOfExistence.states[getRandFromRange(StatesOfExistence.states.length)];
  }

  static getQuantity()
  {
    return Quantities.quantities[getRandFromRange(Quantities.quantities.length)];
  }

  static getTravelling()
  {
    return Nouns.travels[getRandFromRange(Nouns.travels.length)];
  }


  static getRandFromRange(int maxNum)
  {
    var randClass = Random();
    var randNum = randClass.nextInt(maxNum);
    return randNum;
  }
}