//
//  TabBarViewController.swift
//  Book-RIBs
//
//  Created by jhkim on 2023/04/13.
//


import UIKit
import RxSwift
import RIBs

protocol TabBarPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class TabBarViewController: UITabBarController, TabBarPresentable, TabBarViewControllable {
    
    
    func makeTabBar(_ vc: UIViewController, title: String, image: String, tag: Int) -> UIViewController {
        let viewController = UINavigationController(rootViewController: vc)
        let tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: image),
            tag: tag
        )
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }
    
    func setViewControllers(viewControllers: [ViewControllable]) {
        let newViewController = makeTabBar(viewControllers[0].uiviewController, title: "New", image: "book", tag: 0)
        let searchViewController = makeTabBar(viewControllers[1].uiviewController, title: "Search", image: "magnifyingglass", tag: 1)
        
        self.viewControllers = [newViewController, searchViewController]
    }
    

    weak var listener: TabBarPresentableListener?
}
