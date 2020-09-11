//
//  CustomButton.swift
//  AnimationButton
//
//  Created by Mohamed on 9/11/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation
import UIKit

class CustomButton: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(view: UIView , backgroundColor: UIColor , title: String){
        self.init(frame : .zero)
        buttonConstraints(view: view)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configureButton()
    }
    
    fileprivate func configureButton(){
        
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = .zero
        self.layer.cornerRadius = 8.0
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func buttonConstraints(view: UIView){
        view.addSubview(self)
        
        NSLayoutConstraint.activate([
        
            self.heightAnchor.constraint(equalToConstant: 48),
            self.widthAnchor.constraint(equalToConstant: 315),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
     func buttonAction(tapGestureRecognizer: UITapGestureRecognizer){
    
        self.isEnabled = true
        tapGestureRecognizer.addTarget(self, action: #selector(buttonAction(_:)))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func buttonAction(_ sender: UIButton){
        
        //Show Activity Indicator
        self.setTitle("", for: .normal)
        self.addSubview(activityIndicator)

    }
    
}

extension CustomButton{
    
     var activityIndicator: UIActivityIndicatorView{
        
        let buttonWidth: Int = Int(self.frame.width)
        
        let buttonHeight: Int = Int(self.frame.height)
        
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: (buttonWidth / 2) - 15, y: (buttonHeight / 2) - 22, width: 55, height: 55))
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        activityIndicator.style = .large
        
        translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }
    
    
}
