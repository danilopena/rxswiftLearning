//
//  TableViewController.swift
//  LearningRxSwift
//
//  Created by Danilo Ricardo Dias Pena on 04/06/2018.
//  Copyright © 2018 Danilo Pena. All rights reserved.
//

import UIKit
import RxSwift

class TableViewController: UIViewController {

    @IBOutlet weak var tableView : UITableView!
    
    let personArray = [
        Person(name: "Big name for two lines test tableview rxswift", age: "10"),
        Person(name: "name1", age: "11"),
        Person(name: "name2", age: "12"),
        Person(name: "name3", age: "13"),
        Person(name: "name4", age: "14")
    ]
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildTableView()
    }
    
    func buildTableView () {
        let observePersons : Observable<[Person]> = Observable.just(personArray)
        
        _ = observePersons.bind(to: tableView.rx.items(cellIdentifier: "customCell")) {
            _ , person , cell in
            if let cellToUse = cell as? CustomCell {
                cellToUse.title.text = person.name
                cellToUse.detail.text = person.age
            }
            }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Person.self).subscribe(onNext: { person in
            print(person.name)
        }).disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
