import 'exercise.dart';

class IndividualCardioExercisesList {
  final int breakTime;
  final int repetitions;
  late final List<Exercise> exercises;

  IndividualCardioExercisesList({required this.breakTime, required this.repetitions}) {
    exercises = [
      Exercise(
        title: "Warm-Up:",
        duration: "01:00",
        time: 60,
        breakTime: breakTime,
        exercise: "Easy pace jogging in place",
        breathing:
        "Steady and rhythmic breathing, inhale through nose, exhale through mouth.",
        technique: "Relax shoulders, keep body loose and comfortable.",
      ),
      Exercise(
        title: "Moderate-Jogging:",
        duration: "01:00",
        time: 60,
        breakTime: breakTime,
        exercise: "Consistent, comfortable jogging rhythm",
        breathing: "Controlled breaths; breathe comfortably and regularly.",
        technique: "Arms relaxed at sides, feet landing softly.",
      ),
      Exercise(
        title: "Interval Boost:",
        duration: "02:00",
        time: 120,
        breakTime: breakTime,
        exercise: "Alternate 30 sec moderate running / 30 sec walking",
        breathing: "Increase breathing depth slightly during running intervals.",
        technique:
        "Smooth transitions between running and walking; maintain good posture.",
      ),
      Exercise(
        title: "Steady Cardio:",
        duration: "02:00",
        time: 120,
        breakTime: breakTime,
        exercise: "Moderate-paced jumping jacks and light squats",
        breathing: "Regular rhythm—exhale on effort (jump up, squat down).",
        technique:
        "Maintain steady pace, soft knee landing, controlled movements.",
      ),
    ];
  }
}
class IndividualHIITExercisesList {

  final int breakTime;
  final int repetitions;
  late final List<Exercise> exercises;


  IndividualHIITExercisesList({required this.breakTime, required this.repetitions}) {
     exercises = [
      Exercise(
        title: "Explosive Intervals:",
        duration: "01:00",
        time: 60,
        breakTime: breakTime,
        exercise: "Burpees",
        breathing:
        "Burpees: Exhale forcefully on jump, inhale deeply on descent.\nJump Squats: Exhale sharply on upward jump, inhale on squat descent.",
        technique: "Engage core, explosive movements, soft landings.",
      ),
      Exercise(
        title: "Explosive Intervals:",
        duration: "01:00",
        time: 60,
        breakTime: breakTime,
        exercise: "Jump Squats",
        breathing:
        "Burpees: Exhale forcefully on jump, inhale deeply on descent.\nJump Squats: Exhale sharply on upward jump, inhale on squat descent.",
        technique: "Engage core, explosive movements, soft landings.",
      ),
      Exercise(
        title: "Speed Drills:",
        duration: "01:00",
        time: 60,
        breakTime: breakTime,
        exercise: "High Knees",
        breathing:
        "High Knees: Quick rhythmic breaths; exhale sharply on knee lift.\nMountain Climbers: Controlled breathing matching each leg drive.",
        technique: "Knees high, core engaged, maintain quick pace.",
      ),
      Exercise(
        title: "Speed Drills:",
        duration: "01:00",
        time: 60,
        breakTime: breakTime,
        exercise: "Mountain Climbers",
        breathing:
        "High Knees: Quick rhythmic breaths; exhale sharply on knee lift.\nMountain Climbers: Controlled breathing matching each leg drive.",
        technique: "Knees high, core engaged, maintain quick pace.",
      ),
      Exercise(
        title: "Power Finisher:",
        duration: "02:00",
        time: 120,
        breakTime: breakTime,
        exercise: "Sprint in place (30 sec max effort)",
        breathing: "Rapid, deep breaths; focus on strong exhalations.",
        technique:
        "Sprint with maximum intensity, high knee drive, pump arms actively.",
      ),
    ];
  }
}

