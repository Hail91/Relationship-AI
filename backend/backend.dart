// In this script, you will find Phase as classes.
// one can call getScore and getPhaseType as well as incrementPhase
// Each InheritablePhase instance e.g. IntensifyingPhase and etc. can call bool canProceedToNextPhase(); bool hasChallenge(); bool challengeUnlocked(); List<String> getUnlockedEvents(); List<String> getUnlockedEventsNotPassed();
// after determining this, one can call getNextPhase.

// to start using this from frontend, you would need to call getInitialPhase(), afterwards you can call all methods and just cycle through getNextPhase() after switchToTrue
// after switchToTrue and making sure all eventsPassed using canProceedToNextPhase and getUnlockedEvents()

// getScore() contains all the EXPECTED QUESTIONNAIRE ANSWERS !!!!!!!!!!!
// i.e.
// <1 MONTH, 3 MONTHS, 6 MONTHS, 1 YEAR, 2+ YEARS, YES, NO


// int main(){
  
//   var x = "<1 mOnth";
//   print(x.toUpperCase());
  
// }

enum PhaseType{
  Initiating, Experimenting, Intensifying, Integrating, Bonding, Differentiating, Circumscribing
}

abstract class InheritablePhase extends Phase {
  PhaseType phaseType;
  String info = "";
  List<String> events = []; // including challenge if got
  List<List<String>> eventsRecommendations = [[]];// List of list of strings, each List of String corersponds to the Event at the same position
  List<bool> eventsPassed = [];// each boolean corresponds to the event at the same pos


  bool hasChallenge(){
    // return true if this Phase has a challenge, false otherwise
    return events[events.length - 1] == Phase.CHALLENGE;
  }

  bool challengeUnlocked(){ 
    // return false if doesn't have challenge.
    // return true if challenge has been unlocked and false otherwise.

     bool flag = true;
    for (int i = 0; i < eventsPassed.length - 1; i++){
      flag = flag && eventsPassed[i];
    }
    return flag && this.hasChallenge();
  }

  List<String> getUnlockedEvents(){ // get all unlocked events
  // return all the events that has been unlocked
    if (this.hasChallenge()){
      if (this.challengeUnlocked()){
        return events;
      }
      else{
        return events.sublist(0, events.length - 1);
      }
    }
    else{
      return events;
    }
  }

  List<String> getUnlockedEventsNotPassed(){
    List<String> retList = [];
    List<String> allUnlockedEvents = getUnlockedEvents();
    for (int i = 0; i < allUnlockedEvents.length; i++){
      if (eventsPassed[i] == false){
       retList.add(allUnlockedEvents[i]); 
      }
    }
    return retList;
  }

  bool canProceedToNextPhase(){ 
    // return true if can proceed to next phase (all events passed).
    bool flag = true;
    for (int i = 0; i < eventsPassed.length; i++){
      flag = flag && eventsPassed[i];
    }
    return flag;
  }

  bool switchToTrue(String event){// event is from list: events, return true if succeed, false if fail.
    int idx = 0;
    while (idx < events.length){
      if (event == events[idx]){
        break;
      }
      idx++;
    }
    if (idx < events.length){
      eventsPassed[idx] = true;
      return true;
    }
    else{
      return false;
    }
  }
}

class Initiating_Phase extends InheritablePhase{
  PhaseType phaseType = PhaseType.Initiating;
  String info = Phase.INITIATING_INFO;
  List<String> events = Phase.INITIATING_EVENTS; // including challenge if got
  List<List<String>> eventsRecommendations = [Phase.INITIATING_CREATE_SMALL_TALK_RECOMMENDATION];// List of list of strings, each List of String corersponds to the Event at the same position
  List<bool> eventsPassed = new List<bool>.generate(Phase.INITIATING_EVENTS.length, (i) => false);// each boolean corresponds to the event at the same pos
  @override
  InheritablePhase getNextPhase() {
    if (!canProceedToNextPhase()){
      return null;
    }
    return new Experimenting_Phase();
  }
}

