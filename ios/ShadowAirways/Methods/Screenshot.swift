//
//  Screenshot.swift
//  Shadow Airways
//
//  Created by Sam Kuttenkuler on 8/31/21.
//

import Foundation
import SwiftUI

extension View {
    func snapshot(_ shouldSave: Bool = true) -> UIImage? {
            var screenshotImage :UIImage?
            let layer = UIApplication.shared.keyWindow!.layer
            let scale = UIScreen.main.scale
            UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
            guard let context = UIGraphicsGetCurrentContext() else {return nil}
            layer.render(in:context)
            screenshotImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            if let image = screenshotImage, shouldSave {
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            }
            return screenshotImage
        }
}
