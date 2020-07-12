//
//  BaseRootViewController.swift
//  ContainerViewWithNavigation
//
//  Created by Yefga on 12/07/20.
//  Copyright © 2020 Yefga. All rights reserved.
//

import UIKit


class BaseRootViewController: UIViewController {
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setup() {
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            self.imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            self.imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.barTintColor = .clear
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
 
    
    func configure(named: Season) {
        self.imageView.image = UIImage(named: named.rawValue)
        self.title = named.rawValue.capitalized
    }

}
