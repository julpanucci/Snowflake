//
//  Emitter.swift
//  Snowflake
//
//  Created by Panucci, Julian R on 3/17/17.
//  Copyright © 2017 Panucci, Julian R. All rights reserved.
//

import Foundation
import UIKit


public class Snowflake: CAEmitterLayer {
    
    //MARK: Constants
    let kParticleCount: Int = 5
    let kParticleColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
    let kEmissionLongitude: CGFloat = 30
    let kVelocity: CGFloat = 10
    let kVelocityRange: CGFloat = 50
    let kYAcceleration: CGFloat = 5
    let kXAccelertation: CGFloat = 1
    let kSpin: CGFloat = 0.01
    
    
    //MARK: Overrides
    
    override public var frame: CGRect {
        didSet {
            emitterSize = CGSize(width: frame.size.width, height: frame.size.height)
            position = CGPoint(x: frame.width / 2, y: frame.origin.y - 50)
        }
    }
    
    override public var emitterZPosition: CGFloat {
        get {
            return 10.0
        } set {
            self.emitterZPosition = newValue
        }
    }
    
    override public var emitterShape: String {
        get {
            return kCAEmitterLayerLine
        }set {
            self.emitterShape = newValue
        }
    }
    
    //MARK: Cell Properties
    
    private var emissionRange = CGFloat(Double.pi)
    var particleSize: CGFloat = 0.3 {
        didSet {
            emitterCells?.forEach {$0.scale = particleSize}
        }
    }
    public var particleSizeRange: CGFloat = 0.5 {
        didSet {
            emitterCells?.forEach { $0.scaleRange = particleSizeRange }
        }
    }
    var mainColor: UIColor = .white {
        didSet {
            mainColor = mainColor.withAlphaComponent(0.5)
            if emitterCells != nil {
                
                var newCells = [CAEmitterCell]()
                for cell in emitterCells! {
                    cell.color = mainColor.cgColor
                    newCells.append(cell)
                }
                emitterCells!.removeAll()
                emitterCells = newCells
            }
        }
    }
    
    var particleLifetime: Float = 50 {
        didSet {
            emitterCells?.forEach {$0.lifetime = lifetime}
        }
    }
    
    //MARK: Other Properties
    
    private var totalParticles: Int
    var particleCount: Int {
        didSet {
            emitterCells?.forEach {$0.birthRate = Float(particleCount / totalParticles)}
        }
    
    }
    
    
    required public init(view: UIView, particles: [UIImage: UIColor]) {

        totalParticles = particles.keys.count
        particleCount = kParticleCount
        super.init()
        
        emitterSize = CGSize(width: view.bounds.size.width, height: view.bounds.size.height)
        position = CGPoint(x: view.bounds.width / 2, y: view.bounds.origin.y - 50)

        var emitterCells = [CAEmitterCell]()
        for (image) in particles.keys {
            
            let color =  particles[image]!
            let particle = self.createParticle(image: image, color: color)
            
            emitterCells.append(particle)
        }
        
        self.emitterCells = emitterCells
        self.isHidden = true
    }
    
    
    /// Choose a single color for all particles snowing
    ///
    /// - Parameters:
    ///   - view: where it will snow ❄️️
    ///   - particles: images of each particle
    ///   - color: single color for all particles
    convenience init(view: UIView, particles: [UIImage], color: UIColor) {
        
        let colorWithAlpha = color.withAlphaComponent(0.5)
        var dict = [UIImage: UIColor]()
        
        for image in particles {
            dict[image] = colorWithAlpha
        }
        
        self.init(view: view, particles: dict)
    }
    
    convenience init(view: UIView, particleImages: [UIImage]) {
        self.init(view: view, particles: particleImages, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5))
    }
    
    
    private func createParticle(image: UIImage, color: UIColor) -> CAEmitterCell {
        
        let emitterCell = CAEmitterCell()// 6
        emitterCell.scale = particleSize // 7
        emitterCell.scaleRange = particleSizeRange; // 8
        emitterCell.emissionRange = emissionRange
        emitterCell.emissionLongitude = kEmissionLongitude
        emitterCell.color = color.cgColor
        
        emitterCell.lifetime = particleLifetime
        emitterCell.birthRate = Float(particleCount / totalParticles)
        
        emitterCell.velocity = kVelocity
        emitterCell.velocityRange = kVelocityRange
        emitterCell.yAcceleration = kYAcceleration
        emitterCell.xAcceleration = kXAccelertation
        emitterCell.spin = kSpin
        
        
        emitterCell.contents = image.cgImage
        
        return emitterCell
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public Functions
    
    public func stop()
    {
        self.isHidden = true
    }
    
    public func start() {
        self.isHidden = false
    }
    
    
}

