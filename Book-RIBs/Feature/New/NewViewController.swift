//
//  NewViewController.swift
//  Book-RIBs
//
//  Created by jhkim on 2023/04/13.
//

import UIKit

import RIBs
import RxSwift
import Then
import SnapKit

protocol NewPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class NewViewController: UIViewController, NewPresentable, NewViewControllable {

    weak var listener: NewPresentableListener?
    
    private var refreshControl = UIRefreshControl()
    
    private lazy var newTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.register(NewCell.self, forCellReuseIdentifier: "NewCell")
        $0.rowHeight = 280
        $0.flashScrollIndicators()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setupLayout()
    }
    
    private func setNavigation() {
        navigationController?.navigationBar.topItem?.title = "tabBarTitle.new".localized()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupLayout() {
        view.addSubview(newTableView)
        newTableView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func bindData() {
        
    }
}
