//
//  ViewController.swift
//  Snowflake
//
//  Created by julp04 on 08/23/2017.
//  Copyright (c) 2017 julp04. All rights reserved.
//

import UIKit
import Snowflake

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flake = #imageLiteral(resourceName: "flake")
        
        let snowflake = Snowflake(view: view, particles: [flake: .white])
        self.view.layer.addSublayer(snowflake)
        snowflake.start()
    }
}

