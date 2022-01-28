//
//  PhotoVC + DataSource.swift
//  TestTaskGORA
//
//  Created by Денис Ледовский on 24.01.2022.
//

import Foundation
import UIKit

extension PhotoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        photoSelectedArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: photoCellIdentifire, for: indexPath)
                as? PhotoCell else {return UITableViewCell()}
        
        cell.configure(photoJson: photoSelectedArray[indexPath.row])
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true

        return cell
    }


}
