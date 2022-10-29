//
//  UIColorExtension.swift
//  adlazarevaHW3
//
//  Created by Настя Лазарева on 29.10.2022.
//

import Foundation
import UIKit


extension UIColor{
    
    func getComponents() -> [CGFloat] {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            
            getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            return [red, green, blue, alpha]
        }
    
    
    var redComponent: CGFloat{
        let components = getComponents();
        return components[0]
    }
    
    var greenComponent: CGFloat{
        let components = getComponents();
        return components[1]
    }
    
    var blueComponent: CGFloat{
        let components = getComponents();
        return components[2]
    }
    var alphaComponent: CGFloat{
        let components = getComponents();
        return components[3]
    }
    
}
