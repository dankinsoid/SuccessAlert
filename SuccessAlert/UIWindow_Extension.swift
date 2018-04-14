//
//  UIWindow_Extension.swift
//  SuccessAlert
//
//  Created by Данил Войдилов on 14.04.2018.
//  Copyright © 2018 Данил Войдилов. All rights reserved.
//

import UIKit

extension UIWindow {
    
    open func showAccessAlert(title: String = "Выполнено", message: String? = nil, view: AnimatedView? = nil, color: UIColor = #colorLiteral(red: 0.3489781618, green: 0.3490435183, blue: 0.3489740491, alpha: 1), textColor: UIColor = #colorLiteral(red: 0.3489781618, green: 0.3490435183, blue: 0.3489740491, alpha: 1), blur: UIBlurEffectStyle = .extraLight) {
        let view = SuccessAlert(frame: bounds, title: title, message: message, view: view, color: color, textColor: textColor, blur: blur)
        endEditing(true)
        addSubview(view)
        appearingAnimation(view)
    }
    
    open func showAccessAlert(title: String = "Выполнено", message: String? = nil, image: UIImage, color: UIColor = #colorLiteral(red: 0.3489781618, green: 0.3490435183, blue: 0.3489740491, alpha: 1), textColor: UIColor = #colorLiteral(red: 0.3489781618, green: 0.3490435183, blue: 0.3489740491, alpha: 1), blur: UIBlurEffectStyle = .extraLight) {
        showAccessAlert(title: title, message: message, view: UIImageView(image: image.withRenderingMode(.alwaysTemplate)), color: color, textColor: textColor, blur: blur)
    }
    
    static open func showAccessAlert(title: String = "Выполнено", message: String? = nil, image: UIImage, color: UIColor = #colorLiteral(red: 0.3489781618, green: 0.3490435183, blue: 0.3489740491, alpha: 1), textColor: UIColor = #colorLiteral(red: 0.3489781618, green: 0.3490435183, blue: 0.3489740491, alpha: 1), blur: UIBlurEffectStyle = .extraLight) {
        UIApplication.shared.keyWindow?.showAccessAlert(title: title, message: message, view: UIImageView(image: image.withRenderingMode(.alwaysTemplate)), color: color, textColor: textColor, blur: blur)
    }
    
    static open func showAccessAlert(title: String = "Выполнено", message: String? = nil, view: AnimatedView? = nil, color: UIColor = #colorLiteral(red: 0.3489781618, green: 0.3490435183, blue: 0.3489740491, alpha: 1), textColor: UIColor = #colorLiteral(red: 0.3489781618, green: 0.3490435183, blue: 0.3489740491, alpha: 1), blur: UIBlurEffectStyle = .extraLight) {
        UIApplication.shared.keyWindow?.showAccessAlert(title: title, message: message, view: view, color: color, textColor: textColor, blur: blur)
    }
    
    fileprivate func appearingAnimation(_ view: SuccessAlert) {
        view.checkMarkView.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
        view.checkMarkView.alpha = 0
        UIView.animate(withDuration: 0.3, animations: {
            view.checkMarkView.alpha = 1
            view.checkMarkView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }) { (_) in
            view.drawAnimate({
                self.disappearingAnimation(view)
            })
        }
    }
    
    fileprivate func disappearingAnimation(_ view: SuccessAlert) {
        UIView.animate(withDuration: 0.3, delay: 0.4, options: [], animations: {
            view.checkMarkView.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
            view.checkMarkView.alpha = 0
        }) { (_) in
            view.removeFromSuperview()
        }
    }
}
