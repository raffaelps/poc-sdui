//
//  SparkleButtonComponent.swift
//  POC-SDUI
//
//  Created by Raffael Patricio de Souza on 15/04/21.
//

import Foundation
import UIKit

extension Components {
    enum SparkleButton {
        static func makeSparkleButton() -> Component<SparkleButtonModel, SparkleButtonEvent> {
            
            // Create view components
            let button = Views.Button.sparkleButton()

            return Component { () -> UIView in

                // Create view
                Layout.makeButton(element: button)

            } update: { (model) in

                // Update model
                button.setTitle(model.title, for: .normal)
                button.backgroundColor = model.backgroundColor

            } eventBinding: { (eventHandler) in

                // Bind events
//                button.action = { eventHandler(.tap) }
            }
            
        }
    }
}

class SparkleButton: UIButton {
    
    var action: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }
    
    @objc func didTap() {
        action?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Layout {
    
    static func makeButton(element: UIView) -> UIView {
        let view = UIView()
        view.addSubview(element)
        
        // Layout contraints
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        view.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        element.translatesAutoresizingMaskIntoConstraints = false
        element.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        element.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        return view
    }
    
}
