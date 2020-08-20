//
//  MainViewController.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 17.08.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var showCatalog: UIButton!
    @IBOutlet weak var myBasket: UIButton!
    @IBOutlet weak var editProfile: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        showCatalog.layer.cornerRadius = 30
        myBasket.layer.cornerRadius = 30
        editProfile.layer.cornerRadius = 30
    }

}
