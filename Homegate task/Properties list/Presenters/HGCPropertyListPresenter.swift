//
//  HGCPropertyListPresenter.swift
//  Homegate task
//
//  Created by Vladimir on 25.06.2021.
//

import Foundation

class HGCPropertyListPresenter {
    
    weak var view: HGCPresenterDelegate?
    var networkService: HGCNetworkServicePtorocol = HGCNetworkService()
    private var properties: [HGCPrpoperty] = []
    
    func fetchProperies() {
        view?.fetchDataDidStart()
        networkService.loadProperties { [weak self] result in
            self?.view?.fetchDataDidEnd()
            switch result {
            case .success(let items):
                self?.properties = items
                self?.setFavorites()
                self?.view?.updateUI()
            case .failure(let error):
                self?.view?.raiseError(title: HGCSttings.errorTitle, text: error.localizedDescription)
            }
        }
    }
    
    var numberOfRows: Int {
        return properties.count
    }
    
    func modelForRow(_ row: Int) -> HGCPropertyCellModel? {
        guard properties.indices.contains(row) else {return nil}
        return HGCPropertyCellModel(property: properties[row])
    }
    
    // MARK: - Favorites
    // Make everything as simple as possible, but not simpler. (C) Albert Einstein
    
    private func setFavorites() {
        guard let favorites = UserDefaults.standard.array(forKey: HGCConstants.favoritesKey) as? [Int], !properties.isEmpty else {return}
        let indexes = properties.indices.filter({favorites.contains(properties[$0].advertisementID)})
        indexes.forEach({properties[$0].isFavorite = true})
    }
    
    private func saveFavorites(){
        let favorites = properties.filter({$0.isFavorite ?? false}).compactMap({$0.advertisementID})
        guard !favorites.isEmpty else {return}

        UserDefaults.standard.set(favorites, forKey: HGCConstants.favoritesKey)
    }
}

// MARK: - HGCFavoritePropertyDelegate
extension HGCPropertyListPresenter: HGCFavoritePropertyDelegate {
    func updateFavorite(propetyId: Int) {
        guard let index = properties.firstIndex(where: {$0.advertisementID == propetyId}) else {return}
        properties[index].isFavorite = !(properties[index].isFavorite ?? false)
        view?.updateUI()
        saveFavorites()
    }
}
