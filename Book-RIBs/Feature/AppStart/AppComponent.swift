//
//  AppComponent.swift
//  Book-RIBs
//
//  Created by jhkim on 2023/04/14.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {

    init() {
        super.init(dependency: EmptyComponent())
    }
}
