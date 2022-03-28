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

extension String {
    
    func convertStringToDate(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        if let date = dateFormatter.date(from: self) {
            return date
        }
        return nil
    }
    
    func convertBase64StringToImage () -> UIImage {
        let imageData = Data(base64Encoded: self)
        let image = UIImage(data: imageData!)
        return image!
    }

}

extension UIImage {
    func convertToBase64String () -> String {
        return jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
    }

}
