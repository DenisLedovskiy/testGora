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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var usersId = Int()
    var imageCache = NSCache<NSString, UIImage>()

    let photoCellIdentifire = "photoCellIdentifire"

    var albumArray = [Album]()
    var photoJsonArray = [PhotoJson]()
    var photoSelectedArray = [PhotoJson]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "PhotoCell", bundle: nil),
                           forCellReuseIdentifier: photoCellIdentifire)
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        configureTableView()
        makeRequesAlbum()


    }

    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    func makeRequesAlbum() {
        let urlAlbum = URL(string: "https://jsonplaceholder.typicode.com/albums?userId=\(usersId)")
        let task = URLSession.shared.dataTask(with: urlAlbum!) { [weak self] data, response, error in
            guard let data = data else {return}

            do {
                let albums = try JSONDecoder().decode([Album].self, from: data)
                self?.albumArray = albums
                self?.makeRequestPhoto()
            } catch (let error) {
                print(error)
            }
        }
         task.resume()
     }

    func makeRequestPhoto() {

        for index in 0...albumArray.count - 1 {

            let albumId = albumArray[index].id
            let urlPhoto = URL(string: "https://jsonplaceholder.typicode.com/photos?albumId=\(albumId)")

            let task = URLSession.shared.dataTask(with: urlPhoto!) { [weak self] data, response, error in
                guard let data = data else {return}

                do {
                    let photo = try JSONDecoder().decode([PhotoJson].self, from: data)
                    self?.photoSelectedArray += photo
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                } catch (let error) {
                    print(error)
                }
            }
            task.resume()
        }
    }
}
