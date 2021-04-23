//
//  HomeResponse.swift
//  POC-SDUI
//
//  Created by Raffael Patricio de Souza on 11/04/21.
//

import Foundation

struct HomeResponse: Decodable {
    
    private enum CodingKeys: CodingKey {
        case widgets
    }
    
    let widgets: [Widget]
    
    init() {
        self.widgets = []
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.widgets = try container.decode([AnyWidget].self, forKey: .widgets).compactMap { $0.widget }
    }
    
    init(widgets: [Widget]) {
        self.widgets = widgets
    }
}
