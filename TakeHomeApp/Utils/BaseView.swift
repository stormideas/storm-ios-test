//
//  BaseView.swift
//  TakeHomeApp
//
//  Created by Hesham Donia on 28/03/2022.
//

import UIKit

class BaseView {
    
    var containerView: UIView!
    
    lazy var spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)

    
    init(view: UIView) {
        containerView = view
        configureLoader()
    }
    
    func configureLoader() {
        containerView.addSubview(spinner)
        containerView.bringSubviewToFront(spinner)
    }
    
    func showLoader() {
        spinner.isHidden = false
        spinner.startAnimating()
    }
    
    func hideLoader() {
        spinner.isHidden = true
        spinner.stopAnimating()
    }
}
