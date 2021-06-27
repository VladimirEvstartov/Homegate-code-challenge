//
//  HGCPropertyCell.swift
//  Homegate task
//
//  Created by Vladimir on 26.06.2021.
//

import UIKit

protocol HGCFavoritePropertyDelegate: AnyObject {
    func updateFavorite(propetyId: Int)
}

class HGCPropertyCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var propertyImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!

    var model: HGCPropertyCellModel? {
        didSet {
            guard let details = model?.property else {return}
        
            setTitle(property: details)
            setImage(property: details)
            setPrice(property: details)
            setAddress(property: details)
            setFavorite(property: details)
        }
    }

    weak var delegate: HGCFavoritePropertyDelegate?

    private func setFavorite(property: HGCPrpoperty) {
        likeButton.setImage((property.isFavorite ?? false) ? HGCImages.favoriteIcon : HGCImages.notFavoriteIcon, for: .normal)
    }

    private func setTitle(property: HGCPrpoperty) {
        titleLabel.text = property.title ?? ""
    }

    private func setImage(property: HGCPrpoperty) {
        if let url = URL(string: property.picFilename1Medium ?? "") {
            HGCImageFetchingService.shared.setImage(for: propertyImage, url: url, placeholderImage: HGCImages.noPhoto)
        }
    }

    private func setPrice(property: HGCPrpoperty) {
        if let price = property.price {
            priceLabel.text = "\(price) \(property.currency ?? "CHF" )"
        } else {
            priceLabel.text = HGCSttings.pleaseCall
        }
    }

    private func setAddress(property: HGCPrpoperty) {
        addressLabel.text = "\(property.street ?? ""), \(property.zip ?? "") \(property.city ?? "")"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        bgView?.layer.cornerRadius = 4
        bgView?.layer.applyShadow(alpha: 0.2, y: 4, blur: 4)

        propertyImage.clipsToBounds = true
    }

    @IBAction func likeButtonTapped(_ sender: UIButton) {
        guard let propertyId = model?.property.advertisementID else {return}
        delegate?.updateFavorite(propetyId: propertyId)
    }

}
