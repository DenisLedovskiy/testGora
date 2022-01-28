//
//  PhotoModel.swift
//  TestTaskGORA
//
//  Created by Денис Ледовский on 24.01.2022.
//

import Foundation

struct PhotoJson: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
}
