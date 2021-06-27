//
//  HGCPropertyModel.swift
//  Homegate task
//
//  Created by Vladimir on 25.06.2021.
//

import Foundation

// MARK: - HGCPrpopertyResponce
struct HGCPrpopertyResponce: Codable {
    let resultCount, start, page, pageCount: Int?
    let itemsPerPage: Int?
    let hasNextPage, hasPreviousPage: Bool?
    let items: [HGCPrpoperty]?
}

// MARK: - HGCExternalURL
struct HGCExternalURL: Codable {
    let url: String?
    let type, label: String?
}

// MARK: - HGCPrpoperty
struct HGCPrpoperty: Codable {
    let advertisementID: Int
    let score: Int?
    let agencyID, title, street, zip: String?
    let text, city: String?
    let country: String?
    let geoLocation: String?
    let offerType: String?
    let objectCategory: String?
    let objectType: Int?
    let numberRooms: Double?
    let floor, surfaceLiving, surfaceUsable: Int?
    let currency: String?
    let sellingPrice, price: Int?
    let priceUnit: String?
    let timestamp: Int?
    let timestampStr: String?
    let balcony: Bool?
    let lastModified, searchInquiryTimestamp: Int?
    let picFilename1Small, picFilename1Medium: String?
    let pictures: [String]?
    let objectTypeLabel: String?
    let countryLabel: String?
    let floorLabel, itemDescription: String?
    let listingType: String?
    let agencyLogoURL: String?
    let agencyPhoneDay, contactPerson, contactPhone: String?
    let interestedFormType: Int?
    let externalUrls: [HGCExternalURL]?
    let picFilename1: String?
    let lift, wheelchairAccess, animalAllowed, builtNew: Bool?
    let adURL: String?
    let adURLTitle: String?
    var isFavorite: Bool?

    enum CodingKeys: String, CodingKey {
        case advertisementID = "advertisementId"
        case score
        case agencyID = "agencyId"
        case title
        case street
        case zip
        case text
        case city
        case country
        case geoLocation
        case offerType
        case objectCategory
        case objectType
        case numberRooms
        case floor
        case surfaceLiving
        case surfaceUsable
        case currency
        case sellingPrice
        case price
        case priceUnit
        case timestamp
        case timestampStr
        case balcony
        case lastModified
        case searchInquiryTimestamp
        case picFilename1Small
        case picFilename1Medium
        case pictures
        case objectTypeLabel
        case countryLabel
        case floorLabel
        case itemDescription = "description"
        case listingType
        case agencyLogoURL = "agencyLogoUrl"
        case agencyPhoneDay
        case contactPerson
        case contactPhone
        case interestedFormType
        case externalUrls
        case picFilename1
        case lift
        case wheelchairAccess
        case animalAllowed
        case builtNew
        case adURL = "adUrl"
        case adURLTitle = "adUrlTitle"
    }
}
