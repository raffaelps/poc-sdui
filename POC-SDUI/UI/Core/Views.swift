//
//  Views.swift
//  POC-SDUI
//
//  Created by Raffael Patricio de Souza on 15/04/21.
//

import Foundation
import UIKit

enum Views {
    enum Cards {
        static func gradient() -> UIView { return UIView() }
        static func image(_ image: UIImage? = nil) -> UIImageView { return UIImageView() }
        static func title() -> UILabel { return UILabel() }
        static func subtitle(_ subtitle: String, icon: UIImageView) -> UIView { return UIView() }
        static func button() -> UIButton { return UIButton() }
    }
    
    enum Button {
        static func sparkleButton() -> SparkleButton {
            SparkleButton()
        }
    }
}
