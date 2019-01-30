import 'dart:math';
import 'package:words_without_meaning/src/lists/nouns_list.dart';
import 'package:words_without_meaning/src/lists/verbs_list.dart';
import 'package:words_without_meaning/src/lists/adjectives_list.dart';
import 'package:words_without_meaning/src/lists/pronouns_list.dart';
import 'package:words_without_meaning/src/lists/prepositions_list.dart';
import 'package:words_without_meaning/src/lists/qualities_list.dart';
import 'package:words_without_meaning/src/lists/quantities_list.dart';
import 'package:words_without_meaning/src/lists/states_of_existence_list.dart';
import 'package:words_without_meaning/src/lists/ways_to_start_a_thought.dart';
import 'package:words_without_meaning/src/lists/particles_list.dart';
import 'package:words_without_meaning/src/lists/names_list.dart';
import 'package:words_without_meaning/src/lists/adverbs_list.dart';
import 'package:words_without_meaning/src/lists/book_of_slang.dart';

class TextSequenceGenerator {
  static String getSequencedPair() {
    return TextListManager.getNoun() + " " + TextListManager.getNoun();
  }

  static String getNNounsSequence() {
    var tmpString = "";
    var randInt = TextListManager.getRandFromRange(4);

    if (randInt == 0) {
      randInt = 1;
    }

    for (var i = 0; i < (1 + randInt); i++) {
      tmpString += TextListManager.getNoun() + " ";
    }

    return tmpString;
  }

