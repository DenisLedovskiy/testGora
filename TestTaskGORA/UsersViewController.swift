//
//  ViewController.swift
//  TestTaskGORA
//
//  Created by Денис Ледовский on 21.01.2022.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!

    var dataSource: [Users] = []

    let urlUsers = URL(string: "https://jsonplaceholder.typicode.com/users")

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
               self?.dataSource = users
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

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let user = dataSource[indexPath.row]
        cell?.textLabel?.text = "\(user.name)"
        return cell ?? UITableViewCell()
    }


}

