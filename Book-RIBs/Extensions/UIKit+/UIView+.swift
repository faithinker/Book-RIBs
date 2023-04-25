//
//  UIView+.swift
//  Book-RIBs
//
//  Created by jhkim on 2023/04/17.
//

import UIKit

extension UIView {
    func addSubViews(_ view: [UIView]) {
        view.forEach { addSubview($0) }
    }
}
