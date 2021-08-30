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
    
//    private var handler: ((Result<[SearchViewModel], API.APIError>) -> Void)!

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
        
        
//        handler = { [weak self] result in
//            guard self != nil else { return }
//                    switch result {
//                    case .success(let SearchViewModel):
//                        guard SearchViewModel.first != nil else { return }
//
//                    case .failure(let error):
//                        print("Error", error.localizedDescription)
//                    }
//
//        }
        

//closure 공부해오기, 왜 쓰고, 어디서 쓰고 , 어떻게 쓰는지 공부해오기
    }

}
