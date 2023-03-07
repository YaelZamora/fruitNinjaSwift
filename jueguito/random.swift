//
//  random.swift
//  jueguito
//
//  Created by iOS Maquina 10 on 13/02/23.
//

import Foundation
import UIKit



func randomCGFloat(_ lowessvalue: CGFloat, _ maxvalue: CGFloat) -> CGFloat {
    return lowessvalue + CGFloat(arc4random()) / CGFloat(UInt32.max) * (maxvalue - lowessvalue)
}
