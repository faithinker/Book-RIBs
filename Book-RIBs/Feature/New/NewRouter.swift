//
//  NewRouter.swift
//  Book-RIBs
//
//  Created by jhkim on 2023/04/13.
//

import RIBs

protocol NewInteractable: Interactable {
    var router: NewRouting? { get set }
    var listener: NewListener? { get set }
}

protocol NewViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class NewRouter: ViewableRouter<NewInteractable, NewViewControllable>, NewRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: NewInteractable, viewController: NewViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
