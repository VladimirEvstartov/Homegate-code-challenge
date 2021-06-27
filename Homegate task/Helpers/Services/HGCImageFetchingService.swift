//
//  HGCImageFetchingService.swift
//  Homegate task
//
//  Created by Vladimir on 27.06.2021.
//

import Foundation
import SDWebImage

class HGCImageFetchingService {

    static var shared = HGCImageFetchingService(capacity: HGCConstants.imageFetcherCacheSize)

    init(capacity: UInt) {
        let cacheConfiguration = SDImageCacheConfig()
        cacheConfiguration.maxDiskSize = capacity
        let cache = SDImageCache(namespace: "Cpeech.Cache", diskCacheDirectory: nil, config: cacheConfiguration)
        SDWebImageManager.defaultImageCache = cache
    }

    func setImage(for imageView: UIImageView, url: URL?, placeholderImage: UIImage? = nil) {

        imageView.sd_setImage(with: url, placeholderImage: placeholderImage, options: [], context: nil, progress: { _, _, _ in
           
        }) { _, _, _, _ in

        }
    }
}