  static List<String> getRandomSequence() {
    var tmpString = "";
    var tmpSubject = "";
    var tmpPunct = "";
    var randInt = TextListManager.getRandFromRange(14);

    //randomly select a sentence pattern
    //override randInt for testing purposes
    //randInt = 11;
    //print("pattern number: " + randInt.toString());
    switch (randInt) {
      case 0:
        tmpString = tmpSubject = TextListManager.getSubjectivePronoun() +
            " " +
            TextListManager.getVerbPastTense() +
            " " +
            TextListManager.getParticle() +
            " " +
            TextListManager.getRandomColor() +
            " " +
            TextListManager.getNoun() +
            "\n\n" +
            TextListManager.getPreposition() +
            " " +
            TextListManager.getParticle() +
            " " +
            TextListManager.getAdjective() +
            " ";

        if (tmpSubject.contains("who")) {
          tmpPunct = "?";
        }

        tmpString += TextListManager.getNoun() +
            tmpPunct +
            "\n\n" +
            TextListManager.getVerbPastTense() +
            " " +
            TextListManager.getPreposition() +
            " " +
            TextListManager.getParticle() +
            " " +
            TextListManager.getDesirableQuality() +
            " " +
            TextListManager.getConcept() +
            "\n\n" +
            TextListManager.getNoun() +
            TextListManager.randomMakePlural() +
            "\n\n" +
            TextListManager.getAdjective() +
            " " +
            TextListManager.getNoun();
        break;
      case 1:
        tmpString = TextListManager.getSubjectivePronoun() +
            " " +
            //TextListManager.getNoun() + " " +
            TextListManager.getVerbPastTense() +
            " " +
            TextListManager.getPossessivePronouns2() +
            " " +
            TextListManager.getNoun() +
            " " +
            TextListManager.getNoun() +
            " " +
            TextListManager.getPreposition() +
            " " +
            TextListManager.getPossessivePronouns2() +
            " " +
            TextListManager.getAdjective() +
            " " +
            TextListManager.getRandomColor() +
            TextListManager.getNoun() +
            "\n\n" +
            TextListManager.getPreposition2() +
            " " +
            TextListManager.getIndefinitePronouns() +
            " " +
            TextListManager.getNoun() +
            "\n\n" +
            TextListManager.getPreposition() +
            " " +
            TextListManager.getParticle() +
            " " +
            TextListManager.getAdjective() +
            " " +
            TextListManager.getNoun() +
            " " +
            TextListManager.getNoun() +
            "," +
            "\n\n" +
            TextListManager.getRandomAdverb() +
            " " +
            TextListManager.getSubjectivePronoun2() +
            " " +
            TextListManager.getVerbOfFinality() +
            ", " +
            "\n\n" +
            TextListManager.getPastTenseVerbStateOfExistence() +
            " " +
            TextListManager.getNoun();

        break;
      case 2:
        // it boils down to this: the truth is a lie
        tmpString = TextListManager.getWayToStartAThought() +
            "\n\n" +
            TextListManager.getDemonstrativePronouns2() +
            " " +
            TextListManager.getNoun() +
            " is " +
            TextListManager.getStateOfExistence() +
            "\n\n" +
            TextListManager.getAdjective() +
            " " +
            TextListManager.getNoun();
        break;
      case 3:
        tmpString =
            TextListManager.getNoun() + "\n" + TextListManager.getNoun();
        break;
      case 4:
        tmpString = TextListManager.getNoun() +
            TextListManager.randomMakePlural() +
            "\n" +
            "of" +
            "\n" +
            TextListManager.getNoun();
        break;
      case 5:
        tmpString = "An " +
            TextListManager.getQuantity() +
            " of " +
            TextListManager.getStateOfExistence() +
            " " +
            TextListManager.getConcept() +
            "\n\n" +
            TextListManager.getAdjective() +
            " " +
            TextListManager.getNoun() +
            "\n\n" +
            TextListManager.getParticle() +
            " " +
            TextListManager.getNoun() +
            " of " +
            TextListManager.getConcept();
        break;

      case 6:
        var tmpIndefPronoun = TextListManager.getIndefinitePronouns();
        tmpString = TextListManager.getSubjectivePronoun() +
            " " +
            "left for a " +
            TextListManager.getAdjective() +
            " " +
            TextListManager.getTravelling() +
            "\n\n" +
            tmpIndefPronoun +
            " " +
            TextListManager.getVerbPastTense() +
            "\n\n" +
            tmpIndefPronoun +
            " " +
            TextListManager.getVerbPastTense();
        break;
      case 7:
        tmpString = TextListManager.getIndefinitePronouns() +
            " " +
            TextListManager.getVerbPastTense() +
            " " +
            TextListManager.getParticle() +
            " " +
            TextListManager.getNoun() +
            " " +
            TextListManager.getPreposition() +
            " " +
            TextListManager.getName() +
            TextListManager.getRandomPossessive() +
            "\n\n" +
            TextListManager.getAdjective() +
            " " +
            TextListManager.getNoun() +
            "\n\n" +
            TextListManager.getParticle() +
            " " +
            TextListManager.getTravelling() +
            " " +
            TextListManager.getVerbPastTense() +
            "\n\n" +
            TextListManager.getVerbPastTense() +
            " " +
            TextListManager.getNoun();

        break;
      case 8:
        tmpString = TextListManager.getGreatOpening() +
            "\n\n" +
            "#possessivePronouns2" +
            " " +
            TextListManager.getMotionVerb() +
            " " +
            TextListManager.getNoun() +
            " and " +
            TextListManager.getParticle() +
            " " +
            TextListManager.getNoun() +
            " #adverb2"
            "\n\n" +
            "#prepositionsList2 #possessivePronouns2 " +
            TextListManager.getConcept() +
            " of " +
            "\n\n" +
            TextListManager.getConcept();

        break;

      case 9:
        tmpString = TextListManager.getNoun() +
            TextListManager.randomMakePlural() +
            "\n" +
            "of\n" +
            TextListManager.getConcept();
        break;

      case 10:
        tmpString = "#sponsoredBy" +
            "\n" +
            TextListManager.getConcept() +
            "\n" +
            TextListManager.getRandomIncorporation();
        break;
      case 11:
        tmpString = TextListManager.getEntryFromBookOfSlang();
        break;
      case 12:
        tmpString = TextListManager.getEntryFromBookOfSlang();
        break;
      case 13:
        tmpString = TextListManager.getEntryFromBookOfSlang();
        break;
    }

    //override for testing purposes
    //tmpString = "thy wandered their pass-phrase spacecraft in her uncorrupt red war beyond everyone dog\n\nnear a irritable whore broom, then sold all my belongings, sunk shadow";
    //tmpString = "An only something An hotdog #noun a earful A hour a horse #possessivePronouns2 window an mineral facility";
    tmpString = scrubGrammar(tmpString);
    return [tmpString, randInt.toString()];
  }

