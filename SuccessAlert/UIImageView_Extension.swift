//
//  UIImageView_Extension.swift
//  SuccessAlert
//
//  Created by Данил Войдилов on 14.04.2018.
//  Copyright © 2018 Данил Войдилов. All rights reserved.
//

import UIKit

extension UIImageView: AnimatedViewProtocol {
    
    public var color: UIColor {
        set {
            self.tintColor = newValue
        }
        get {
            return self.tintColor
        }
    }
    
    convenience public init(image: UIImage?, rendering: UIImageRenderingMode) {
        self.init(image: image?.withRenderingMode(rendering))
    }
    
}