class FatBurnExercisesList {
  final List<Exercise> exercises = [
    Exercise(
      title: "Warm-Up:",
      duration: "02:00",
      time: 120,
      exercise: "Easy pace jogging in place",
      breathing:
          "Steady and rhythmic breathing, inhale through nose, exhale through mouth.",
      technique: "Relax shoulders, keep body loose and comfortable.",
    ),
    Exercise(
      title: "Moderate-Jogging:",
      duration: "04:00",
      time: 240,
      exercise: "Consistent, comfortable jogging rhythm",
      breathing: "Controlled breaths; breathe comfortably and regularly.",
      technique: "Arms relaxed at sides, feet landing softly.",
    ),
    Exercise(
      title: "Active Rest:",
      duration: "01:00",
      time: 60,
      exercise: "Slow walking",
      breathing: "Deep and controlled breathing; inhale deeply, exhale slowly.",
      technique: "Walk gently, shake out arms and legs to recover.",
    ),
    Exercise(
      title: "Interval Boost:",
      duration: "03:00",
      time: 180,
      exercise: "Alternate 30 sec moderate running / 30 sec walking",
      breathing: "Increase breathing depth slightly during running intervals.",
      technique:
          "Smooth transitions between running and walking; maintain good posture.",
    ),
    Exercise(
      title: "Steady Cardio:",
      duration: "04:00",
      time: 240,
      exercise: "Moderate-paced jumping jacks and light squats",
      breathing: "Regular rhythm—exhale on effort (jump up, squat down).",
      technique:
          "Maintain steady pace, soft knee landing, controlled movements.",
    ),
    Exercise(
      title: "Cooldown:",
      duration: "01:00",
      time: 60,
      exercise: "Gentle stretching",
      breathing: "Slow, deep breaths to fully relax and lower heart rate.",
      technique: "Smooth, gentle stretches; avoid jerky movements.",
    ),
  ];
}

class EnduranceBoostExercisesList {
  final List<Exercise> exercises = [
    Exercise(
      title: "Warm-Up:",
      duration: "03:00",
      time: 180,
      exercise: "Easy jogging, dynamic stretches (arm circles, leg swings)",
      breathing: "Even, deep breaths through nose and mouth.",
      technique: "Slow and controlled movements, loosen muscles gently.",
    ),
    Exercise(
      title: "Steady State Run:",
      duration: "10:00",
      time: 600,
      exercise: "Comfortable pace running or stationary jogging",
      breathing: "Consistent rhythm; match breaths to stride comfortably.",
      technique: "Steady pace, relaxed upper body, even foot strike.",
    ),
    Exercise(
      title: "Interval Challenge:",
      duration: "08:00",
      time: 480,
      exercise: "Alternate 1 min moderate running / 1 min active recovery walk",
      breathing:
          "Moderate breaths during running, deeper recovery breaths during walking.",
      technique:
          "Smooth shifts between speeds; keep posture upright and relaxed.",
    ),
    Exercise(
      title: "Bodyweight Cardio:",
      duration: "07:00",
      time: 420,
      exercise:
          "Mountain climbers, jumping jacks, high knees (cycle continuously)",
      breathing:
          "Rhythmic, steady breathing; exhale forcefully during explosive movements.",
      technique:
          "Engage core, keep knees high, movements sharp and controlled.",
    ),
    Exercise(
      title: "Cooldown:",
      duration: "02:00",
      time: 120,
      exercise: "Slow walking, stretching hamstrings, calves",
      breathing: "Deep, calming breaths.",
      technique:
          "Hold gentle stretches comfortably; avoid forcing the muscles.",
    ),
  ];
}

class EasyStartExercisesList {
  final List<Exercise> exercises = [
    Exercise(
      title: "Gentle Warm-Up:",
      duration: "02:00",
      time: 120,
      exercise: "Slow walking, gentle arm circles, rotations",
      breathing: "Slow and relaxed breathing.",
      technique: "Gentle, smooth arm and leg movements; avoid strain.",
    ),
    Exercise(
      title: "Light Cardio:",
      duration: "03:00",
      time: 180,
      exercise: "Easy-paced step touches, slow-paced knee raises",
      breathing: "Relaxed breathing; exhale with each movement.",
      technique: "Soft, controlled movements; maintain gentle rhythm.",
    ),
    Exercise(
      title: "Recovery and Stretching:",
      duration: "02:00",
      time: 120,
      exercise: "Relaxing stretches for shoulders, back, legs",
      breathing: "Long, slow breaths for relaxation.",
      technique: "Gentle stretch hold; comfortable tension, no discomfort.",
    ),
  ];
}