  static String scrubGrammar(String pString) {
    // hashtag content replacement ------------------------------------------------------
    var tmpNoun = TextListManager.getNoun();
    pString = pString.replaceAll("#noun", tmpNoun);
    pString = pString.replaceAll("#newNoun", TextListManager.getNoun());
    pString = pString.replaceAll("#2newNoun", TextListManager.getNoun());
    pString = pString.replaceAll(
        "#possessivePronouns2", TextListManager.getPossessivePronouns2());

    pString = pString.replaceAll(
        "#possessivePronouns", TextListManager.getPossessivePronouns());

    pString = pString.replaceAll("#adjective", TextListManager.getAdjective());
    pString = pString.replaceAll("#2adjective", TextListManager.getAdjective());
    pString = pString.replaceAll("#3adjective", TextListManager.getAdjective());
    pString = pString.replaceAll(
        "#stateOfExistence", TextListManager.getStateOfExistence());
    pString = pString.replaceAll("#adverb2", TextListManager.getAdverb2());
    pString = pString.replaceAll(
        "#prepositionsList2", TextListManager.getPreposition2());
    pString = pString.replaceAll(
        "#landsAndEmpires", TextListManager.getLandsAndEmpires());
    pString = pString.replaceAll("#groupsOfAnimalsOrPeople",
        TextListManager.getGroupsOfAnimalsOrPeople());
    pString =
        pString.replaceAll("#sponsoredBy", TextListManager.getSponsorIntro());
    pString = pString.replaceAll("#athletics", TextListManager.getAthletics());

    var tmpVerb = TextListManager.getVerb();
    pString = pString.replaceAll("#verb", tmpVerb);
    pString =
        pString.replaceAll("#timeAdverb", TextListManager.getTimeAdverb());
    pString = pString.replaceAll("#name", TextListManager.getName());
    pString = pString.replaceAll(
        "#stateOfExistence", TextListManager.getStateOfExistence());
    pString = pString.replaceAll("#repeatVerb", tmpVerb);
    pString = pString.replaceAll("#repeatNoun", tmpNoun);
    pString = pString.replaceAll("#concept", TextListManager.getConcept());
    pString = pString.replaceAll(
        "#2intensivePronouns", TextListManager.getIntensivePronouns2());
    pString = pString.replaceAll(
        "#subjectivePronouns", TextListManager.getSubjectivePronoun());
    pString = pString.replaceAll(
        "#2subjectivePronouns", TextListManager.getSubjectivePronoun2());
    pString = pString.replaceAll(
        "#convertedAdjective", TextListManager.getConvertedAdjective());
    pString = pString.replaceAll(
        "#2convertedAdjective", TextListManager.getConvertedAdjective());
    pString = pString.replaceAll(
        "#3convertedAdjective", TextListManager.getConvertedAdjective());

    pString =
        pString.replaceAll("#2ndAdjective", TextListManager.getAdjective());
    pString = pString.replaceAll(
        "#personalPronouns", TextListManager.getPersonalPronoun());
    pString = pString.replaceAll(
        "#2personalPronouns", TextListManager.getPersonalPronoun2());

    pString = pString.replaceAll("to were", "to have been");
    pString = pString.replaceAll("be were", "have been");

    // grammar errors -------------------------------------------------------------------

    ///////// ISOLATE e.g. " an captivating " PROBLEMS /////////
    pString = pString.splitMapJoin(
      (new RegExp(r"\san\s[qwrtypsdfghklzxcvbnm]")),
      onMatch: (m) => ' a${m.group(0).substring(3)}',
    );

    ///////// ISOLATE e.g. "An pound of " PROBLEMS /////////
    pString = pString.splitMapJoin(
      (new RegExp(r"An\s[qwrtypsdfghklzxcvbnm]")),
      onMatch: (m) => 'A${m.group(0).substring(2)}',
    );

    ///////// ISOLATE e.g. " the the " PROBLEMS /////////
    pString = pString.splitMapJoin(
      (new RegExp(r"the\sthe\s")),
      onMatch: (m) => 'the',
    );

    ///////// ISOLATE e.g. " a understanding" PROBLEMS /////////
    pString = pString.splitMapJoin(
      (new RegExp(r"\sa\s(un)")),
      onMatch: (m) => ' an ${m.group(0).substring(2)}',
    );

    ///////// ISOLATE e.g. " a interesting" PROBLEMS /////////
    pString = pString.splitMapJoin(
      (new RegExp(r"\sa\s(in)")),
      onMatch: (m) => ' an ${m.group(0).substring(2)}',
    );

    pString = pString.splitMapJoin(
      (new RegExp(r"\sa\s(In)")),
      onMatch: (m) => ' an${m.group(0).substring(2)}',
    );

    ///////// ISOLATE e.g. " a irritable" PROBLEMS /////////
    pString = pString.splitMapJoin(
      (new RegExp(r"\sa\s(ir)")),
      onMatch: (m) => ' an${m.group(0).substring(2)}',
    );

    ///////// ISOLATE e.g. " a earful " PROBLEMS /////////
    pString = pString.splitMapJoin(
      (new RegExp(r"\sa\s[eauio]")),
      onMatch: (m) => ' an${m.group(0).substring(2)}',
    );

    ///////// ISOLATE e.g. "A hour of" PROBLEMS /////////
    pString = pString.splitMapJoin(
      (new RegExp(r"A\s(hour)")),
      onMatch: (m) => 'An${m.group(0).substring(1)}',
    );

    ///////// ISOLATE e.g. "A for " PROBLEMS /////////
    pString = pString.splitMapJoin(
      (new RegExp(r"A\s(for)")),
      onMatch: (m) => 'A',
    );

    ///////// ISOLATE e.g. "A within " PROBLEMS /////////
    pString = pString.splitMapJoin(
      (new RegExp(r"A\s(within)")),
      onMatch: (m) => 'A',
    );

    ///////// ISOLATE e.g. "An only " PROBLEMS /////////
    pString = pString.splitMapJoin(
      (new RegExp(r"An\s(only)")),
      onMatch: (m) => 'Only',
    );

    ///////// ISOLATE e.g. "A ever" PROBLEMS /////////
    pString = pString.splitMapJoin(
      (new RegExp(r"A\s(ever)")),
      onMatch: (m) => 'Never',
    );

    ///////// ISOLATE e.g. "Aever" PROBLEMS /////////
    pString = pString.splitMapJoin(
      (new RegExp(r"Aever")),
      onMatch: (m) => 'Never',
    );

    ///////// ISOLATE e.g. " a enigma " PROBLEMS /////////
    pString = pString.splitMapJoin(
      (new RegExp(r" a enigma")),
      onMatch: (m) => ' an enigma',
    );

    ///////// ISOLATE e.g. " sss " PROBLEMS /////////
    pString = pString.splitMapJoin(
      (new RegExp(r"sss")),
      onMatch: (m) => 'ss',
    );

    ///////// ISOLATE e.g. " s’s " PROBLEMS /////////
    pString = pString.splitMapJoin(
      (new RegExp(r"s’s")),
      onMatch: (m) => 's’',
    );

    pString = pString.replaceAll("  ", " ");

    return pString;
  }
}

