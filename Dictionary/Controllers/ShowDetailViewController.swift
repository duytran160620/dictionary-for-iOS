//
//  ShowDetailViewController.swift
//  Dictionary
//
//  Created by admin on 29/09/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//

import UIKit

class ShowDetailViewController: UIViewController {

    
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var textfieldVi: UILabel!
    @IBOutlet weak var textfieldEn: UILabel!
    @IBOutlet weak var textfieldMovieTitle: UILabel!
    @IBOutlet weak var textViewSnippet: UITextView!
    
    var subtitleItem:Subtitle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadImageFromInternet()
    }
    func setupUI() {
        textfieldVi.text = subtitleItem?.fields.vi
        textfieldVi.numberOfLines = 0
        textfieldEn.text = subtitleItem?.fields.en.replacingOccurrences(of: "<em>", with: "").replacingOccurrences(of: "</em>", with: "")
        textfieldEn.numberOfLines = 0
        textfieldMovieTitle.text = subtitleItem?.fields.movieTitle
        textfieldMovieTitle.numberOfLines = 0
        textViewSnippet.text = subtitleItem?.fields.snippet.replacingOccurrences(of: "<br>", with: "\n")
    }
    func loadImageFromInternet() {
        let url = URL(string: "https://tracau.vn/resources/posters/thumbnails/\(subtitleItem!.fields.thumbnail).jpg")
        let queue = DispatchQueue(label: "LoadImageFromInternet")
        queue.async {
            do {
                let data = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = UIImage(data: data)
                }
            }catch {
                print("Can not load image from url")
            }
        }
    }
}