class ExtremeHIITExercisesList {
  final List<Exercise> exercises = [
    Exercise(
      title: "Warm-Up:",
      duration: "02:00",
      time: 120,
      exercise: "Dynamic stretching, jogging in place, arm rotations",
      breathing: "Steady, even breathing; deep inhale, slow exhale.",
      technique:
          "Keep movements fluid and controlled, loosen muscles thoroughly.",
    ),
    Exercise(
      title: "Explosive Intervals:",
      duration: "00:40",
      time: 40,
      breakTime: 20,
      exercise: "Burpees",
      breathing:
          "Burpees: Exhale forcefully on jump, inhale deeply on descent.\nJump Squats: Exhale sharply on upward jump, inhale on squat descent.",
      technique: "Engage core, explosive movements, soft landings.",
    ),
    Exercise(
      title: "Explosive Intervals:",
      duration: "00:40",
      time: 40,
      breakTime: 20,
      exercise: "Jump Squats",
      breathing:
          "Burpees: Exhale forcefully on jump, inhale deeply on descent.\nJump Squats: Exhale sharply on upward jump, inhale on squat descent.",
      technique: "Engage core, explosive movements, soft landings.",
    ),
    Exercise(
      title: "Explosive Intervals:",
      duration: "00:40",
      time: 40,
      breakTime: 20,
      exercise: "Burpees",
      breathing:
          "Burpees: Exhale forcefully on jump, inhale deeply on descent.\nJump Squats: Exhale sharply on upward jump, inhale on squat descent.",
      technique: "Engage core, explosive movements, soft landings.",
    ),
    Exercise(
      title: "Explosive Intervals:",
      duration: "00:40",
      time: 40,
      breakTime: 20,
      exercise: "Jump Squats",
      breathing:
          "Burpees: Exhale forcefully on jump, inhale deeply on descent.\nJump Squats: Exhale sharply on upward jump, inhale on squat descent.",
      technique: "Engage core, explosive movements, soft landings.",
    ),
    Exercise(
      title: "Explosive Intervals:",
      duration: "00:40",
      time: 40,
      breakTime: 20,
      exercise: "Burpees",
      breathing:
          "Burpees: Exhale forcefully on jump, inhale deeply on descent.\nJump Squats: Exhale sharply on upward jump, inhale on squat descent.",
      technique: "Engage core, explosive movements, soft landings.",
    ),
    Exercise(
      title: "Explosive Intervals:",
      duration: "00:40",
      time: 40,
      breakTime: 20,
      exercise: "Jump Squats",
      breathing:
          "Burpees: Exhale forcefully on jump, inhale deeply on descent.\nJump Squats: Exhale sharply on upward jump, inhale on squat descent.",
      technique: "Engage core, explosive movements, soft landings.",
    ),
    Exercise(
      title: "Explosive Intervals:",
      duration: "00:40",
      time: 40,
      breakTime: 20,
      exercise: "Burpees",
      breathing:
          "Burpees: Exhale forcefully on jump, inhale deeply on descent.\nJump Squats: Exhale sharply on upward jump, inhale on squat descent.",
      technique: "Engage core, explosive movements, soft landings.",
    ),
    Exercise(
      title: "Explosive Intervals:",
      duration: "00:40",
      time: 40,
      breakTime: 20,
      exercise: "Jump Squats",
      breathing:
          "Burpees: Exhale forcefully on jump, inhale deeply on descent.\nJump Squats: Exhale sharply on upward jump, inhale on squat descent.",
      technique: "Engage core, explosive movements, soft landings.",
    ),
    Exercise(
      title: "Speed Drills:",
      duration: "00:40",
      time: 40,
      breakTime: 20,
      exercise: "High Knees",
      breathing:
          "High Knees: Quick rhythmic breaths; exhale sharply on knee lift.\nMountain Climbers: Controlled breathing matching each leg drive.",
      technique: "Knees high, core engaged, maintain quick pace.",
    ),
    Exercise(
      title: "Speed Drills:",
      duration: "00:40",
      time: 40,
      breakTime: 20,
      exercise: "Mountain Climbers",
      breathing:
          "High Knees: Quick rhythmic breaths; exhale sharply on knee lift.\nMountain Climbers: Controlled breathing matching each leg drive.",
      technique: "Knees high, core engaged, maintain quick pace.",
    ),
    Exercise(
      title: "Speed Drills:",
      duration: "00:40",
      time: 40,
      breakTime: 20,
      exercise: "High Knees",
      breathing:
          "High Knees: Quick rhythmic breaths; exhale sharply on knee lift.\nMountain Climbers: Controlled breathing matching each leg drive.",
      technique: "Knees high, core engaged, maintain quick pace.",
    ),
    Exercise(
      title: "Speed Drills:",
      duration: "00:40",
      time: 40,
      breakTime: 20,
      exercise: "Mountain Climbers",
      breathing:
          "High Knees: Quick rhythmic breaths; exhale sharply on knee lift.\nMountain Climbers: Controlled breathing matching each leg drive.",
      technique: "Knees high, core engaged, maintain quick pace.",
    ),
    Exercise(
      title: "Speed Drills:",
      duration: "00:40",
      time: 40,
      breakTime: 20,
      exercise: "High Knees",
      breathing:
          "High Knees: Quick rhythmic breaths; exhale sharply on knee lift.\nMountain Climbers: Controlled breathing matching each leg drive.",
      technique: "Knees high, core engaged, maintain quick pace.",
    ),
    Exercise(
      title: "Speed Drills:",
      duration: "00:40",
      time: 40,
      breakTime: 20,
      exercise: "Mountain Climbers",
      breathing:
          "High Knees: Quick rhythmic breaths; exhale sharply on knee lift.\nMountain Climbers: Controlled breathing matching each leg drive.",
      technique: "Knees high, core engaged, maintain quick pace.",
    ),
    Exercise(
      title: "Power Finisher:",
      duration: "00:30",
      time: 30,
      exercise: "Sprint in place (30 sec max effort)",
      breathing: "Rapid, deep breaths; focus on strong exhalations.",
      technique:
          "Sprint with maximum intensity, high knee drive, pump arms actively.",
    ),
    Exercise(
      title: "Power Finisher:",
      duration: "00:30",
      time: 30,
      exercise: "Sprint in place (30 sec max effort)",
      breathing: "Rapid, deep breaths; focus on strong exhalations.",
      technique:
          "Sprint with maximum intensity, high knee drive, pump arms actively.",
    ),
    Exercise(
      title: "Power Finisher:",
      duration: "00:30",
      time: 30,
      exercise: "Sprint in place (30 sec max effort)",
      breathing: "Rapid, deep breaths; focus on strong exhalations.",
      technique:
          "Sprint with maximum intensity, high knee drive, pump arms actively.",
    ),
    Exercise(
      title: "Cooldown:",
      duration: "01:00",
      time: 60,
      exercise: "Gentle stretching",
      breathing: "Slow, calming breaths to restore normal heart rate.",
      technique: "Easy stretching, avoid any sudden movements.",
    ),
  ];
}