class Experimenting_Phase extends InheritablePhase {
  PhaseType phaseType = PhaseType.Experimenting;
  String info = Phase.EXPERIMENTING_INFO;
  List<String> events = Phase.EXPERIMENTING_EVENTS; // including challenge if got
  List<List<String>> eventsRecommendations = [Phase.EXPERIMENTING_DO_NEW_THINGS_RECOMMENDATION, Phase.EXPERIMENTING_FIND_SIMILARITIES_RECOMMENDATION, Phase.EXPERIMENTING_LEARN_NEW_THINGS_RECOMMENDATION];// List of list of strings, each List of String corersponds to the Event at the same position
  List<bool> eventsPassed = new List<bool>.generate(Phase.EXPERIMENTING_EVENTS.length, (i) => false);// each boolean corresponds to the event at the same pos
  @override
  InheritablePhase getNextPhase() {
    if (!canProceedToNextPhase()){
      return null;
    }
    return new Intensifying_Phase();
  }
}


class Intensifying_Phase extends InheritablePhase {
  PhaseType phaseType = PhaseType.Intensifying;
  String info = Phase.INTENSIFYING_INFO;
  List<String> events = Phase.INTENSIFYING_EVENTS; // including challenge if got
  List<List<String>> eventsRecommendations = [Phase.INTENSIFYING_INTRODUCING_THEM, Phase.INTENSIFYING_MAKE_LAUGH, Phase.INTENSIFYING_MAKE_SPECIAL_EXPERIENCE];// List of list of strings, each List of String corersponds to the Event at the same position
  List<bool> eventsPassed = new List<bool>.generate(Phase.INTENSIFYING_EVENTS.length, (i) => false);// each boolean corresponds to the event at the same pos
  @override
  InheritablePhase getNextPhase() {
    if (!canProceedToNextPhase()){
      return null;
    }
    return new Integrating_Phase();
  }
}

class Integrating_Phase extends InheritablePhase {
   PhaseType phaseType = PhaseType.Integrating;
  String info = Phase.INTEGRATING_INFO;
  List<String> events = Phase.INTEGRATING_EVENTS; // including challenge if got
  List<List<String>> eventsRecommendations = [Phase.INTEGRATING_BECOMING_KNOWN, Phase.INTEGRATING_BECOMING_ONE_ANOTHER, Phase.INTEGRATNG_FAMILY_TIME_TOGETHER, Phase.INTEGRATING_CHALLENGE];// List of list of strings, each List of String corersponds to the Event at the same position
  List<bool> eventsPassed = new List<bool>.generate(Phase.INTEGRATING_EVENTS.length, (i) => false);// each boolean corresponds to the event at the same pos
  @override
  InheritablePhase getNextPhase() {
    if (!canProceedToNextPhase()){
      return null;
    }
    return new Bonding_Phase();
  }
}
class Bonding_Phase extends InheritablePhase {
   PhaseType phaseType = PhaseType.Bonding;
  String info = Phase.BONDING_INFO;
  List<String> events = Phase.BONDING_EVENTS; // including challenge if got
  List<List<String>> eventsRecommendations = [Phase.BONDING_COLLABORATIVE_FINANCIAL_STRATS, Phase.BONDING_MAJOR_PURCHASES, Phase.BONDING_MARRIAGE, Phase.BONDING_CHALLENGE];// List of list of strings, each List of String corersponds to the Event at the same position
  List<bool> eventsPassed = new List<bool>.generate(Phase.BONDING_EVENTS.length, (i) => false);// each boolean corresponds to the event at the same pos
  @override
  InheritablePhase getNextPhase() {
    if (!canProceedToNextPhase()){
      return null;
    }
    return new Differentiating_Phase();
  }
}
class Differentiating_Phase extends InheritablePhase {
   PhaseType phaseType = PhaseType.Differentiating;
  String info = Phase.DIFFERENTIATING_INFO;
  List<String> events = Phase.DIFFERENTIATING_EVENTS; // including challenge if got
  List<List<String>> eventsRecommendations = [Phase.DIFFERENTIATING_DEVELO_NEW_SKILL, Phase.DIFFERENTIATING_GET_THROUGH_AN_ARGUMENT_HAPPY, Phase.DIFFERENTIATING_PARTNER_REQ_PRIVACY, Phase.DIFFERENTIATING_CHALLENGE];// List of list of strings, each List of String corersponds to the Event at the same position
  List<bool> eventsPassed = new List<bool>.generate(Phase.DIFFERENTIATING_EVENTS.length, (i) => false);// each boolean corresponds to the event at the same pos
  @override
  InheritablePhase getNextPhase() {
    if (!canProceedToNextPhase()){
      return null;
    }
    return new Circumscribing_Phase();
  }
}
class Circumscribing_Phase extends InheritablePhase { // [1,2,3] [true, false, false]
  PhaseType phaseType = PhaseType.Circumscribing;
  String info = Phase.CIRCUMSCRIBING_INFO;
  List<String> events = Phase.CIRCUMSCRIBING_EVENTS; // including challenge if got
  List<List<String>> eventsRecommendations = [Phase.CIRCUMSCRIBING_HAVE_ARGUMENT, Phase.CIRCUMSCRIBING_INDEPENDENT_ACTIVITIES, Phase.CIRCUMSCRIBING_MAKE_NEW_CONNECTIONS, Phase.CIRCUMSCRIBING_CHALLENGE];// List of list of strings, each List of String corersponds to the Event at the same position
  List<bool> eventsPassed = new List<bool>.generate(Phase.CIRCUMSCRIBING_EVENTS.length, (i) => false);// each boolean corresponds to the event at the same pos
  @override
  InheritablePhase getNextPhase() {
    return null;
  }
}

