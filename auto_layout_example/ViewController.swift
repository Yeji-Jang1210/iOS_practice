//
//  ViewController.swift
//  auto_layout_example
//
//  Created by 소프트웨어컴퓨터 on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var btnemail: UIButton!
    @IBOutlet var imgProfile: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnemail.layer.cornerRadius = 3
        btnemail.layer.borderColor = UIColor.lightGray.cgColor
        btnemail.layer.borderWidth = 1
        
        imgProfile.layer.cornerRadius = imgProfile.bounds.width * 0.5
    }
    


}

