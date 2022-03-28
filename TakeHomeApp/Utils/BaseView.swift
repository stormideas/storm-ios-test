//
//  BaseView.swift
//  TakeHomeApp
//
//  Created by Hesham Donia on 28/03/2022.
//

import UIKit
import SVProgressHUD
import Toast_Swift

class BaseView {
    
    var containerView: UIView!
    
    init(view: UIView) {
        containerView = view
    }
    
    func showLoader() {
        SVProgressHUD.show()
    }

    func hideLoader() {
        SVProgressHUD.dismiss()
    }

    func showErrorMessage(message: String) {
        containerView.makeToast(message)
    }
}
