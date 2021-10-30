//
//  TimerViewModel.swift
//  Timer
//
//  Created by mac on 17/09/2021.
//

import Foundation

class ViewModel {
    //MySingleTimerInApp
    var timer: Timer?
    var timersDuration = 10
    
    var cellViewModels = [CellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }
    
    var reloadTableView: (() -> Void)?
    var timerClouser:((Timer)->Void)?
    //Create one model ("name - duration")
    func createCellModel(model: TimerModel?)->CellViewModel{
        let name = model!.name
        let startTime = Date()
        let endTime = model!.endTime
        return CellViewModel(model: TimerModel(name: name,timer: String(endTime),endTimeInSecond: endTime, startTime: startTime))
    }
    
    let formatter: DateComponentsFormatter = {
            let formatter = DateComponentsFormatter()
            formatter.zeroFormattingBehavior = .pad
            formatter.allowedUnits = [.hour, .minute, .second]
            return formatter
    }()

    
    func addTimerModel(name: String, endTimeInSec: Int){
        //custom data from userUI
        let startTime = Date()
        let myCellViewModel = createCellModel(model: TimerModel(name: name,
                                                             timer: String(endTimeInSec),
                                                             endTimeInSecond: endTimeInSec,
                                                             startTime: startTime
                                                             )
                                            )
        self.timerClouser = { [weak self] (timer) in
            print("upd")
            self?.updateTimer()
        }
        startTimer()
        cellViewModels.append(myCellViewModel)
    }
    
    func updateTimer(){
        for item in cellViewModels{
            item.endTime-=1
            item.timer = String(item.endTime)
        }
        reloadTableView?()
    }
    
    func delete(atIndex indexPath: IndexPath) {
    }

//    func getCellViewModel(at indexPath: IndexPath) -> CellViewModel {
//        return cellViewModels[indexPath.row]
//    }
    //deletecell
   
}

extension ViewModel{

    
    func startTimer() {
        
        guard self.timer == nil else {
            return
        }
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block:timerClouser!)
        self.timer?.tolerance = 0.1
        RunLoop.current.add(self.timer!, forMode: .common)
//      //  self.timersActive += 1
//        guard self.timer == nil else {
//            return
//        }
//
//
//        self.timer?.tolerance=0.1
//        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] (timer) in
//            self!.reloadTableView?()
//
//           // timersDuration
//         //   print("startTimer \(self?.cellViewModels[0].name) \(self?.cellViewModels[0].startTime) \(self?.cellViewModels[0].endTime)")
////           if let me = self {
////            for indexPath in me.tableView.indexPathsForVisibleRows ?? [] {
////                let timer = me.timers[indexPath.row]
////                if timer.isRunning {
////                    if let cell = me.tableView.cellForRow(at: indexPath) {
////                        cell.textLabel?.text = me.formatter.string(from: timer.elapsed) ?? "0:00:00"
////                    }
////                }
////            }
////           }
//        })
//
   }

    func stopTimer() {
       // self.timersDuration -= 1
//        if self.timersDuration == 0 {
//            self.timer?.invalidate()
//            self.timer = nil
//        }
    }
}

