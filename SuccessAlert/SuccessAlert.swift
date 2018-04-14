//
//  SuccessAlert.swift
//  FinesPayment
//
//  Created by Daniil on 13.04.18.
//  Copyright © 2018 RosEuroBank. All rights reserved.
//

import UIKit

class SuccessAlert: UIView {
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet var checkMarkView: UIView!
    @IBOutlet var visualEffectView: UIVisualEffectView!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet private var drawView: UIView!
    @IBOutlet var stackView: UIStackView!
    @IBOutlet private var checkWidth: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    init(frame: CGRect, title: String = "Выполнено", message: String? = nil, view: AnimatedView? = nil, color: UIColor = #colorLiteral(red: 0.3489781618, green: 0.3490435183, blue: 0.3489740491, alpha: 1), textColor: UIColor = #colorLiteral(red: 0.3489781618, green: 0.3490435183, blue: 0.3489740491, alpha: 1), blur: UIBlurEffectStyle = .extraLight) {
        super.init(frame: frame)
        xibSetup(title: title, message: message, view: view, color: color, textColor: textColor, blur: blur)
    }
    
    required init?(coder aDecoder: NSCoder) {
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
    
    func drawAnimate(_ block: (() -> ())? = nil) {
        if let dv = drawView as? AnimatedViewProtocol {
            dv.drawAnimation(block)
        }
    }
    
}
