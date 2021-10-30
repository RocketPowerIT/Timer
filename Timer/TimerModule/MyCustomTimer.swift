//
//  MyCustomTimer.swift
//  Timer
//
//  Created by mac on 06/10/2021.
//

import Foundation

class MyCustomTimer {
    
//    var timer: Timer?
//
//   // var block((Timer)->Void)
//    func createTimerWithBlock(name:String, duration:Int) {
//        var second = duration
//        timer = Timer.scheduledTimer(withTimeInterval: 1,
//                                         repeats: true,
//                                         block: { [weak self] timer in
//                                            print("timer: \(name) + \(second)")
//                                            if(second>0){
//                                                second-=1
//                                            }else{
//                                                timer.invalidate()
//                                                print("timer: \(name) is END")
//                                            }
//                                         })
//        print("timer: \(name)")
//       // Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: <#T##(Timer) -> Void#>)
//    }
//    
////    func createTimerWithCustomBlock(name:String, duration:Int, ) {
////        var second = duration
////        timer = Timer.scheduledTimer(withTimeInterval: 1,
////                                         repeats: true,
////                                         block: { [weak self] timer in
////                                            print("timer: \(name) + \(second)")
////                                            if(second>0){
////                                                second-=1
////                                            }else{
////                                                timer.invalidate()
////                                                print("timer: \(name) is END")
////                                            }
////                                         })
////        print("timer: \(name)")
////    }
//    
//    func createTimerWithSelector(){
//        timer = Timer.scheduledTimer(timeInterval: 1,
//                                     target: self,
//                                     selector: #selector(updateTimer),
//                                     userInfo: nil,
//                                     repeats: true)
//    }
//    
//    @objc func updateTimer(){
//        print(timer?.fireDate.description as Any)
//    }
//    
//    func startTimer(){
//        
//        timer?.fire()
//        print("timerStart")
//    }
//    
//    func stopTimer(){
//        print("timerStop")
//        timer?.invalidate()
//    }
}