abstract class Phase {
  // for info get the first on each section.
  static var NUM_MESSAGES = 9;
  static List<PhaseType> PHASE_LIST = [PhaseType.Initiating, PhaseType.Experimenting, PhaseType.Intensifying, PhaseType.Integrating, PhaseType.Bonding, PhaseType.Differentiating, PhaseType.Circumscribing];
  
  static var CHALLENGE = "CHALLENGE";

  static var INITIATING_INFO = "Goals in the first stage are to show that you are interested in making contact and to show that you are intersted in making contact and to show that you are the kind of person worth talking to.  Communication during the INITIATING  stage is usually brief, and it generally  follows conventional formulas: handshakes, remarks about innocuous subjects like the weather, and friendly expressions.  These kind of behaviour may seem superficial and meaningless, but they are a way of signaling that we're interested in building some kind of relationship with the other person.  They allow us to say without saying \"I'm a friendly person, and I'd like to get to know you.\"";
  static var INITIATING_EVENTS = ["Create small talk"];
  static var INITIATING_CREATE_SMALL_TALK_RECOMMENDATION = ["Ask about sports team", "Ask about new tv show", "Ask about world events", "Ask about new person in town", "Where did you buy that?", "What type of item is that?"];

  static var EXPERIMENTING_INFO = "After we have made contact with a new person, the next stage is to decide whether we are interested in pursuing the relationship further.  This involves uncertainty reduction - the process of getting to know others by gaining more information about them.  A usual part of uncertainty reduction is the search for common ground, and it involves the conversational basics such as \"Where are you from?\" or \"What's your major?\"  From there we look for other similarities: \"You're a runner, too?  How many miles do you do a week?\"";
  static var EXPERIMENTING_EVENTS = ["Learn new things about eachother", "Find similarites", "Do new things together"];
  static var EXPERIMENTING_LEARN_NEW_THINGS_RECOMMENDATION = ["Ask where are you from?", "Ask about favorite hobbies", "Ask about favorite music group", "Ask about favorite sports team"];
  static var EXPERIMENTING_FIND_SIMILARITIES_RECOMMENDATION = ["Ask them if they like doing things that you enjoy", "Cook them your favorite meal", "Watch with them your favorite movie"];
  static var EXPERIMENTING_DO_NEW_THINGS_RECOMMENDATION = ["Join a club together", "Go to sporting events together", "Take a cooking class together"];

