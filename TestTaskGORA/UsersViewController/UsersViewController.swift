//
//  ViewController.swift
//  TestTaskGORA
//
//  Created by Денис Ледовский on 21.01.2022.
//

import UIKit

class UsersViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!

    var usersArray: [Users] = []

    let urlUsers = URL(string: "https://jsonplaceholder.typicode.com/users")
    let fromUsersToPhorosIdentifire = "fromUsersToPhotos"

    override func viewDidLoad() {
        super.viewDidLoad()
        makeRequest()
        configureTableView()
    }

    func makeRequest() {
       let task = URLSession.shared.dataTask(with: urlUsers!) { [weak self] data, response, error in
           guard let data = data else {return}

           do {
               let users = try JSONDecoder().decode([Users].self, from: data)
               self?.usersArray = users
               DispatchQueue.main.async {
                   self?.tableView.reloadData()
               }
           } catch (let error) {
               print(error)
           }
       }
        task.resume()
    }

    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fromUsersToPhorosIdentifire,
           let sourceVC = segue.source as? UsersViewController,
            let destinationVC = segue.destination as? PhotoViewController,
           let user = sender as? Users {
            destinationVC.usersId = user.id
        }
    }
}

