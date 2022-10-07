//
//  ViewController.swift
//  MVVM_Practice
//
//  Created by Cenk Bahadır Çark on 6.10.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let networkManager = NetworkManager(session: .shared)
        
        AlbumAPI(networkManager: networkManager).retriveAlbum(request: .init(userId: 1)) { result in
            switch result {
            case .success(let response):
                print("fooo response: \(response)")
            case .failure(let error):
                print("fooo error: \(error.description)")
            }
        }
        
        UserAPI(networkManager: networkManager).retriveUser(request: .init()) { result in
            switch result {
            case .success(let success):
                print("fooooo user: \(success)")
            case .failure(let error):
                print("fooooo error: \(error)")
            }
        }
        
        PhotosAPI(networkManager: networkManager).retrieveAlbum(request: .init(albumId: 1)) { result in
            switch result {
            case .success(let success):
                print("fooo photos: \(success)")
            case .failure(let error):
                print("fooo error: \(error)")
            }
        }
    }


}

