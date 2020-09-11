//
//  ViewController.swift
//  AnimationButton
//
//  Created by Mohamed on 9/11/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var customButton: CustomButton!
    let tapGestureRecognizer = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customButton = CustomButton(view: self.view, backgroundColor: .blue, title: "Login")
        customButton.buttonAction(tapGestureRecognizer: tapGestureRecognizer)
    }


}

