# Glossary

Domain terms used in code, UI copy, and the rest of these docs. When ambiguity arises, this file wins.

| Term | Meaning |
|---|---|
| **Active plan** | The single `WorkoutPlan` row with `isActive = true` for the current user. There is at most one. |
| **Ad-hoc workout** | A session not tied to a `PlanDay`. Started from the exercise catalog. `WorkoutSessions.planDayId` is null. |
| **Adaptive schedule** | `users.scheduleMode = 2`. A workout day is "today is a workout day if at least `intervalDays` have passed since the last workout". |
| **Badge** | An achievement keyed by string (e.g. `streak_7`). Catalog seeded once; awards stored in `user_badges`. See [GAMIFICATION.md → badges](GAMIFICATION.md#badges). |
| **Blacklist** | An entry in `exercise_preferences` with `preference = 2`. Excluded from plan generation entirely. |
| **Body part** | One of 12 enum values in `BodyPart` (chest, back, shoulders, biceps, triceps, forearms, absCore, glutes, quads, hamstrings, calves, fullBody). The `fullBody` value is a meta-marker, never assigned as a target. |
| **Compound** | An exercise whose `muscleAction` is `compound`, `push`, or `pull`. Plan generator picks compounds before isolations. |
| **DAO** | "Data Access Object" — a Drift-generated class that wraps one domain's queries. Six DAOs exist: `UserDao`, `WorkoutDao`, `ExerciseDao`, `GamificationDao`, `MeasurementDao`, `NotificationDao`. |
| **Difficulty** | One of `beginner` (0), `intermediate` (1), `advanced` (2). Used as `maxDifficulty` filter and to set exercises-per-day. |
| **Equipment** | One of 20 enum values (bodyweight, chair, pull-up bar, barbells, etc.). Bodyweight is always assumed available. |
| **Escalation level** | Integer 1–5 indicating notification urgency / tone. See [NOTIFICATIONS.md](NOTIFICATIONS.md). |
| **Favorite** | An entry in `exercise_preferences` with `preference = 1`. Gets a 70 % probability boost during plan generation. |
| **Fixed interval schedule** | `users.scheduleMode = 1`. Today is a workout day if `(daysSinceIntervalStart) % intervalDays == 0`. |
| **Focus body parts** | User-selected body parts in `user_focus_bodyparts`, only meaningful when `trainingFocus = specificBodyPart`. The plan generator preferentially fills slots with these. |
| **Full Body split** | The plan template used for ≤ 3 workout days/week. Every plan day targets all body parts. |
| **League / Tier** | A 1–15 ranking based on the last 28 days of activity. See [GAMIFICATION.md → league](GAMIFICATION.md#league). Distinct from **level**. |
| **Legacy fallback** | Notification scheduling path used when the user has zero `notification_windows`. Fixed offsets from preferred time. |
| **Level** | A 0–9 progression based on cumulative XP. See [GAMIFICATION.md → levels](GAMIFICATION.md#levels-10-tiers). Distinct from **league tier**. |
| **Nag** | A reminder notification. The system that schedules them is `NagScheduler`. |
| **Notification window** | A daily time range (start/end) inside which one nag is fired at a random minute. Up to 5 per user. |
| **Plan day** | One row in `plan_days`. Has a `dayOfWeek` (1=Mon…7=Sun) and a label like "Push" or "Upper Body". |
| **PPL** | "Push / Pull / Legs". The split template for 5+ days/week. |
| **Preferred hour/minute** | The user's configured "default workout time". Used as the anchor for legacy nag scheduling and the rest-day message. |
| **Schedule mode** | The integer in `users.scheduleMode` that picks one of three workout-day rules. See [USER_JOURNEY.md → schedule modes](USER_JOURNEY.md#schedule-modes). |
| **Session** | One row in `workout_sessions`. Created on workout start, completed on finish. |
| **Set** | One row in `session_sets`. Has `setNumber`, optional `repsCompleted`, `weightUsed`, `durationSecs`, and a `completed` flag. |
| **Specific weekdays schedule** | `users.scheduleMode = 0` (the default). Today is a workout day if `today.weekday` is in `users.workoutDays`. |
| **Streak** | Number of consecutive days on which a workout was logged. Stored in `streaks.currentStreak`. See [GAMIFICATION.md → streaks](GAMIFICATION.md#streaks). |
| **Tempo** | The four phase durations for a rep, encoded as `E-P-C-T`. See [METRONOME.md](METRONOME.md#tempo-notation). |
| **Training focus** | One of 6 enum values controlling set/rep scheme and (when `specificBodyPart`) prioritization. See [PLAN_GENERATOR.md](PLAN_GENERATOR.md#step-3--pick-exercises-for-each-plan-day). |
| **WHO baseline / optimum** | The 150 min/wk / 300 min/wk thresholds the league system maps to (Bronze and Platinum tiers). |
| **Window** | Short for **notification window**. |
| **Workout day** | A calendar day on which `ScheduleHelper.isWorkoutDay(user, date)` returns true. |
| **XP** | "Experience points" — the only quantitative reward, summed in `xp_log`. Drives **level**. |