  static var INTENSIFYING_INFO = "In the INTENSIFYING stage the kind of truly interpersonal relationship begins to develop.  Several changes in communication patterns occur during intenfying.  The expression of feeling toward the other becomes more common.  Dating couples use a wide range of communication stategies to describe their feelings toward the other becomes more common.  Dating couples use a wide range of communication strategies to describe their feelings of attraction.  ABout one-quarter of the time they express their feelings directly, using metacommunication to discuss the state of the relationship.  More often they use less-direct methods of communication: spending an increased amount of time together, asking for support from one another, doing favors for the partner, giving tokens of affection, hinting and flirting, expressing feelings nonverbally, getting to know the partner's friends and family, and trying to look more physically attractive.";
  static var INTENSIFYING_EVENTS = ["Make a special experience", "Make laugh", "Introducing them", "CHALLENGE"];
  static var INTENSIFYING_MAKE_SPECIAL_EXPERIENCE = ["Calling eachother names you only call eachother", "Show you care with words of affection", "Give a gift in rememberance of a special event"];
  static var INTENSIFYING_MAKE_LAUGH = ["Tell a joke", "Go to a stand up comedian", "Watch a funny movie together"];
  static var INTENSIFYING_INTRODUCING_THEM = ["Group hangout with friends", "Bringing them to dinner with your family", "Bring them to a work function"];

  static var INTEGRATING_INFO = "As the relationship strengthens, the parties begin to take on an identity as a social unit.  In romantic relationshipss, invitations begin to come addressed to the couple.  Social circles merge.  The partners begin to take on each other's commitments\" \"Sure, we'll spend Thanksgiving with your family.\"  Common property may begin to be designated - our apartment, our car, our song.  Partners develop unique, ritualistic ways of behaving.  They may even begin to speak alike, using personal idioms and sentence patterns.  In this sense, the INTEGRATING stage is a time when we give up some characteristics of our old selves and develop shared identities.";
  static var INTEGRATING_EVENTS = ["Becoming one another", "Family time together", "Becoming known as one by friends/family"];
  static var INTEGRATING_BECOMING_ONE_ANOTHER = ["Using their words or language", "Liking their hobbies", "Purchase matching items for eachother"];
  static var INTEGRATNG_FAMILY_TIME_TOGETHER = ["Family group text messages"];
  static var INTEGRATING_BECOMING_KNOWN = ["Being invited to outings together", "Being invited to outings together", "Addressing each other as a couple", "Leave behind your past, focus only on now and the future"];
  static var INTEGRATING_CHALLENGE = ["Spend 3+ nights with partner's family without partner."];

  static var BONDING_INFO = "During the BONDING stage, the parties make symbolic public gestures to show the world that their relationship exists.  The most common form of bonding in romantic relationships is a wedding ceremony and the legal ties that come with it.  Bonding generates social support for the relationship.  Custo and law both impose certain obligations on partners who have officially bonded.";
  static var BONDING_EVENTS = ["Marriage", "Major purchases", "Collaborative financial strats", "CHALLENGE"];
  static var BONDING_MARRIAGE = ["Discuss Marriage", "Make marriage proposal", "Ring shopping"];
  static var BONDING_MAJOR_PURCHASES = ["Buying house together", "Car payments together", "Purchase a dog"];
  static var BONDING_COLLABORATIVE_FINANCIAL_STRATS = ["Shared bill pay", "Joint bank account", "Retirement funds"];
  static var BONDING_CHALLENGE = ["Propose to partner"];

