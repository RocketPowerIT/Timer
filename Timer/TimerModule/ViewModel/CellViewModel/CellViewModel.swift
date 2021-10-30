//
//  SecondSectionCellViewModel.swift
//  Timer
//
//  Created by mac on 11/10/2021.
//

import Foundation

class CellViewModel {
    
    var name:String
    var timer:String
    var myTimer:Timer?
    
    var startTime: Date?
    var endTime:Int

    var timerClouser:((Timer)->Void)?
    
    init(model: TimerModel) {
        self.name = model.name
        self.timer = model.timer
        self.startTime = model.startTime
        self.endTime = model.endTime
    }

    func startTimer() {
      //  self.timersActive += 1
        guard self.myTimer == nil else {
            return
        }
        self.myTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block:timerClouser!)
        self.myTimer?.tolerance = 1
        RunLoop.current.add(self.myTimer!, forMode: .common)
    }

}

extension CellViewModel{
//    func elapsed(since: Date) -> TimeInterval {
//           var elapsed = offset
//           if let startTime = self.startTime {
//               elapsed += -startTime.timeIntervalSince(since)
//           }
//           return elapsed
//       }
}
