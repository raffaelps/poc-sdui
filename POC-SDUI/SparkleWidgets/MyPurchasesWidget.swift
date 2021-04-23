//
//  MyPurchasesWidget.swift
//  POC-SDUI
//
//  Created by Raffael Patricio de Souza on 11/04/21.
//

import Foundation
import UIKit

struct MyPurchasesWidget: Widget {
    
    private let imageURLString: String
    
    func inflateUITableViewCell() -> UITableViewCell {
        return PurchaseWidget()
    }
}

class PurchaseWidget: UITableViewCell {
    
    override var reuseIdentifier: String? {
        "purchaseWidget"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
