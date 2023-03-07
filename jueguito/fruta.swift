//
//  fruta.swift
//  jueguito
//
//  Created by iOS Maquina 10 on 13/02/23.
//

import UIKit
import SpriteKit

class fruta: SKNode {
    let fruta = ["🍌","🍓","🍎","🍇","🍑","🍉","🥭","🍍","🍒","🥝"]
    let bomba = "💣"
    override init() {
        super.init()
        
        
        var emoji = ""
        if randomCGFloat(0, 1) < 0.8
        {
            name = "fruta"
            emoji = fruta.randomElement()!
        }
        else
        {
            name = "bomba"
            emoji = bomba
        }
        let Label = SKLabelNode(text: emoji)
        Label.fontSize = 120
        addChild(Label)
        
        physicsBody = SKPhysicsBody()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
