//
//  TabBarRouter.swift
//  Book-RIBs
//
//  Created by jhkim on 2023/04/13.
//

import UIKit
import RIBs

protocol TabBarInteractable: Interactable, NewListener, SearchListener {
    var router: TabBarRouting? { get set }
    var listener: TabBarListener? { get set }
}

protocol TabBarViewControllable: ViewControllable {
    func makeTabBar(_ vc: UIViewController, title: String, image: String, tag: Int) -> UIViewController
    
    func setViewControllers(viewControllers: [ViewControllable])
    
    func setTabBar()
}

final class TabBarRouter: ViewableRouter<TabBarInteractable, TabBarViewControllable>, TabBarRouting {
    
    
    private let newBuilder: NewBuildable
    private var newRouter: NewRouting?
    
    private let searchBuilder: SearchBuildable
    private var searchRouter: SearchRouting?
    
    init(newBuilder: NewBuildable, searchBuilder: SearchBuildable, interactor: TabBarInteractable, viewController: TabBarViewControllable) {
        self.newBuilder = newBuilder
        self.searchBuilder = searchBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
        
    }
    
    override func didLoad() {
        super.didLoad()
        attachTabs()
    }
    
    private var new: ViewableRouting?
    private var search: ViewableRouting?
    
    
    func attachTabs() {
        let new = newBuilder.build(withListener: interactor)
        let search = searchBuilder.build(withListener: interactor)
        self.new = new
        self.search = search
        viewController.setViewControllers(viewControllers: [new.viewControllable, search.viewControllable])
        viewController.setTabBar()
    }
    
}
