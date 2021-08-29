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

  private let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()

 
      .disposed(by: disposeBag)
  }

}
