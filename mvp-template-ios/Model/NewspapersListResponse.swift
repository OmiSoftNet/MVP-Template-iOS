//
//  PostModel.swift
//  TemplateProject
//

import Foundation

private enum CodingKeys: String, CodingKey {
    case newspapersList = "newspapers"
}

struct NewspapersListResponse {
    let newspapersList: [Newspaper]
}

extension NewspapersListResponse: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.newspapersList = try container.decode([Newspaper].self, forKey: .newspapersList)
    }
}
