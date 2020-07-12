//
//  EscapeViewController.swift
//  ContainerViewWithNavigation
//
//  Created by Yefga on 12/04/20.
//  Copyright © 2020 Yefga. All rights reserved.
//

import UIKit

class EscapeViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Escape"
        view.backgroundColor = .lightGray
        // Do any additional setup after loading the view.
    }

}
