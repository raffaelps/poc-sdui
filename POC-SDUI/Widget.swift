//
//  Widget.swift
//  POC-SDUI
//
//  Created by Raffael Patricio de Souza on 11/04/21.
//

import Foundation
import UIKit

protocol Widget: Decodable {
    func inflateUITableViewCell() -> UITableViewCell
}

enum WidgetIdentifier: String, Decodable {
//    case banner = "BANNER"
//    case collection = "COLLECTION"
//    case list = "LIST"
    
    case myPurchases = "MY_PURCHASES"
//    case live = "LIVE"
//    case wallet = "WALLET"
    
    var metatype: Widget.Type {
        switch self {
//        case .banner:
//            return BannerWidget.self
//        case .collection:
//            return CollectionWidget.self
//        case .list:
//            return ListWidget.self
        case .myPurchases:
            return MyPurchasesWidget.self
//        case .live:
//            return LiveWidget.self
//        case .wallet:
//            return WalletWidget.self
        }
    }
}
