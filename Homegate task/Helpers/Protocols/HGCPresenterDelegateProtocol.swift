//
//  HGCPresenterDelegateProtocol.swift
//  Homegate task
//
//  Created by Vladimir on 25.06.2021.
//

import Foundation

protocol HGCPresenterDelegate: AnyObject {
    func fetchDataDidStart()
    func fetchDataDidEnd()
    func updateUI()
    func raiseError(title: String?, text: String?)
}
