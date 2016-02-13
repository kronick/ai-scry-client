//
//  Caption.swift
//  Scrying Mirror
//
//  Created by Sam Kronick on 1/26/16.
//  Copyright © 2016 Disk Cactus. All rights reserved.
//

import Foundation
import UIKit

class Caption {
    var view = UITextView()
    var text = ""
    var parentView : UIView?
    var alive = true
    var duration = 8.0
    var padding = 20.0 as CGFloat
    static let n_slots = 20
    //var padding = 0 as CGFloat
    
    init(text: String, parent: UIView, slot: Int) {
        self.parentView = parent
        self.text = text
        self.view.text = text
        self.view.backgroundColor = UIColor(white: 0, alpha: 1)
        self.view.textColor = UIColor(white: 1, alpha: 1);
        self.view.font = UIFont(name: "HelveticaNeue-ThinItalic", size: 42)
        self.view.contentInset = UIEdgeInsetsMake(0, self.padding, 0, self.padding)
        self.view.sizeToFit()
        self.view.frame.origin = CGPoint(x: 0, y: 0)
        self.view.frame.insetInPlace(dx: -self.padding, dy: 0)
        self.view.frame.offsetInPlace(dx: -self.view.frame.width / 2, dy: 0)
        
        self.view.frame.offsetInPlace(dx: self.parentView!.frame.width/2, dy: 0)
        
        //self.view.frame.offsetInPlace(dx: 0, dy: CGFloat.random(-self.parentView!.frame.height, self.parentView!.frame.height))
        self.view.frame.offsetInPlace(dx: 0, dy: CGFloat(Float(slot) / Float(Caption.n_slots+1)) * self.parentView!.frame.height * 2 - self.parentView!.frame.height / 2)

        // Start invisible
        self.view.alpha = 0
        //self.view.frame = parentView!.frame
        self.view.opaque = false
        self.view.layer.allowsEdgeAntialiasing = true

    }
    
    func enter() {
        parentView?.addSubview(self.view)
        self.view.alpha = 0
        
        self.view.layer.anchorPointZ = CGFloat.random(400, 800)
        
        let startRot = CGFloat.random(-0.1, 0.1)
        let changeRot = CGFloat.random(0, 0.2) * (startRot > 0 ? -1 : 1)
        let endRot = startRot + changeRot
        let startOffAxis = CGFloat.random(-0.5, 0.5)
        let endOffAxis = CGFloat.random(-0.5, 0.5)
        
        self.view.layer.transform = CATransform3DMakeRotation(startRot, 0, 1, startOffAxis)
        UIView.animateWithDuration(self.duration, delay: 0, options: .CurveLinear, animations: {
            self.view.layer.transform = CATransform3DMakeRotation(endRot, 0, 1, endOffAxis)
            }, completion: nil)
        
        UIView.animateWithDuration(self.duration * 0.1, delay: 0, options: .CurveLinear, animations: {
            self.view.alpha = 0.8
            }, completion: { finished in
                UIView.animateWithDuration(self.duration * 0.1, delay: self.duration * 0.8, options: .CurveLinear, animations: {
                    self.view.alpha = 0
                }, completion: { f in self.exit() })

        })
        
        
    }
    
    func exit() {
        self.alive = false
        self.view.removeFromSuperview()
    }
}