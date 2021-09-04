//
//  SearchViewController.swift
//  DoYouKnowiOS
//
//  Created by KimKyungHoon on 2021/08/29.
//

import UIKit

import RxSwift
import RxCocoa


class SearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let searchInfo = API.shared
        
        searchInfo.getRequest { result in
            switch result {
            case .success(let data):
                print(data)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
