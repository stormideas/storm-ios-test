//
//  ImagesCachingManager.swift
//  TakeHomeApp
//
//  Created by Hesham Donia on 28/03/2022.
//

import UIKit

class ImagesCachingManager {
    static var imagesDictionary = [String : String]()
    
    static func addToCache(imageUrl: String, image: UIImage) {
        if imagesDictionary.count == 10 {
            imagesDictionary.removeValue(forKey: imagesDictionary.keys.first ?? "")
        }
        imagesDictionary[imageUrl] = image.convertToBase64String()
    }
    
    static func isImageCached(imageUrl: String) -> Bool {
        return imagesDictionary.keys.contains(imageUrl)
    }
    
    static func getImage(imageUrl: String) -> UIImage? {
        return imagesDictionary[imageUrl]?.convertBase64StringToImage()
    }
}
