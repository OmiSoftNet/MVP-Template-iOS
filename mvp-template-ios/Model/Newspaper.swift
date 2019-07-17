//
//  Newspaper.swift
//  NewspapersDemoApp
//
//  Created by Руслан Федорович on 7/5/19.
//  Copyright © 2019 Руслан Федорович. All rights reserved.
//

import Foundation

private enum CodingKeys: String, CodingKey {
    case state = "state"
    case title = "title"
    case url = "url"
}


struct Newspaper {
    let state: String
    let title: String
    let url: String
}

extension Newspaper: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.state = try container.decode(String.self, forKey: .state)
        self.title = try container.decode(String.self, forKey: .title)
        self.url = try container.decode(String.self, forKey: .url)
    }
}