class PowerIntervalsExercisesList {
  final List<Exercise> exercises = [
    Exercise(
      title: "Warm-Up:",
      duration: "03:00",
      time: 180,
      exercise: "Jogging, lunges, dynamic stretches",
      breathing: "Calm, rhythmic breaths.",
      technique: "Smooth, controlled motions; gradually increasing intensity.",
    ),
    Exercise(
      title: "High-Intensity Interval:",
      duration: "01:00",
      time: 60,
      breakTime: 60,
      exercise:
          "1 min Jumping Jacks (fast pace) → 1 min Active Rest (marching)",
      breathing:
          "Jumping Jacks: Consistent rhythm; exhale on upward motion.\nActive Rest: Slow, deep recovery breaths.",
      technique:
          "Steady, energetic pace; maintain posture and controlled movements.",
    ),
    Exercise(
      title: "High-Intensity Interval:",
      duration: "01:00",
      time: 60,
      breakTime: 60,
      exercise:
          "1 min Jumping Jacks (fast pace) → 1 min Active Rest (marching)",
      breathing:
          "Jumping Jacks: Consistent rhythm; exhale on upward motion.\nActive Rest: Slow, deep recovery breaths.",
      technique:
          "Steady, energetic pace; maintain posture and controlled movements.",
    ),
    Exercise(
      title: "High-Intensity Interval:",
      duration: "01:00",
      time: 60,
      breakTime: 60,
      exercise:
          "1 min Jumping Jacks (fast pace) → 1 min Active Rest (marching)",
      breathing:
          "Jumping Jacks: Consistent rhythm; exhale on upward motion.\nActive Rest: Slow, deep recovery breaths.",
      technique:
          "Steady, energetic pace; maintain posture and controlled movements.",
    ),
    Exercise(
      title: "High-Intensity Interval:",
      duration: "01:00",
      time: 60,
      breakTime: 60,
      exercise:
          "1 min Jumping Jacks (fast pace) → 1 min Active Rest (marching)",
      breathing:
          "Jumping Jacks: Consistent rhythm; exhale on upward motion.\nActive Rest: Slow, deep recovery breaths.",
      technique:
          "Steady, energetic pace; maintain posture and controlled movements.",
    ),
    Exercise(
      title: "High-Intensity Interval:",
      duration: "01:00",
      time: 60,
      breakTime: 60,
      exercise:
          "1 min Jumping Jacks (fast pace) → 1 min Active Rest (marching)",
      breathing:
          "Jumping Jacks: Consistent rhythm; exhale on upward motion.\nActive Rest: Slow, deep recovery breaths.",
      technique:
          "Steady, energetic pace; maintain posture and controlled movements.",
    ),
    Exercise(
      title: "Strength Cardio Circuit:",
      duration: "01:00",
      time: 60,
      breakTime: 60,
      exercise:
          "1 min alternating Push-ups & Mountain Climbers (30 sec each) → 1 min Recovery Walk",
      breathing:
          "Push-ups: Exhale pushing up, inhale lowering body.\nMountain Climbers: Rhythmic breathing; exhale sharply on knee drive.",
      technique: "Controlled form, core tight, avoid rushed movements.",
    ),
    Exercise(
      title: "Strength Cardio Circuit:",
      duration: "01:00",
      time: 60,
      breakTime: 60,
      exercise:
          "1 min alternating Push-ups & Mountain Climbers (30 sec each) → 1 min Recovery Walk",
      breathing:
          "Push-ups: Exhale pushing up, inhale lowering body.\nMountain Climbers: Rhythmic breathing; exhale sharply on knee drive.",
      technique: "Controlled form, core tight, avoid rushed movements.",
    ),
    Exercise(
      title: "Strength Cardio Circuit:",
      duration: "01:00",
      time: 60,
      breakTime: 60,
      exercise:
          "1 min alternating Push-ups & Mountain Climbers (30 sec each) → 1 min Recovery Walk",
      breathing:
          "Push-ups: Exhale pushing up, inhale lowering body.\nMountain Climbers: Rhythmic breathing; exhale sharply on knee drive.",
      technique: "Controlled form, core tight, avoid rushed movements.",
    ),
    Exercise(
      title: "Strength Cardio Circuit:",
      duration: "01:00",
      time: 60,
      breakTime: 60,
      exercise:
          "1 min alternating Push-ups & Mountain Climbers (30 sec each) → 1 min Recovery Walk",
      breathing:
          "Push-ups: Exhale pushing up, inhale lowering body.\nMountain Climbers: Rhythmic breathing; exhale sharply on knee drive.",
      technique: "Controlled form, core tight, avoid rushed movements.",
    ),
    Exercise(
      title: "Endurance Finisher:",
      duration: "00:45",
      time: 45,
      breakTime: 15,
      exercise: "45 sec Rapid High Knees → 15 sec Rest (repeat 3 times)",
      breathing: "Quick rhythmic breaths; exhale with each knee lift.",
      technique: "High knees, quick tempo, arm pumping.",
    ),
    Exercise(
      title: "Endurance Finisher:",
      duration: "00:45",
      time: 45,
      breakTime: 15,
      exercise: "45 sec Rapid High Knees → 15 sec Rest (repeat 3 times)",
      breathing: "Quick rhythmic breaths; exhale with each knee lift.",
      technique: "High knees, quick tempo, arm pumping.",
    ),
    Exercise(
      title: "Endurance Finisher:",
      duration: "00:45",
      time: 45,
      breakTime: 15,
      exercise: "45 sec Rapid High Knees → 15 sec Rest (repeat 3 times)",
      breathing: "Quick rhythmic breaths; exhale with each knee lift.",
      technique: "High knees, quick tempo, arm pumping.",
    ),
    Exercise(
      title: "Cooldown:",
      duration: "01:00",
      time: 60,
      exercise: "Stretching shoulders, legs, controlled breathing.",
      breathing: "Slow, deep inhalation and exhalation.",
      technique: "Hold stretches gently, relax muscles gradually.",
    ),
  ];
}

