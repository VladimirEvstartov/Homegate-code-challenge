//
//  HGCBaseViewController.swift
//  Homegate task
//
//  Created by Vladimir on 26.06.2021.
//

import UIKit

class HGCBaseViewController: UIViewController {

    private var spinner: UIActivityIndicatorView?
    
    func fetchDataDidStart(){
        guard spinner == nil else {return}
        
        let  spinner = UIActivityIndicatorView(style: .large)
        self.spinner = spinner
        spinner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view.bringSubviewToFront(spinner)
        spinner.startAnimating()
    }
    
    func fetchDataDidEnd(){
        guard let spinner = spinner else {return}
        spinner.stopAnimating()
        spinner.removeFromSuperview()
        self.spinner = nil
    }
    
    func raiseError(title: String?, text: String?) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let okAction = UIAlertAction(title: HGCSttings.okTitle, style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