  static var DIFFERENTIATING_INFO = "Bonding is the peak of what is called \"coming together\" phase of relational development.  But people in even the most committed relationships need to assert their individual identities.  This DIFFERENTIATING stage is the point where the \"hold me tight\" orientation that has existed shifts and \"put me down\" message begin to occur.  Partners use a variety of strategies to gain privacy from one another.  Sometimes they confront the other party directly, explaining that they don't want to continue a discussion.  At other times they are less direct, offering nonverbal cues, changing the topic, or leaving the room.";
  static var DIFFERENTIATING_EVENTS = ["Partner request for privacy", "Get through an argument happy", "Develop a new skill", "CHALLENGE"];
  static var DIFFERENTIATING_PARTNER_REQ_PRIVACY = ["Tell partner you will respect their request for privacy.", "Tell partner if upset that you will be going to store and will be back in an hour.", "Tell partner you will do some household chores."];
  static var DIFFERENTIATING_GET_THROUGH_AN_ARGUMENT_HAPPY = ["Tell partner respectfully that you think you should both take time to cool down and reflect", "Ask partner to explain their feelings about what bothers them", "Revisit a heated discussion at a later time without placing blame.  Try to understand their feelings first."];
  static var DIFFERENTIATING_DEVELO_NEW_SKILL = ["Take up a new hobby", "Join an organization", "Start volunteering"];
  static var DIFFERENTIATING_CHALLENGE = ["Take at least 4 days to write a poem."];

  static var CIRCUMSCRIBING_INFO = "Above phases look at growth of the relationship.  Although some reach a plateau of development, going on successfully for as long as a lifetime, others pass through several stages of decline and dissolution.  In the CIRCUMSCRIBING stage communication between members decreases in quantity and quality.  Restrictions and restraints characterize this stage.  Rather than discuss a disagreement (which requires energy on both sides) members opt for withdrawal - either mental (silence or day-dreaming and fantasizing) or physical (where people spend less time together).  Circumscribing doesn't involve total avoidance, which may come later.  Rather, it involves a certain shrinking of interest and commitement.";
  static var CIRCUMSCRIBING_EVENTS = ["Have an argument", "Independent activities", "Make new connections", "CHALLENGE"];
  static var CIRCUMSCRIBING_HAVE_ARGUMENT = ["Let partner vent about disagreement", "Talk about what bothers partner, don't offer to solve problem but let them know that you understand", "After determining how both parties feel, make a proposal for next steps and give space for counter proposals."];
  static var CIRCUMSCRIBING_INDEPENDENT_ACTIVITIES = ["Encourage partner to pursue independent hobbies and activities", "Give partner space to follow new interests", "Genuinely show interest in new activities and show praise in successes."];
  static var CIRCUMSCRIBING_MAKE_NEW_CONNECTIONS = ["Purchase a dog", "Make new friend", "Start a club"];
  static var CIRCUMSCRIBING_CHALLENGE = ["Block ou your plans and your partners plans and spend a full day together."];

  // List<String> getChallenge(); // return null if no challenge or not unlocked

  bool canProceedToNextPhase();

  bool hasChallenge();


  bool challengeUnlocked();

  List<String> getUnlockedEvents();

  InheritablePhase getNextPhase(); // returns null if not available;
}


/*
List<String> getPhaseEventsStrings(PhaseType phaseType){
  if (phaseType == PhaseType.Initiating){
    return Phase.EXPERIMENTING_EVENTS;
  }
  else if (phaseType == PhaseType.Experimenting){
    return Phase.EXPERIMENTING_EVENTS;
  }
  else if (phaseType == PhaseType.Intensifying){
    return Phase.INTENSIFYING_EVENTS;
  }
  else if (phaseType == PhaseType.Integrating){
    return Phase.INTEGRATING_EVENTS;
  }
  else if (phaseType == PhaseType.Bonding){
    return Phase.BONDING_EVENTS;
  }
  else if (phaseType == PhaseType.Differentiating){
    return Phase.DIFFERENTIATING_EVENTS;
  }
  else if (phaseType ==  PhaseType.Circumscribing){
    return Phase.CIRCUMSCRIBING_EVENTS;
  }
}
*/

