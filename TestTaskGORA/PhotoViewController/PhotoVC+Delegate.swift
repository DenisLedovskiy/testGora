//
//  PhotoVC+Delegate.swift
//  TestTaskGORA
//
//  Created by Денис Ледовский on 24.01.2022.
//

import Foundation
import UIKit

extension PhotoViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }

}
