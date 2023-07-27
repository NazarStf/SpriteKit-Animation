//
//  ContentView.swift
//  SpriteKit Animation
//
//  Created by NazarStf on 27.07.2023.
//

import SwiftUI
import SpriteKit

class GameScene: SKScene {
	override func didMove(to view: SKView) {
		physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		guard let touch = touches.first else { return }
		let location = touch.location(in: self)
		let ball = SKSpriteNode(imageNamed: "dodgeBall")
		ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.7)
		ball.physicsBody?.restitution = 0.4
		ball.position = location
		addChild(ball)
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		guard let touch = touches.first else { return }
		let location = touch.location(in: self)
		let ball = SKSpriteNode(imageNamed: "dodgeBall")
		ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.7)
		ball.physicsBody?.restitution = 0.4
		ball.position = location
		addChild(ball)
	}
}

struct ContentView: View {
	var scene: SKScene {
		let scene = GameScene()
		scene.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
		return scene
	}
	
	var body: some View {
		ZStack {
			VStack {
				SpriteView(scene: scene)
					.ignoresSafeArea()
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
