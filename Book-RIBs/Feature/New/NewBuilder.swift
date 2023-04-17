//
//  NewBuilder.swift
//  Book-RIBs
//
//  Created by jhkim on 2023/04/13.
//

import RIBs

protocol NewDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class NewComponent: Component<NewDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol NewBuildable: Buildable {
    func build(withListener listener: NewListener) -> NewRouting
}

final class NewBuilder: Builder<NewDependency>, NewBuildable {

    override init(dependency: NewDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: NewListener) -> NewRouting {
        let component = NewComponent(dependency: dependency)
        let viewController = NewViewController()
        let interactor = NewInteractor(presenter: viewController)
        interactor.listener = listener
        return NewRouter(interactor: interactor, viewController: viewController)
    }
}