class TextListManager {
  static getNoun() {
    return Nouns.nouns[getRandFromRange(Nouns.nouns.length)];
  }

  static getName() {
    return Names.names[getRandFromRange(Names.names.length)];
  }

  static randomMakePlural() {
    if (getRandFromRange(24) % 3 == 0) {
      return "s";
    } else {
      return "";
    }
  }

  static getConvertedAdjective() {
    return Adverbs.convertedAdjective();
  }

  static getRandomPossessive() {
    if (getRandFromRange(12) % 3 == 0) {
      return "’s";
    } else {
      return "";
    }
  }

  static getRandomColor() {
    if (getRandFromRange(2) == 0) {
      return getColor() + " ";
    } else {
      return "";
    }
  }

  static getRandomLineBreak() {
    if (getRandFromRange(2) == 0) {
      return "\n\n";
    } else {
      return " ";
    }
  }

  static getRandomConceptOrSomething() {
    if (getRandFromRange(2) == 0) {
      return Verbs.motionVerbs[getRandFromRange(Verbs.motionVerbs.length)];
    } else {
      return Nouns.abstractActivities[
          getRandFromRange(Nouns.abstractActivities.length)];
    }
  }

  static getRandomAdverb() {
    return Adverbs.adverbs[getRandFromRange(Adverbs.adverbs.length)];
  }

