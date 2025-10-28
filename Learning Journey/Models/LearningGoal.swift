//
//  LearningGoal.swift
//  Learning Journey
//
//  Created by Tala Aldhahri on 05/05/1447 AH.
//

enum GoalDuration {
    case week
    case month
    case year
}

struct LearningGoal{
    var goalName: String
    var goalDuration: GoalDuration
}
