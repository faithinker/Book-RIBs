//
//  RootViewController.swift
//  Book-RIBs
//
//  Created by jhkim on 2023/04/14.
//

import UIKit
import RIBs

class RootViewController: UINavigationController, RootPresentable, RootViewControllable {
    func present(_ viewController: RIBs.ViewControllable) {
        self.pushViewController(viewController.uiviewController, animated: true)
        //self.present(UINavigationController(rootViewController: viewController.uiviewController))
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
