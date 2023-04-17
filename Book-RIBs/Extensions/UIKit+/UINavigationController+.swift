//
//  UINavigationController+.swift
//  Book-RIBs
//
//  Created by jhkim on 2023/04/14.
//

import UIKit

import RIBs

extension UINavigationController: ViewControllable {
  public var uiviewController: UIViewController { self }

  convenience init(root: ViewControllable) {
    self.init(rootViewController: root.uiviewController)
  }
}

