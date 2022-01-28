//
//  UsersVC+DS+Delegate.swift
//  TestTaskGORA
//
//  Created by Денис Ледовский on 28.01.2022.
//

import Foundation
import UIKit

extension UsersViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let user = usersArray[indexPath.row]
        cell?.textLabel?.text = "\(user.name)"
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: fromUsersToPhorosIdentifire, sender: usersArray[indexPath.row])
    }
}
