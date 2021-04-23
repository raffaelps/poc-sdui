//
//  Element.swift
//  POC-SDUI
//
//  Created by Raffael Patricio de Souza on 11/04/21.
//

import Foundation
import UIKit

protocol Element {}

protocol SparkleTableViewCell: UITableViewCell, Element {
    var cellIdentifier: String { get }
}
