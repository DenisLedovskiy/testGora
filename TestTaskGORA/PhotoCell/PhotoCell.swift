//
//  PhotoCell.swift
//  TestTaskGORA
//
//  Created by Денис Ледовский on 24.01.2022.
//

import Foundation
import UIKit

class PhotoCell: UITableViewCell {

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoText: UILabel!
    @IBOutlet weak var backView: UIView!

    var imageCache = NSCache<NSString, UIImage>()
    
    override func prepareForReuse() {
        super.prepareForReuse()

        photoImage.image = nil
        photoText.text = nil
    }

    func getImage(from url: String) -> UIImage? {
        var image: UIImage?
        guard let imageURL = URL(string: url) else { return nil }

        if let cachedImage = imageCache.object(forKey: imageURL.absoluteString as NSString) {
            print("Data from cashe")
            return cachedImage
        } else {
        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
        image = UIImage(data: imageData)
        imageCache.setObject(image!, forKey: imageURL.absoluteString as NSString)
            print("Data from JSON")
        return image
        }
    }

    func configure(photoJson: PhotoJson) {
            photoImage.image = getImage(from: photoJson.url)
            photoText.text = photoJson.title
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = UIColor.clear

            self.backView.layer.borderWidth = 2
            self.backView.layer.cornerRadius = 5
            self.backView.layer.borderColor = UIColor.clear.cgColor
            self.backView.layer.masksToBounds = true

            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.layer.shadowRadius = 3
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.masksToBounds = false


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}



   
