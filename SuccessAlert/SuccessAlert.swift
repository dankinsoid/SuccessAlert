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
    
    public init(frame: CGRect, title: String = "Выполнено", message: String? = nil, view: AnimatedView? = nil, color: UIColor? = nil, textColor: UIColor? = nil, blur: UIBlurEffectStyle? = nil, checkWidth: CGFloat? = nil) {
        super.init(frame: frame)
        xibSetup(title: title, message: message, view: view, color: color, textColor: textColor, blur: blur)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    func xibSetup(title: String = "Выполнено", message: String? = nil, view: AnimatedView? = nil, color: UIColor? = nil, textColor: UIColor? = nil, blur: UIBlurEffectStyle? = nil, checkWidth: CGFloat? = nil) {
        Bundle(for: type(of: self)).loadNibNamed("SuccessAlert", owner: self, options: nil)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        if let be = blur {
            visualEffectView.effect = UIBlurEffect(style: be)
        }
        if let cw = checkWidth {
            self.checkWidth?.constant = cw
        }
        checkMarkView.layer.cornerRadius = 12
        textLabel.text = title
        textLabel.textColor = textColor ?? textLabel.textColor
        detailLabel.text = message
        detailLabel.textColor = textColor ?? detailLabel.textColor
        if let view = view {
            NSLayoutConstraint(aspectRatio: view.frame.size, item: view).isActive = true
            stackView.removeArrangedSubview(drawView)
            stackView.addArrangedSubview(view)
            drawView = view
        }
        let drawAV = drawView as? AnimatedViewProtocol
        drawAV?.color = color ?? drawAV!.color
    }
    
    open func drawAnimate(_ block: (() -> ())? = nil) {
        if let dv = drawView as? AnimatedViewProtocol {
            dv.drawAnimation(block)
        }
    }
}

extension SuccessAlert {
    
    static open func show(title: String = "Выполнено", message: String? = nil, delay: Double = 0.4, view: AnimatedView? = nil, color: UIColor? = nil, textColor: UIColor? = nil, blur: UIBlurEffectStyle? = nil, checkWidth: CGFloat? = nil, completion: (() -> ())? = nil) {
        let window = UIApplication.shared.keyWindow ?? UIWindow()
        let view = SuccessAlert(frame: window.bounds, title: title, message: message, view: view, color: color, textColor: textColor, blur: blur, checkWidth: checkWidth)
        window.endEditing(true)
        for subview in window.subviews {
            if subview as? SuccessAlert != nil {
                subview.removeFromSuperview()
            }
        }
        window.addSubview(view)
        view.appearingAnimation(delay: delay, completion: completion)
    }
    
    static open func show(title: String = "Выполнено", message: String? = nil, delay: Double = 0.4, image: UIImage, color: UIColor? = nil, textColor: UIColor? = nil, blur: UIBlurEffectStyle? = nil, checkWidth: CGFloat? = nil, completion: (() -> ())? = nil) {
        SuccessAlert.show(title: title, message: message, delay: delay, view: UIImageView(image: image.withRenderingMode(.alwaysTemplate)), color: color, textColor: textColor, blur: blur, checkWidth: checkWidth, completion: completion)
    }
    
    fileprivate func appearingAnimation(delay: Double, completion: (() -> ())? = nil) {
        checkMarkView.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
        checkMarkView.alpha = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.checkMarkView.alpha = 1
            self.checkMarkView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }) { (_) in
            self.drawAnimate({
                self.disappearingAnimation(delay: delay, completion: completion)
            })
        }
    }
    
    fileprivate func disappearingAnimation(delay: Double, completion: (() -> ())? = nil) {
        UIView.animate(withDuration: 0.3, delay: delay, options: [], animations: {
            self.checkMarkView.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
            self.checkMarkView.alpha = 0
        }) { (_) in
            self.removeFromSuperview()
            completion?()
        }
    }
}
