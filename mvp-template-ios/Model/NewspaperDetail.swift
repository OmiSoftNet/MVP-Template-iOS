//
//  Newspaper.swift
//  NewspapersDemoApp
//
//  Created by Руслан Федорович on 7/5/19.
//  Copyright © 2019 Руслан Федорович. All rights reserved.
//

import Foundation

private enum CodingKeys: String, CodingKey {
    case publisher = "publisher"
    case title = "name"
    case startYear = "start_year"
    case endYear = "end_year"
}


struct NewspaperDetail {
    let publisher: String?
    let title: String
    let startYear: String?
    let endYear: String?
}

extension NewspaperDetail: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.title = try container.decode(String.self, forKey: .title)
        self.publisher = try container.decode(String?.self, forKey: .publisher) ?? nil
        self.startYear = try container.decode(String?.self, forKey: .startYear) ?? nil
        self.endYear = try container.decode(String?.self, forKey: .endYear) ?? nil
    }
}
