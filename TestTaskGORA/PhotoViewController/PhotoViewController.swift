//
//  PhotoViewController.swift
//  TestTaskGORA
//
//  Created by Денис Ледовский on 24.01.2022.
//

import Foundation
import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var usersId = Int()
    let urlAlbum = URL(string: "https://jsonplaceholder.typicode.com/albums")
    let urlPhoto = URL(string: "https://jsonplaceholder.typicode.com/photos")

    let photoCellIdentifire = "photoCellIdentifire"

    var albunArray = [Album]()
    var photoJsonArray = [PhotoJson]()
    var photoSelectedArray = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "PhotoCell", bundle: nil),
                           forCellReuseIdentifier: photoCellIdentifire)
        print(usersId)
    }

    func makeRequesAlbum() {
        let task = URLSession.shared.dataTask(with: urlAlbum!) { [weak self] data, response, error in
            guard let data = data else {return}

            do {
                let albums = try JSONDecoder().decode([Album].self, from: data)
                self?.albunArray = albums
            } catch (let error) {
                print(error)
            }
        }
         task.resume()
     }

    func makeRequestPhoto() {
        let task = URLSession.shared.dataTask(with: urlPhoto!) { [weak self] data, response, error in
            guard let data = data else {return}

            do {
                let albums = try JSONDecoder().decode([PhotoJson].self, from: data)
                self?.photoJsonArray = albums
            } catch (let error) {
                print(error)
            }
        }
         task.resume()
    }

    func fillSelectedPhotoArray() {
        makeRequesAlbum()
        makeRequestPhoto()

    }

    
}
