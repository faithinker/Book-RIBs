//
//  NewViewController.swift
//  Book-RIBs
//
//  Created by jhkim on 2023/04/13.
//

import RIBs
import RxSwift
import UIKit

protocol NewPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class NewViewController: UIViewController, NewPresentable, NewViewControllable {

    weak var listener: NewPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
    }
    
    private func setNavigation() {
        navigationController?.navigationBar.topItem?.title = "tabBarTitle.new".localized()
    }
}
