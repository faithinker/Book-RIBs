//
//  RootInteractor.swift
//  Book-RIBs
//
//  Created by jhkim on 2023/04/13.
//

import RIBs
import RxSwift

protocol RootRouting: ViewableRouting {
    func attachTabBarRIB()
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol RootPresentable: Presentable {
}

protocol RootListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable {

    weak var router: RootRouting?
    weak var listener: RootListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: RootPresentable) {
        super.init(presenter: presenter)
        
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        self.router?.attachTabBarRIB()
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
}
