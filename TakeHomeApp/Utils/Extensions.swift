//
//  Extensions.swift
//  TakeHomeApp
//
//  Created by Hesham Donia on 28/03/2022.
//

import UIKit

extension UIView {
    func addSubViews(subViews: [UIView]) {
        for subView in subViews {
            self.addSubview(subView)
        }
    }
}
