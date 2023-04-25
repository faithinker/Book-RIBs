//
//  SearchViewController.swift
//  Book-RIBs
//
//  Created by jhkim on 2023/04/13.
//

import UIKit

import RIBs
import RxSwift
import Then
import SnapKit

protocol SearchPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class SearchViewController: UIViewController, SearchPresentable, SearchViewControllable {

    weak var listener: SearchPresentableListener?
    
    private lazy var searchTableView = UITableView().then {
        //$0.register(SearchEmptyTableCell.self, forCellReuseIdentifier: SearchEmptyTableCell.id)
        //$0.register(SearchWritingTableCell.self, forCellReuseIdentifier: "SearchWritingTableCell")
        $0.rowHeight = 280
    }
    
    private lazy var noLabel = UILabel().then {
        $0.text = "결과가 없습니다."
        $0.font = .systemFont(ofSize: 23, weight: .bold)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setupLayout()
    }
    
    private func setNavigation() {
        navigationController?.navigationBar.topItem?.title = "tabBarTitle.search".localized()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupLayout() {
        view.addSubViews([searchTableView, noLabel])
        searchTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        noLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    private func bindData() {
        
    }
    
}