class TabataBlastExercisesList {
  final List<Exercise> exercises = [
    Exercise(
      title: "Jump Squats:",
      duration: "00:20",
      time: 20,
      breakTime: 10,
      exercise: "20 sec Jump Squats → 10 sec rest (8 cycles)",
      breathing: "Sharp exhale during upward jump, inhale deeply on descent.",
      technique: "Quick explosive jumps, soft landing, knees slightly bent.",
    ),
    Exercise(
      title: "Jump Squats:",
      duration: "00:20",
      time: 20,
      breakTime: 10,
      exercise: "20 sec Jump Squats → 10 sec rest (8 cycles)",
      breathing: "Sharp exhale during upward jump, inhale deeply on descent.",
      technique: "Quick explosive jumps, soft landing, knees slightly bent.",
    ),
    Exercise(
      title: "Jump Squats:",
      duration: "00:20",
      time: 20,
      breakTime: 10,
      exercise: "20 sec Jump Squats → 10 sec rest (8 cycles)",
      breathing: "Sharp exhale during upward jump, inhale deeply on descent.",
      technique: "Quick explosive jumps, soft landing, knees slightly bent.",
    ),
    Exercise(
      title: "Jump Squats:",
      duration: "00:20",
      time: 20,
      breakTime: 10,
      exercise: "20 sec Jump Squats → 10 sec rest (8 cycles)",
      breathing: "Sharp exhale during upward jump, inhale deeply on descent.",
      technique: "Quick explosive jumps, soft landing, knees slightly bent.",
    ),
    Exercise(
      title: "Jump Squats:",
      duration: "00:20",
      time: 20,
      breakTime: 10,
      exercise: "20 sec Jump Squats → 10 sec rest (8 cycles)",
      breathing: "Sharp exhale during upward jump, inhale deeply on descent.",
      technique: "Quick explosive jumps, soft landing, knees slightly bent.",
    ),
    Exercise(
      title: "Jump Squats:",
      duration: "00:20",
      time: 20,
      breakTime: 10,
      exercise: "20 sec Jump Squats → 10 sec rest (8 cycles)",
      breathing: "Sharp exhale during upward jump, inhale deeply on descent.",
      technique: "Quick explosive jumps, soft landing, knees slightly bent.",
    ),
    Exercise(
      title: "Jump Squats:",
      duration: "00:20",
      time: 20,
      breakTime: 10,
      exercise: "20 sec Jump Squats → 10 sec rest (8 cycles)",
      breathing: "Sharp exhale during upward jump, inhale deeply on descent.",
      technique: "Quick explosive jumps, soft landing, knees slightly bent.",
    ),
    Exercise(
      title: "Jump Squats:",
      duration: "00:20",
      time: 20,
      breakTime: 10,
      exercise: "20 sec Jump Squats → 10 sec rest (8 cycles)",
      breathing: "Sharp exhale during upward jump, inhale deeply on descent.",
      technique: "Quick explosive jumps, soft landing, knees slightly bent.",
    ),
    Exercise(
      title: "Burpees:",
      duration: "00:20",
      time: 20,
      breakTime: 10,
      exercise: "20 sec Burpees → 10 sec rest (8 cycles)",
      breathing: "Exhale powerfully on jump, inhale deeply returning to plank.",
      technique:
          "Explosive upward motion, smooth plank-to-standing transitions.",
    ),
    Exercise(
      title: "Burpees:",
      duration: "00:20",
      time: 20,
      breakTime: 10,
      exercise: "20 sec Burpees → 10 sec rest (8 cycles)",
      breathing: "Exhale powerfully on jump, inhale deeply returning to plank.",
      technique:
          "Explosive upward motion, smooth plank-to-standing transitions.",
    ),
    Exercise(
      title: "Burpees:",
      duration: "00:20",
      time: 20,
      breakTime: 10,
      exercise: "20 sec Burpees → 10 sec rest (8 cycles)",
      breathing: "Exhale powerfully on jump, inhale deeply returning to plank.",
      technique:
          "Explosive upward motion, smooth plank-to-standing transitions.",
    ),
    Exercise(
      title: "Burpees:",
      duration: "00:20",
      time: 20,
      breakTime: 10,
      exercise: "20 sec Burpees → 10 sec rest (8 cycles)",
      breathing: "Exhale powerfully on jump, inhale deeply returning to plank.",
      technique:
          "Explosive upward motion, smooth plank-to-standing transitions.",
    ),
    Exercise(
      title: "Burpees:",
      duration: "00:20",
      time: 20,
      breakTime: 10,
      exercise: "20 sec Burpees → 10 sec rest (8 cycles)",
      breathing: "Exhale powerfully on jump, inhale deeply returning to plank.",
      technique:
          "Explosive upward motion, smooth plank-to-standing transitions.",
    ),
    Exercise(
      title: "Burpees:",
      duration: "00:20",
      time: 20,
      breakTime: 10,
      exercise: "20 sec Burpees → 10 sec rest (8 cycles)",
      breathing: "Exhale powerfully on jump, inhale deeply returning to plank.",
      technique:
          "Explosive upward motion, smooth plank-to-standing transitions.",
    ),
    Exercise(
      title: "Burpees:",
      duration: "00:20",
      time: 20,
      breakTime: 10,
      exercise: "20 sec Burpees → 10 sec rest (8 cycles)",
      breathing: "Exhale powerfully on jump, inhale deeply returning to plank.",
      technique:
          "Explosive upward motion, smooth plank-to-standing transitions.",
    ),
    Exercise(
      title: "Burpees:",
      duration: "00:20",
      time: 20,
      breakTime: 10,
      exercise: "20 sec Burpees → 10 sec rest (8 cycles)",
      breathing: "Exhale powerfully on jump, inhale deeply returning to plank.",
      technique:
          "Explosive upward motion, smooth plank-to-standing transitions.",
    ),
    Exercise(
      title: "Cooldown:",
      duration: "01:00",
      time: 60,
      exercise: "Gentle stretches, calm walking.",
      breathing: "Deep, controlled breaths to stabilize heart rate.",
      technique: "Easy, relaxed movements, gentle muscle stretching.",
    ),
  ];
}
