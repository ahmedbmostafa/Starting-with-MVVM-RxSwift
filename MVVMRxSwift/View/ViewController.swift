//
//  ViewController.swift
//  MVVMRxSwift
//
//  Created by ahmed mostafa on 12/13/20.
//  Copyright © 2020 ahmed mostafa. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposBag = DisposeBag()
    
    
    private var viewModel: RestaurantsListViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    static func instantiate(viewModel: RestaurantsListViewModel) -> ViewController {

        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.tableFooterView = UIView()
        navigationItem.title = viewModel.title

        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.contentInsetAdjustmentBehavior = .never
        
        
        viewModel.fetchRestaurantsViewModels().observeOn(MainScheduler.instance).bind(to: tableView.rx.items(cellIdentifier: "cell")) {
            index, viewModel, cell in
            
            cell.textLabel?.text = viewModel.displayText
            print("done")
        }.disposed(by: disposBag)
        
    }
    
    
}

