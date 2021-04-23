//
//  PictureCard.swift
//  POC-SDUI
//
//  Created by Raffael Patricio de Souza on 14/04/21.
//

import Foundation
import UIKit

private class PictureCard: UIView {
    
    let titleLabel: UIView
    let subtitleLabel: UIView
    let imageView: UIView
    let backgroundView: UIView
    private let accessoryView: UIView?
    
    init(titleLabel: UIView, subtitleLabel: UIView, imageView: UIView, backgroundView: UIView, accessoryView: UIView? = nil) {
        self.titleLabel = titleLabel
        self.subtitleLabel = subtitleLabel
        self.imageView = imageView
        self.backgroundView = backgroundView
        self.accessoryView = accessoryView
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//enum Views {
//    enum Cards {
//        static func gradient() -> UIView { return UIView() }
//        static func image(_ image: UIImage? = nil) -> UIImageView { return UIImageView() }
//        static func title() -> UILabel { return UILabel() }
//        static func subtitle(_ subtitle: String, icon: UIImageView) -> UIView { return UIView() }
//        static func button() -> HeroesButton {
//            let button = HeroesButton()
//            return button
//        }
//    }
//}

//enum Components {
//    enum Card {
//        static func makeLiteraryHero() -> Component<LiteraryHeroModel, LiteraryHeroEvent> {
//            let image = Views.Cards.image()
//            let button = Views.Cards.button()
//            let title = Views.Cards.title()
//
//            return Component { () -> UIView in
//                // Create view
//                Layout.makeCard(
//                    background: Views.Cards.gradient(),
//                    cardItems: [image, button],
//                    footer: title
//                )
//            } update: { (model) in
//                // Update model
//                image.image = model.image
//                title.text = model.name
//                button.setTitle("Buy", for: .normal)
//            } eventBinding: { (eventHandler) in
//                // Bind events
//                button.action = withoutActuallyEscaping(eventHandler) { escapableEventHandler in
//                    { escapableEventHandler(.buy) }
//                }
//            }
//        }
//    }
//}

//class ViewControllerTeste {
//    func createView() {
//
//        let model = LiteraryHeroModel(name: "Buy", book: "Swift Book", image: UIImage(named: "")!)
//
//        let literaryHero = Components.Card.makeLiteraryHero()
//        literaryHero.update(model)
//        literaryHero.onEvent { event in
//            switch event {
//            case .buy:
//                // Buy item
//                break
//            }
//        }
//
//        //literaryHero.view
//    }
//}

//enum Layout {
//    static func makeCard(background: UIView, cardItems: [UIView], footer: UIView) -> UIView {
//        let view = UIView()
//        view.addSubview(background)
//
//        let stackView = UIStackView()
//        cardItems.forEach { stackView.addArrangedSubview($0) }
//        background.addSubview(stackView)
//
//        // Layout contraints
//
//        return view
//    }
//}

//struct LiterayHero {
//    let name: String
//    let book: UIImage
//    let image: UIImage
//    let buyAction: (() -> ())
//
//    var view: UIView {
//        Layout.makeCard(
//            background: Views.Cards.gradient(),
//            cardItems: [Views.Cards.image(image), Views.Cards.button()],
//            footer: Views.Cards.title()
//        )
//    }
//}

struct LiteraryHeroModel {
    var name: String
    var book: String
    var image: UIImage
}

enum LiteraryHeroEvent {
    case buy
}

class HeroesButton: UIButton {
    
    var action: (() -> ())?
    
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

//class Component<Model, Event> {
//    typealias EventHandler = (Event) -> Void
//    
//    public let view: UIView
//    public let update: (Model) -> Void
//    public let onEvent: (EventHandler) -> Void
//    
//    init(
//        viewBuilder: @escaping () -> UIView,
//        update: @escaping (Model) -> Void,
//        eventBinding: @escaping (EventHandler) -> Void
//    ) {
//        self.view = viewBuilder()
//        self.update = update
//        self.onEvent = eventBinding
//    }
//}

