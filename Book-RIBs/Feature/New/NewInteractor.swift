//
//  NewInteractor.swift
//  Book-RIBs
//
//  Created by jhkim on 2023/04/13.
//

import RIBs
import RxSwift

protocol NewRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol NewPresentable: Presentable {
    var listener: NewPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol NewListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class NewInteractor: PresentableInteractor<NewPresentable>, NewInteractable, NewPresentableListener {

    weak var router: NewRouting?
    weak var listener: NewListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: NewPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
