//
//  CALayer.swift
//  adlazarevaHW2
//
//  Created by Настя Лазарева on 28.10.2022.
//

import Foundation
import QuartzCore
import UIKit


extension CALayer{
    func applyShadow(){
        
        shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        shadowOffset = CGSize(width: 0.0, height: 2.0)
        shadowOpacity = 1.0
        shadowRadius = 0.0
        masksToBounds = false
        cornerRadius = 4.0
    }
}
