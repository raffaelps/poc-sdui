//
//  Components.swift
//  POC-SDUI
//
//  Created by Raffael Patricio de Souza on 15/04/21.
//

import Foundation
import UIKit

enum Components {}

class Component<Model, Event> {
    typealias EventHandler = (Event) -> Void
    
    public let view: UIView
    public let update: (Model) -> Void
    public let onEvent: (EventHandler) -> Void
    
    init(
        viewBuilder: @escaping () -> UIView,
        update: @escaping (Model) -> Void,
        eventBinding: @escaping (EventHandler) -> Void
    ) {
        self.view = viewBuilder()
        self.update = update
        self.onEvent = eventBinding
    }
}
