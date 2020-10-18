//
//  SubtitleTableViewCell.swift
//  Dictionary
//
//  Created by admin on 28/09/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//

import UIKit
protocol SubtitleTableViewDelegate: class{
    func handleShowDetail(subtitle:Subtitle)
}

class SubtitleTableViewCell: UITableViewCell {

    @IBOutlet weak var thumnailImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    weak var delegate:SubtitleTableViewDelegate?
    var subtitleItem:Subtitle!
    
    @IBAction func showDetail(_ sender: UIButton) {
        delegate?.handleShowDetail(subtitle: subtitleItem)
    }
    func setupCell(subtitle:Subtitle) {
        let urlImage = "https://tracau.vn/resources/posters/thumbnails/\(subtitle.fields.thumbnail).jpg"
        let queue = DispatchQueue(label: "loadImageFromInternet")
        queue.async {
            let url = URL(string: urlImage)
            do {
                let data = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.thumnailImageView.image = UIImage(data: data)
                    self.thumnailImageView.contentMode = .scaleToFill
                }
            }catch {
                print("Can not load image from the url")
            }
        }
        movieTitle.text = /*subtitle.fields.vi + "\n" + subtitle.fields.en + "\n" +*/ subtitle.fields.movieTitle
        movieTitle.numberOfLines = 0
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
