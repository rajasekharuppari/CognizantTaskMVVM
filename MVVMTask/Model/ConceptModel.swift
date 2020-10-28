//
//  ConceptModel.swift
//  MVVMTask
//
//

import Foundation

// MARK: - Concept
struct Concept: Codable {
    var title: String?
    var rows: [Row]?
}

// MARK: - Row
struct Row: Codable {
    var title, rowDescription: String?
    var imageHref: String?

    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription
        case imageHref
    }
}