Phase getInitialPhase(PhaseType phaseType){
    if (phaseType == PhaseType.Initiating){
    return new Initiating_Phase();
  }
  else if (phaseType == PhaseType.Experimenting){
    return new Experimenting_Phase();
  }
  else if (phaseType == PhaseType.Intensifying){
    return new Intensifying_Phase();
  }
  else if (phaseType == PhaseType.Integrating){
    return new Integrating_Phase();
  }
  else if (phaseType == PhaseType.Bonding){
    return new Bonding_Phase();
  }
  else if (phaseType == PhaseType.Differentiating){
    return new Differentiating_Phase();
  }
  else if (phaseType ==  PhaseType.Circumscribing){
    return new Circumscribing_Phase();
  }
}

PhaseType getPhaseType(int score){
  if (score <= 5){
    return PhaseType.Initiating;
  }
  else if (score > 5 && score <= 10){
    return PhaseType.Experimenting;
  }
  else if (score > 10 && score <= 15){
    return PhaseType.Intensifying;
  }
  else if (score > 15 && score <= 20){
    return PhaseType.Integrating;
  }
  else if (score > 20 && score <= 30){
    return PhaseType.Bonding;
  }
  else if (score > 28 && score <= 35){
    return PhaseType.Differentiating;
  }
  else{
    return PhaseType.Circumscribing;
  }
}

int getScore(List<String> list_of_answers){
  // e.g. ["<1 month", "YES", "NO", "YES"] <-- all questions
  // translate list of answers to a score
  // precondition: expect the same order everytime
  assert(list_of_answers.length == Phase.NUM_MESSAGES); //how to get global variable
  
  int score = 0;
  for (int i = 0; i < list_of_answers.length; i++){
    if (i == 0){
      if (list_of_answers[i].toUpperCase() == "<1 MONTH"){
        score += 1;
      }
      else if (list_of_answers[i].toUpperCase() == "3 MONTHS"){
        score += 3;
      }
      else if (list_of_answers[i].toUpperCase() == "6 MONTHS"){
        score += 5;
      }
      else if (list_of_answers[i].toUpperCase() == "1 YEAR"){
        score += 8;
      }
      else if (list_of_answers[i].toUpperCase() == "2+ YEARS"){
        score += 10;
      }
    }
    else if (i == 1){
      if (list_of_answers[i].toUpperCase() == "NO"){
        score += 0;
      }
      else {
        score += 2;
      }
    }
    else if (i == 2){
      if (list_of_answers[i].toUpperCase() == "NO"){
        score += 0;
      }
      else {
        score += 2;
      }
    }
    else if (i == 3){
      if (list_of_answers[i].toUpperCase() == "NO"){
        score += 0;
      }
      else {
        score += 5;
      }
    }
    else if (i == 4){
      if (list_of_answers[i].toUpperCase() == "NO"){
        score += 0;
      }
      else {
        score += 2;
      }
    }
    else if (i == 5){
      if (list_of_answers[i].toUpperCase() == "NO"){
        score += 0;
      }
      else {
        score += 2;
      }
    }
    else if (i == 6){
      if (list_of_answers[i].toUpperCase() == "NO"){
        score += 0;
      }
      else {
        score += 2;
      }
    }
    else if (i == 7){
      if (list_of_answers[i].toUpperCase() == "NO"){
        score += 0;
      }
      else {
        score += 2;
      }
    }
    else if (i == 8){
      if (list_of_answers[i].toUpperCase() == "NO"){
        score += 0;
      }
      else {
        score += 10;
      }
    }
  }
  return score;
}


// void challenge_cleared(PhaseType currentPhase, String challengeAnswer){}
// find out what the current Phase's challenge is, check the answer, if pass, increment phase.

/*
PhaseType incrementPhase(PhaseType currentPhase){
  var PHASE_LIST = Phase.PHASE_LIST;
  int posOfCurrentPhase = -1;
  for (int i = 0; i < PHASE_LIST.length; i++){
    if (PHASE_LIST[i] == currentPhase){
      posOfCurrentPhase = i;
    }
  }
  if (posOfCurrentPhase == PHASE_LIST.length - 1){
    return PHASE_LIST[posOfCurrentPhase]; // already at the final phase.
  }
  return PHASE_LIST[posOfCurrentPhase + 1];
}

String askQuestion(Phase phase){
  return "HEllo";
}
*/