//
//  RootRouter.swift
//  Book-RIBs
//
//  Created by jhkim on 2023/04/13.
//

import RIBs

// TODO: RouterViewController 제거: RootRIB -> TabBar VC -> Search/New VC

protocol RootInteractable: Interactable, TabBarListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func present(_ viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    private let tabBarBuilder: TabBarBuildable
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         tabBarBuilder: TabBarBuildable) {
        
        self.tabBarBuilder = tabBarBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
    }
    
    
    func attachTabBarRIB() {
        let tabBar = tabBarBuilder.build(withListener: interactor)
        attachChild(tabBar)
        viewController.present(tabBar.viewControllable)
    }
}