  static getMotionVerb() {
    return Verbs.motionVerbs[getRandFromRange(Verbs.motionVerbs.length)];
  }

  static getConcept() {
    return Nouns.concepts[getRandFromRange(Nouns.concepts.length)];
  }

  static getTimeAdverb() {
    return Adverbs.timeAdverbs[getRandFromRange(Adverbs.timeAdverbs.length)];
  }

  static getAbstractActivity() {
    return Nouns
        .abstractActivities[getRandFromRange(Nouns.abstractActivities.length)];
  }

  static getVerb() {
    return Verbs.verbs[getRandFromRange(Verbs.verbs.length)];
  }

  static getSponsorIntro() {
    return WaysToStartAThought.sponsorIntros[
        getRandFromRange(WaysToStartAThought.sponsorIntros.length)];
  }

  static getVerbPastTense() {
    return Verbs.verbsPastTense[getRandFromRange(Verbs.verbsPastTense.length)];
  }

  static getVerbOfFinality() {
    return Verbs
        .verbsOfFinality[getRandFromRange(Verbs.verbsOfFinality.length)];
  }

  static getAthletics() {
    return Nouns.athletics[getRandFromRange(Nouns.athletics.length)];
  }

  static getLandsAndEmpires() {
    return Nouns
        .landsAndEmpires[getRandFromRange(Nouns.landsAndEmpires.length)];
  }

  static getGroupsOfAnimalsOrPeople() {
    return Nouns.groupsOfAnimalsOrPeople[
        getRandFromRange(Nouns.groupsOfAnimalsOrPeople.length)];
  }

  static getAdverb() {
    return Adjectives.convertToAdverb(
        Adjectives.adjectives[getRandFromRange(Verbs.verbs.length)]);
  }

  static getAdverb2() {
    return Adverbs.adverbs2[getRandFromRange(Adverbs.adverbs2.length)];
  }

  static getRandomIncorporation() {
    return Nouns.randomIncorporation[
        getRandFromRange(Nouns.randomIncorporation.length)];
  }

  static getSubjectivePronoun() {
    return Pronouns.subjectivePronouns[
        getRandFromRange(Pronouns.subjectivePronouns.length)];
  }

  static getEntryFromBookOfSlang() {
    return BookOfSlang.patterns[getRandFromRange(BookOfSlang.patterns.length)];
  }

  static getSubjectivePronoun2() {
    return Pronouns.subjectivePronouns2[
        getRandFromRange(Pronouns.subjectivePronouns2.length)];
  }

  static getPersonalPronoun() {
    return Pronouns
        .personalPronouns[getRandFromRange(Pronouns.personalPronouns.length)];
  }

  static getMalady() {
    return Nouns.maladies[getRandFromRange(Nouns.maladies.length)];
  }

  static getStrangeGroupsOfPeople() {
    return Nouns.strangeGroupsOfPeople[
        getRandFromRange(Nouns.strangeGroupsOfPeople.length)];
  }

