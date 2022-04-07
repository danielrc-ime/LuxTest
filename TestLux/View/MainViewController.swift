//
//  MainViewController.swift
//  TestLux
//
//  Created by Yonusa iOS on 07/04/22.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: - Vars
    var mainVM = MainVM()

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        mainVM.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainVM.getData(fileName: "items")
    }

}

//MARK: - Table Delegate
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainVM.itemsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        
        cell.labelTitle.text = mainVM.itemsModel[indexPath.row].title
        cell.labelDescription.text = mainVM.itemsModel[indexPath.row].details.description
        
        cell.labelDay.text = returnDayOfWeek(day: mainVM.itemsModel[indexPath.row].details.day)
        
        return cell
        
    }
    
    func returnDayOfWeek(day: Int) -> String{
        switch day {
        case 1:
            return "Monday"
        case 2:
            return "Tuesday"
        case 3:
            return "Wednesday"
        case 4:
            return "Thursday"
        case 5:
            return "Friday"
        case 6:
            return "Saturday"
        case 7:
            return "Sunday"
        default:
            return ""
        }
    }
    
}

//MARK: - ViewModel Delegate
extension MainViewController: MainVMDelegate {
    func refreshData() {
        tableView.reloadData()
    }
    
    func errorInMainVM(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
        
    }
    

}
