//
//  SuccessAlert.swift
//  FinesPayment
//
//  Created by Daniil on 13.04.18.
//  Copyright © 2018 RosEuroBank. All rights reserved.
//

import UIKit

open class SuccessAlert: UIView {
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet open var checkMarkView: UIView!
    @IBOutlet open var visualEffectView: UIVisualEffectView!
    @IBOutlet open var textLabel: UILabel!
    @IBOutlet open var detailLabel: UILabel!
    @IBOutlet private var drawView: UIView!
    @IBOutlet open var stackView: UIStackView!
    @IBOutlet private var checkWidth: NSLayoutConstraint!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    public init(frame: CGRect, title: String = "Выполнено", message: String? = nil, view: AnimatedView? = nil, color: UIColor = #colorLiteral(red: 0.3489781618, green: 0.3490435183, blue: 0.3489740491, alpha: 1), textColor: UIColor = #colorLiteral(red: 0.3489781618, green: 0.3490435183, blue: 0.3489740491, alpha: 1), blur: UIBlurEffectStyle = .extraLight) {
        super.init(frame: frame)
        xibSetup(title: title, message: message, view: view, color: color, textColor: textColor, blur: blur)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    func xibSetup(title: String = "Выполнено", message: String? = nil, view: AnimatedView? = nil, color: UIColor = #colorLiteral(red: 0.3489781618, green: 0.3490435183, blue: 0.3489740491, alpha: 1), textColor: UIColor = #colorLiteral(red: 0.3489781618, green: 0.3490435183, blue: 0.3489740491, alpha: 1), blur: UIBlurEffectStyle = .extraLight) {
        Bundle(for: type(of: self)).loadNibNamed("SuccessAlert", owner: self, options: nil)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        visualEffectView.effect = UIBlurEffect(style: blur)
        checkMarkView.layer.cornerRadius = 12
        textLabel.text = title
        textLabel.textColor = textColor
        detailLabel.text = message
        detailLabel.textColor = textColor
        if let view = view {
            NSLayoutConstraint(aspectRatio: view.frame.size, item: view).isActive = true
            stackView.removeArrangedSubview(drawView)
            stackView.addArrangedSubview(view)
            drawView = view
        }
        (drawView as? AnimatedViewProtocol)?.color = color
    }
    
    open func drawAnimate(_ block: (() -> ())? = nil) {
        if let dv = drawView as? AnimatedViewProtocol {
            dv.drawAnimation(block)
        }
    }
}

extension SuccessAlert {
    
    static open func show(title: String = "Выполнено", message: String? = nil, view: AnimatedView? = nil, color: UIColor = #colorLiteral(red: 0.3489781618, green: 0.3490435183, blue: 0.3489740491, alpha: 1), textColor: UIColor = #colorLiteral(red: 0.3489781618, green: 0.3490435183, blue: 0.3489740491, alpha: 1), blur: UIBlurEffectStyle = .extraLight, completion: (() -> ())? = nil) {
        let window = UIApplication.shared.keyWindow ?? UIWindow()
        let view = SuccessAlert(frame: window.bounds, title: title, message: message, view: view, color: color, textColor: textColor, blur: blur)
        window.endEditing(true)
        for subview in window.subviews {
            if subview as? SuccessAlert != nil {
                subview.removeFromSuperview()
            }
        }
        window.addSubview(view)
        view.appearingAnimation(completion: completion)
    }
    
    static open func show(title: String = "Выполнено", message: String? = nil, image: UIImage, color: UIColor = #colorLiteral(red: 0.3489781618, green: 0.3490435183, blue: 0.3489740491, alpha: 1), textColor: UIColor = #colorLiteral(red: 0.3489781618, green: 0.3490435183, blue: 0.3489740491, alpha: 1), blur: UIBlurEffectStyle = .extraLight, completion: (() -> ())? = nil) {
        SuccessAlert.show(title: title, message: message, view: UIImageView(image: image.withRenderingMode(.alwaysTemplate)), color: color, textColor: textColor, blur: blur, completion: completion)
    }
    
    fileprivate func appearingAnimation(completion: (() -> ())? = nil) {
        checkMarkView.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
        checkMarkView.alpha = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.checkMarkView.alpha = 1
            self.checkMarkView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }) { (_) in
            self.drawAnimate({
                self.disappearingAnimation(completion: completion)
            })
        }
    }
    
    fileprivate func disappearingAnimation(completion: (() -> ())? = nil) {
        UIView.animate(withDuration: 0.3, delay: 0.4, options: [], animations: {
            self.checkMarkView.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
            self.checkMarkView.alpha = 0
            self.isUserInteractionEnabled = false
        }) { (_) in
            self.removeFromSuperview()
            completion?()
        }
    }
}
