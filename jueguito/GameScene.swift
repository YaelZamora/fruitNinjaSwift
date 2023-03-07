//
//  GameScene.swift
//  jueguito
//
//  Created by iOS Maquina 10 on 13/02/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var Path = [CGPoint]()
    var timer = Timer()
    var bandera = 0
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches
        {
            let location = t.location(in: self)
            Path.append(location)
            
            for node in nodes(at: location)
            {
                if node.name == "fruta"{
                    node.removeFromParent()
                }
                if node.name == "bomba"{
                    node.removeFromParent()
                    GameOver()
                }
            }
        }
        createpath()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
        for t in touches
        {
            let location = t.location(in: self)
            Path.append(location)
        }
        if bandera == 0{
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in self.createFruit()})
            bandera = 1
        }
    }
    
    func createFruit()
    {
        
        let numberOfFruits = Int(arc4random_uniform(UInt32(5)))
        for _ in 0...numberOfFruits
        {
            let fruit = fruta()
            fruit.position.x = randomCGFloat(0, size.width)
            fruit.physicsBody?.velocity.dy = randomCGFloat(400, 600)
            fruit.physicsBody?.angularVelocity = randomCGFloat(500, 1500)
            fruit.position.y = -50
            fruit.physicsBody?.angularVelocity = randomCGFloat(-5, 2)
            addChild(fruit)
        }
        
    }
    
    func createpath()
    {
        let camino = CGMutablePath()
        let linea = SKShapeNode()
        camino.move(to: Path[0])
        
        for j in Path
        {
            camino.addLine(to: j)
        }
        linea.path = camino
        linea.strokeColor = .red
        linea.lineWidth = 4
        linea.fillColor = .clear
        
        addChild(linea)
        
        linea.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.2),SKAction.wait(forDuration: 0.1),SKAction.removeFromParent()]))
        
    }
    
    func GameOver(){
        timer.invalidate()
        for case let fruit as fruta in children{
            fruit.removeFromParent()
        }
    }
}
