//
//  PhuDePhimViewController.swift
//  Dictionary
//
//  Created by admin on 22/09/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//

import UIKit


class PhuDePhimViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtInput: UITextField!
    
    
    var subtitles:[Subtitle]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        txtInput.delegate = self
    }
    func getDataFromAPI(urlString:String, completion:@escaping (SearchSubtitleOnline) -> ()) {
        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            var subtitleOnline:SearchSubtitleOnline?
            do {
                subtitleOnline = try JSONDecoder().decode(SearchSubtitleOnline.self, from: data!)
                DispatchQueue.main.async {
                    completion(subtitleOnline!)
                }
            }catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    @IBAction func searchSubtitleFilmButton(_ sender: UIButton) {
        
        guard let input = txtInput.text else { return }
        
        if let encodeString = input.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed) {
            let urlString = "\(API.API_URL)/sub/\(encodeString)/\(Language.en.rawValue)"
            //let tempURLString = "https://api.tracau.vn/WBBcwnwQpV89/sub/dusk%20till%20dawn/en"
            getDataFromAPI(urlString: urlString) { (searchSubtitleOnline) in
                self.subtitles = searchSubtitleOnline.subtitles
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        subtitles = []
        txtInput.text = ""
        txtInput.resignFirstResponder()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
extension PhuDePhimViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
extension PhuDePhimViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(190)
    }
}
extension PhuDePhimViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if subtitles != nil {
            return subtitles!.count
        }
        else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardConstants.subtitleCell,
                                                 for: indexPath) as! SubtitleTableViewCell
        let subtitle = subtitles![indexPath.row]
        cell.setupCell(subtitle: subtitle)
        cell.subtitleItem = subtitle
        cell.delegate = self
        return cell
    }
}
extension PhuDePhimViewController : SubtitleTableViewDelegate {
    func handleShowDetail(subtitle:Subtitle) {
        self.performSegue(withIdentifier: StoryboardConstants.segueShowDetail, sender: subtitle)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryboardConstants.segueShowDetail {
            let destVC = segue.destination as! ShowDetailViewController
            destVC.subtitleItem = sender as? Subtitle
        }
    }
}
