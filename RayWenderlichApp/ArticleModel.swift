//
//  LibraryModel.swift
//  RayWenderlichApp
//
//  Created by Woolheater, Kiyoshi on 8/18/23.
//

import Foundation

struct ArticleModel: Codable {
    let data: [Article]
}

struct Article: Codable {
    let id: String
    let type: String
    let attributes: ArticlesAttributes
    let relationships: ArticlesRelationships
    let links: ArticlesLinks
}

struct ArticlesLinks: Codable {
    let `self`: String
}

struct ArticlesAttributes: Codable {
    let name: String
    let description: String
    let releasedAt: String
    let free: Bool
    let difficulty: String?
    let contentType: String
    let duration: Int
    let popularity: Int
    let technologyTripleString: String
    let contributorString: String
    let ordinal: String?
    let professional: Bool
    let descriptionPlainText: String
    let videoIdentifier: String?
    let parentName: String?
    let cardArtworkUrl: String
    
    enum CodingKeys: String, CodingKey {
        case name, description, free, difficulty, duration, popularity, ordinal, professional
        case contentType = "content_type"
        case releasedAt = "released_at"
        case technologyTripleString = "technology_triple_string"
        case contributorString = "contributor_string"
        case descriptionPlainText = "description_plain_text"
        case videoIdentifier = "video_identifier"
        case parentName = "parent_name"
        case cardArtworkUrl = "card_artwork_url"
    }
}

struct ArticlesRelationships: Codable {
    let domains: Domains
    let childContents: Meta
    let progression: ProgressionData
    let bookmark: BookmarkData
    
    enum CodingKeys: String, CodingKey {
        case domains
        case childContents = "child_contents"
        case progression
        case bookmark
    }
}

struct Domains: Codable {
    let data: [DomainData]
}

struct DomainData: Codable {
    let id: String
    let type: String
}

struct Meta: Codable {
    let meta: ChildContentsMeta
}

struct ChildContentsMeta: Codable {
    let count: Int
}

struct ProgressionData: Codable {
    // This property can be Optional if the JSON contains null for this field
    let data: String?
}

struct BookmarkData: Codable {
    // This property can be Optional if the JSON contains null for this field
    let data: String?
}
