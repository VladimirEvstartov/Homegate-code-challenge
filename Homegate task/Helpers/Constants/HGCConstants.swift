//
//  HGCConstants.swift
//  Homegate task
//
//  Created by Vladimir on 26.06.2021.
//

import UIKit

struct HGCConstants {
    static let imageFetcherCacheSize: UInt = 52428800
    static let favoritesKey = "favoriteProperties"
}

struct HGCNibs {
    static let propertyCell = "HGCPropertyCell"
}

struct HGCSttings {
    static let pleaseCall = "PleaseCall".localized
    static let errorTitle = "ErrorTitle".localized
    static let okTitle = "OKTitle".localized
}

struct HGCImages {
    static let noPhoto = UIImage(named: "nophoto")
    static let favoriteIcon = UIImage(named: "icn_love_on")
    static let notFavoriteIcon = UIImage(named: "icn_love_off")
}