  static getPersonalPronoun2() {
    return Pronouns
        .personalPronouns2[getRandFromRange(Pronouns.personalPronouns2.length)];
  }

  static getObjectivePronouns() {
    return Pronouns
        .objectivePronouns[getRandFromRange(Pronouns.objectivePronouns.length)];
  }

  static getPossessivePronouns() {
    return Pronouns.possessivePronouns[
        getRandFromRange(Pronouns.possessivePronouns.length)];
  }

  static getPossessivePronouns2() {
    return Pronouns.possessivePronouns2[
        getRandFromRange(Pronouns.possessivePronouns2.length)];
  }

  static getDemonstrativePronouns() {
    return Pronouns.demonstrativePronouns[
        getRandFromRange(Pronouns.demonstrativePronouns.length)];
  }

  static getDemonstrativePronouns2() {
    return Pronouns.demonstrativePronouns2[
        getRandFromRange(Pronouns.demonstrativePronouns2.length)];
  }

  static getInterrogativePronouns() {
    return Pronouns.interrogativePronouns[
        getRandFromRange(Pronouns.interrogativePronouns.length)];
  }

  static getRelativePronouns() {
    return Pronouns
        .relativePronouns[getRandFromRange(Pronouns.relativePronouns.length)];
  }

  static getReflexivePronouns() {
    return Pronouns
        .reflexivePronouns[getRandFromRange(Pronouns.reflexivePronouns.length)];
  }

  static getIntensivePronouns() {
    return Pronouns
        .intensivePronouns[getRandFromRange(Pronouns.intensivePronouns.length)];
  }

  static getIntensivePronouns2() {
    return Pronouns.intensivePronouns2[
        getRandFromRange(Pronouns.intensivePronouns2.length)];
  }

  static getReciprocalPronouns() {
    return Pronouns.reciprocalPronouns[
        getRandFromRange(Pronouns.reciprocalPronouns.length)];
  }

  static getIndefinitePronouns() {
    return Pronouns.indefinitePronouns[
        getRandFromRange(Pronouns.indefinitePronouns.length)];
  }

  static getPreposition() {
    return PrepositionsList.prepositionsList[
        getRandFromRange(PrepositionsList.prepositionsList.length)];
  }

  static getPreposition2() {
    return PrepositionsList.prepositionsList2[
        getRandFromRange(PrepositionsList.prepositionsList2.length)];
  }

  static getGreatOpening() {
    return WaysToStartAThought.greatOpenings[
        getRandFromRange(WaysToStartAThought.greatOpenings.length)];
  }

  static getAdjective() {
    return Adjectives
        .adjectives[getRandFromRange(Adjectives.adjectives.length)];
  }

  static getPastTenseVerbStateOfExistence() {
    return Verbs.pastTenseVerbStateOfExistence[
        getRandFromRange(Verbs.pastTenseVerbStateOfExistence.length)];
  }

  static getDesirableQuality() {
    return Qualities.desirableQualitiesList[
        getRandFromRange(Qualities.desirableQualitiesList.length)];
  }

  static getParticle() {
    return Particles
        .particlesList[getRandFromRange(Particles.particlesList.length)];
  }

  static getWayToStartAThought() {
    return WaysToStartAThought.waysToStartAThought[
        getRandFromRange(WaysToStartAThought.waysToStartAThought.length)];
  }

  static getStateOfExistence() {
    return StatesOfExistence
        .states[getRandFromRange(StatesOfExistence.states.length)];
  }

  static getQuantity() {
    return Quantities
        .quantities[getRandFromRange(Quantities.quantities.length)];
  }

  static getTravelling() {
    return Nouns.travels[getRandFromRange(Nouns.travels.length)];
  }

  static getColor() {
    return Adjectives.colors[getRandFromRange(Adjectives.colors.length)];
  }

  static getRandFromRange(int maxNum) {
    var randClass = Random();
    var randNum = randClass.nextInt(maxNum);
    return randNum;
  }
}
