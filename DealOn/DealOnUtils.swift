//
//  DealOnUtils.swift
//  DealOn
//
//  Created by Akkshay Khoslaa on 3/14/16.
//  Copyright © 2016 Akkshay Khoslaa. All rights reserved.
//

import Foundation
import UIKit

class DealOnUtils {
    
    class func hexToUIColor(colorCode: String, alpha: Float = 1.0) -> UIColor {
        var scanner = NSScanner(string:colorCode)
        var color:UInt32 = 0;
        scanner.scanHexInt(&color)
        let mask = 0x000000FF
        let r = CGFloat(Float(Int(color >> 16) & mask)/255.0)
        let g = CGFloat(Float(Int(color >> 8) & mask)/255.0)
        let b = CGFloat(Float(Int(color) & mask)/255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: CGFloat(alpha))
    }
    
}