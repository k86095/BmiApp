//
//  Bmi.swift
//  BmiApp
//
//  Created by 方錦泉 on 2019/2/21.
//  Copyright © 2019 方錦泉. All rights reserved.
//

import Foundation

class Bmi : NSObject , NSSecureCoding{
    static var supportsSecureCoding: Bool {
        return true
    }

    let height: Double?
    let weight: Double?
    
    var value:Double{
        if let height = height , let weight = weight{
            return weight / pow((height/100),2)
        }else{
            return 0.0
        }
    }
    
//    var value: Double {
//        if weight == nil || height == nil {
//            return 0.0
//        } else {
//            return weight! / pow((height! / 100), 2)
//        }
//    }
    
        init(height: Double , weight: Double) {
            self.height = height
            self.weight = weight
        }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(height, forKey: "height")
        aCoder.encode(weight, forKey: "weight")
    }
    
    required init?(coder aDecoder: NSCoder) {
        height = aDecoder.decodeObject(of: NSNumber.self, forKey: "height") as? Double
        weight = aDecoder.decodeObject(of: NSNumber.self, forKey: "weight") as? Double
    }
    func show(value:Double) -> String {
        if value >= 30 {
            return "死肥豬"
        } else if value >= 25{
                return "肥肉太多"
        } else if value >= 18.5{
            return "肥瘦勻稱"
        } else {
            return "夭壽骨"
        }
    }
    
}

