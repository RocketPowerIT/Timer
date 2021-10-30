//
//  TimerModel.swift
//  Timer
//
//  Created by mac on 02/09/2021.
//

import Foundation

//typealias TimerModels = [TimerModel];

struct TimerModel {
    
    var name: String
    var timer: String

    var startTime: Date?
    var endTime:Int

    
    init(name: String, timer: String, endTimeInSecond: Int, startTime:Date?) {
        self.name = name
        self.timer = timer
        self.startTime = startTime!
        self.endTime = endTimeInSecond
    }
}
