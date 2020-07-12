//
//  RootViewController.swift
//  ContainerViewWithNavigation
//
//  Created by Yefga on 12/07/20.
//  Copyright © 2020 Yefga. All rights reserved.
//

import UIKit

class RootViewController: BaseRootViewController {

    var delegate: PageDelegate?

    override func viewWillAppear(_ animated: Bool) {
        delegate?.update(page: season)
        super.viewWillAppear(true)
    }
    
    let season: Season
    
    init(named: Season) {
        self.season = named
        super.init(nibName: nil, bundle: nil)
        self.configure(named: named)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
