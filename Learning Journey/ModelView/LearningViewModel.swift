//
//  LearningViewModel.swift
//  Learning Journey
//
//  Created by Tala Aldhahri on 05/05/1447 AH.
//

import Foundation

// we need to make the class ObservableObject so that we can use @published
class LearningViewModel: ObservableObject {
    
    //we use published to announce to other views the changes of the variables
    @Published var currentGoal: LearningGoal =
    LearningGoal(goalName: " ", goalDuration: .month)
    
    @Published var currentActivity : ActivityLog = ActivityLog(learnedDates:[] , freezedDates: [])
    @Published var currentWeek: [Date] = []
    
    func fetchCurrentWeek() {
        let today = Date()
        let calendar = Calendar.current
        
        if let weekInterval = calendar.dateInterval(of: Calendar.Component.weekOfMonth, for: today) {
            var currentDate = weekInterval.start
            
            // We need a temporary place to store the days
            // ...
            
            while currentDate < weekInterval.end {
                // What do we do in here?
            }
        }
    }
}
