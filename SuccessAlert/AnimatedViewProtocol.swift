//
//  AnimatedViewProtocol.swift
//  SuccessAlert
//
//  Created by Данил Войдилов on 14.04.2018.
//  Copyright © 2018 Данил Войдилов. All rights reserved.
//

import Foundation

public protocol AnimatedViewProtocol: class where Self: UIView {
    var color: UIColor {get set}
    func drawAnimation(_: (() -> ())?) -> ()
}

extension AnimatedViewProtocol {
    
    public func drawAnimation(_ block: (() -> ())?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            block?()
        })
    }
}

public typealias AnimatedView = AnimatedViewProtocol & UIView