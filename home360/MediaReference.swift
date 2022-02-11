//
//  MediaReference.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-16.
//

// MARK: - MediaReference
struct MediaReference: Decodable {
    let status: Bool?
    let id, referringObjectType, referreringObjectID, mainImage: String?
    let publicURL, fileURL: String?
    let mediaType, storageLocation, createdBy, createdAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case status
        case id = "_id"
        case referringObjectType = "referring_object_type"
        case referreringObjectID = "referrering_object_id"
        case mainImage = "main_image"
        case publicURL = "public_url"
        case fileURL = "file_url"
        case mediaType = "media_type"
        case storageLocation = "storage_location"
        case createdBy = "created_by"
        case createdAt = "created_at"
        case v = "__v"
    }
}

