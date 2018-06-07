//
//  CrossView.swift
//  SuccessAlert
//
//  Created by Daniil on 16.04.18.
//  Copyright © 2018 Данил Войдилов. All rights reserved.
//

import UIKit

open class CrossView: BezierAnimatedView {
    open override var bezier: UIBezierPath {
        let path = UIBezierPath()
        let halfWidth = lineWidth / 2
        path.move(to: CGPoint(x: halfWidth, y: halfWidth))
        path.addLine(to: CGPoint(x: frame.width - halfWidth, y: frame.height - halfWidth))
        path.move(to: CGPoint(x: frame.width - halfWidth, y: halfWidth))
        path.addLine(to: CGPoint(x: halfWidth, y: frame.height - halfWidth))
        return path
    }
    
    public init(color: UIColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), lineWidth: CGFloat = 10) {
        super.init(aspectRatio: CGSize(width: 500, height: 500), lineWidth: lineWidth, color: color, bezier: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
