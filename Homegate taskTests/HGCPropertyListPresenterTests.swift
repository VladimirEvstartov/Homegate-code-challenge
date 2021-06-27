//
//  HGCPropertyListPresenterTests.swift
//  Homegate taskTests
//
//  Created by Vladimir on 27.06.2021.
//

import XCTest

@testable import Homegate_task

class HGCPropertyListPresenterTests: XCTestCase {
    
    var presenter: Homegate_task.HGCPropertyListPresenter!
    static var mockData: [Homegate_task.HGCPrpoperty] = []
    var propetires: [Homegate_task.HGCPrpoperty] = []
    fileprivate let expectation = XCTestExpectation(description: "exp")
    
    override class func setUp() {
        let testBundle = Bundle(for: self)
        guard let json = testBundle.url(forResource: "HGCPropertyMock", withExtension: "json") else {return}
        guard let data = try? Data(contentsOf: json) else {return}
        guard let model = try? JSONDecoder().decode(Homegate_task.HGCPrpopertyResponce.self, from: data) else {return}
        guard let items = model.items, !items.isEmpty else {return}
        mockData = items
    }
    
    override func setUpWithError() throws {
        
        propetires = HGCPropertyListPresenterTests.mockData
        XCTAssertFalse(propetires.isEmpty)
        
    }
    
    override func setUp() {
        presenter = Homegate_task.HGCPropertyListPresenter()
        presenter.networkService = self
        presenter.fetchProperies()
        wait(for: [expectation], timeout: 0.5)
    }

    override func tearDown() {
        UserDefaults.standard.removeObject(forKey:HGCConstants.favoritesKey)
        presenter = nil
    }

    func testModelForRow() throws {
        let row = 0
        let model = presenter.modelForRow(row)
        XCTAssertEqual(model?.property.advertisementID, propetires[row].advertisementID)
    }
    
    func testNumberOfRows() {
        XCTAssertEqual(presenter.numberOfRows, propetires.count)
    }
    
    func testUpdateFavorites() {
        let row = 0
        let model = presenter.modelForRow(row)?.property
        XCTAssertNotNil(model?.advertisementID)
        XCTAssertNil(model?.isFavorite)
        presenter.updateFavorite(propetyId: model!.advertisementID)
        let favoriteModel = presenter.modelForRow(row)?.property
        XCTAssertTrue(favoriteModel?.isFavorite ?? false)
        presenter.updateFavorite(propetyId: model!.advertisementID)
        let notFavoriteModel = presenter.modelForRow(row)?.property
        XCTAssertFalse(notFavoriteModel?.isFavorite ?? true)
    }


    override class func tearDown() {
        mockData = []
    }

}

extension HGCPropertyListPresenterTests: Homegate_task.HGCNetworkServicePtorocol {
    func loadProperties(completion: @escaping (Result<[ Homegate_task.HGCPrpoperty], Error>) -> ()) {
        completion(.success(propetires))
        expectation.fulfill()
    }
}
