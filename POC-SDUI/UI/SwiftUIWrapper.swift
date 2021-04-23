//
//  SwiftUIWrapper.swift
//  POC-SDUI
//
//  Created by Raffael Patricio de Souza on 14/04/21.
//

import Foundation
import SwiftUI

struct SwiftUIWrapper<Model, Event>: UIViewRepresentable {
    let view: UIView
    let component: Component<Model, Event>
    var model: Model
    
    init(model: Model, _ builder: @escaping () -> Component<Model, Event>) {
        self.component = builder()
        self.view = component.view
        self.model = model
    }
    
    // MARK: - UIViewRepresentable
    
    func makeUIView(context: Context) -> some UIView {
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        component.update(model)
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
