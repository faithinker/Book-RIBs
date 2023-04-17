//
//  TabBarBuilder.swift
//  Book-RIBs
//
//  Created by jhkim on 2023/04/13.
//

import RIBs

protocol TabBarDependency: Dependency  {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class TabBarComponent: Component<TabBarDependency>, NewDependency, SearchDependency {
}

// MARK: - Builder

protocol TabBarBuildable: Buildable {
    func build(withListener listener: TabBarListener) -> TabBarRouting
}

final class TabBarBuilder: Builder<TabBarDependency>, TabBarBuildable {

    override init(dependency: TabBarDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: TabBarListener) -> TabBarRouting {
        let component = TabBarComponent(dependency: dependency)
        let viewController = TabBarViewController()
        let interactor = TabBarInteractor(presenter: viewController)
        let newBuilder = NewBuilder(dependency: component)
        let searchBuilder = SearchBuilder(dependency: component)
        interactor.listener = listener
        return TabBarRouter(newBuilder: newBuilder, searchBuilder: searchBuilder, interactor: interactor, viewController: viewController)
    }
}
