//
//  ViewController.swift
//  MVVM-REST-API
//
//  Created by Ruthlyn Huet on 4/5/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let parser = Parser()
    var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        fetchData()
    }
    
    func tableViewSetup(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    func fetchData(){
        parser.parse{ (data) in
            self.contacts = data
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
    }
    


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].name
        return cell
    }
    
    
}

