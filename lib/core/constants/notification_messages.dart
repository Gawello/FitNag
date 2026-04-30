class NagMessages {
  NagMessages._();

  /// Level 1: Friendly (at preferred workout time)
  static const List<String> level1 = [
    "Hey! It's workout o'clock. Your muscles miss you.",
    "Time to move! Your body has been waiting all day for this.",
    "Workout time! Let's make those gains, shall we?",
    "Your workout is calling. It says it misses you.",
    "Rise and grind! (Or at least... rise and do a push-up?)",
    "Hey champion! Your workout plan is ready and waiting.",
    "Psst... your dumbbells are lonely. Go visit them.",
    "Your future six-pack just sent a reminder. Time to work out!",
  ];

  /// Level 2: Gentle guilt (+2 hours)
  static const List<String> level2 = [
    "Your future self is giving you the side-eye right now.",
    "Still waiting... Your workout isn't going to do itself, you know.",
    "Two hours have passed. Your muscles are starting to worry.",
    "Hey, remember that workout? It remembers you.",
    "Your workout plan is starting to think you've forgotten about it.",
    "Just checking in... that workout is still on the to-do list, right?",
    "Your excuses are getting a workout today. How about YOU get one too?",
    "I don't want to be dramatic, but your gains are fading as we speak.",
  ];

  /// Level 3: Passive-aggressive (+4 hours)
  static const List<String> level3 = [
    "I've been waiting here for 4 hours. It's fine. Everything is fine.",
    "Oh, you're busy? That's cool. Your muscles will just... atrophy.",
    "No rush. Take your time. It's not like fitness is important or anything.",
    "I see you've chosen the 'skip day' workout plan. Bold choice.",
    "Your couch is winning right now. Are you really going to let that happen?",
    "Plot twist: the workout was inside you all along. But also... do the actual workout.",
    "Your {streak}-day streak is nervously pacing back and forth.",
    "Hey, your workout just texted. It says 'are we still on or...?'",
  ];

  /// Level 4: Dramatic (+6 hours)
  static const List<String> level4 = [
    "Your streak is literally crying right now. Can you hear it?",
    "BREAKING NEWS: Local person's fitness goals seen walking out the door.",
    "Your gym clothes are gathering dust. They're writing a memoir about neglect.",
    "The ghost of gains past has entered the chat.",
    "Even your rest days are judging you right now.",
    "Your {streak}-day streak is on life support. Only YOU can save it.",
    "Alert: Your motivation has filed a missing persons report.",
    "This is your conscience speaking. We need to talk about that workout.",
  ];

  /// Level 5: Last chance (2h before midnight)
  static const List<String> level5 = [
    "EMERGENCY: Your {streak}-day streak expires at midnight!",
    "FINAL WARNING: {streak} days of progress vanish in 2 hours!",
    "CODE RED: Your streak is about to flatline. GET MOVING!",
    "Last call! Your {streak}-day streak has 2 hours to live!",
    "MAYDAY MAYDAY: Streak death imminent. Even 10 minutes counts!",
    "This is not a drill. Your {streak}-day streak needs you NOW.",
    "The clock is ticking. Your streak's fate is in your hands.",
    "2 hours until midnight. Your streak is writing its will.",
  ];

  /// Rest day messages
  static const List<String> restDay = [
    "Rest day! You've earned it. (But I'm watching.)",
    "Enjoy your rest day! Recovery is part of the process.",
    "Rest day mode: activated. Don't get TOO comfortable though.",
    "Your muscles are thanking you for the rest day. Tomorrow, no mercy.",
    "Rest day! Even superheroes take a day off. You're basically a superhero.",
  ];

  /// Morning after missed workout
  static const List<String> missedDay = [
    "Your streak... it didn't make it. But you can start a new one RIGHT NOW.",
    "Yesterday happened. Today is a fresh start. Let's go!",
    "New day, new streak opportunity. Your past self would want this.",
    "The streak may be gone, but your potential isn't. Let's rebuild!",
    "Plot twist: today is day 1 of your LONGEST streak ever. Prove me right.",
  ];

  static String insertStreak(String message, int streak) {
    return message.replaceAll('{streak}', streak.toString());
  }
}
