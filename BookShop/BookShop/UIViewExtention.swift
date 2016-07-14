//
//  UIViewExtention.swift
//  Swift3.0
//
//  Created by chenpeng on 16/7/14.
//  Copyright © 2016年 summer. All rights reserved.
//

import UIKit

extension UIView {
    func cornerMask( corner: CGFloat){
        var corner = corner
        let rectFrame = self.frame
        let kWidth = rectFrame.width
        let kHight = rectFrame.height
        if corner > kWidth/2 || corner > kHight/2{
            if kWidth > kHight {
                corner = CGFloat(kHight/2)
            }else{
                corner = CGFloat(kWidth/2)
            }
        }
        let pathLayer = UIBezierPath()
        pathLayer.move(to: CGPoint(x: 0, y: -corner))
        pathLayer.addArc(withCenter: CGPoint(x: corner, y: corner), radius: corner, startAngle: CGFloat(M_PI), endAngle: CGFloat(1.5*M_PI), clockwise: true)
        
        pathLayer.addLine(to: CGPoint(x: kWidth - corner, y: 0))
        pathLayer.addArc(withCenter: CGPoint(x: kWidth - corner, y: corner), radius: corner, startAngle: CGFloat(1.5*M_PI), endAngle: CGFloat(2*M_PI), clockwise: true)
        
        pathLayer.addLine(to: CGPoint(x: kWidth, y: kHight - corner))
        pathLayer.addArc(withCenter: CGPoint(x: kWidth - corner, y: kHight - corner), radius: corner, startAngle: 0, endAngle: CGFloat(0.5*M_PI), clockwise: true)
        
        pathLayer.addLine(to: CGPoint(x: corner, y: kHight))
        pathLayer.addArc(withCenter: CGPoint(x: corner, y: kHight - corner), radius: corner, startAngle: CGFloat(0.5*M_PI), endAngle: CGFloat(M_PI), clockwise: true)
        
        pathLayer.close()
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = pathLayer.cgPath
        layer.mask = maskLayer
        
    }
}












