//
//  ParentViewController.swift
//  mainViewWithNavigation
//
//  Created by Yefga on 12/04/20.
//  Copyright © 2020 Yefga. All rights reserved.
//

import UIKit

enum Season: String {
    case spring, summer, autumn, winter
}

protocol PageDelegate {
    func update(page: Season)
}

class ParentViewController: UIViewController {
    
    let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dogImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var viewController: UIViewController!
    
    var page: Season
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        super.viewWillAppear(true)
    }
    
    init(page: Season) {
        self.page = page
        self.dogImageView.image = UIImage(named: "\(page.rawValue)_dog")
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    private func setup() {
        view.addSubview(mainView)
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        
        
        switch page {
        case .spring:
            let rootViewController = RootViewController(named: .spring)
            rootViewController.delegate = self
            self.viewController = rootViewController
        case .summer:
            let rootViewController = RootViewController(named: .summer)
            rootViewController.delegate = self
            self.viewController = rootViewController
        case .autumn:
            let rootViewController = RootViewController(named: .autumn)
            rootViewController.delegate = self
            self.viewController = rootViewController
        case .winter:
            let rootViewController = RootViewController(named: .winter)
            rootViewController.delegate = self
            self.viewController = rootViewController
        }
        
        let child = UINavigationController(rootViewController: viewController)
        addChild(child)
        
        child.view.translatesAutoresizingMaskIntoConstraints = false
        
        mainView.addSubview(child.view)
        
        NSLayoutConstraint.activate([
            child.view.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 0),
            child.view.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 0),
            child.view.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 0),
            child.view.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 0)
        ])
        
        
        child.didMove(toParent: self)
        
        
        view.addSubview(dogImageView)
        let tap = UITapGestureRecognizer(target: self, action: #selector(nextViewController))
        dogImageView.addGestureRecognizer(tap)
        NSLayoutConstraint.activate([
            self.dogImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 32),
            self.dogImageView.widthAnchor.constraint(equalToConstant: self.view.frame.size.width / 2),
            self.dogImageView.heightAnchor.constraint(equalToConstant: self.view.frame.size.width / 2),
            self.dogImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0)
        ])
    }
    
    @objc fileprivate func nextViewController() {
        
        switch page {
            case .spring:
                let rootViewController = RootViewController(named: .summer)
                rootViewController.delegate = self
                self.viewController.navigationController?.pushViewController(rootViewController, animated: true)
            case .summer:
                let rootViewController = RootViewController(named: .autumn)
                rootViewController.delegate = self
                self.viewController.navigationController?.pushViewController(rootViewController, animated: true)
            case .autumn:
                let rootViewController = RootViewController(named: .winter)
                rootViewController.delegate = self
                self.viewController.navigationController?.pushViewController(rootViewController, animated: true)
            case .winter:
                self.viewController.navigationController?.popToRootViewController(animated: true)
//                self.viewController.navigationController?.setNavigationBarHidden(true, animated: true)
//                self.navigationController?.setNavigationBarHidden(false, animated: true)
//                self.navigationController?.pushViewController(EscapeViewController(), animated: true)
        }
        
    }
    
}

extension ParentViewController: PageDelegate {
    
    func update(page: Season) {
        self.viewController.navigationController?.setNavigationBarHidden(false, animated: true)
        self.page = page
        dogImageView.image = UIImage(named: page.rawValue + "_dog")
    }
    
}
