//
//  AnhVietViewController.swift
//  Dictionary
//
//  Created by admin on 22/09/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//

import UIKit

class AnhVietViewController: UIViewController {

    //let link = "https://api.tracau.vn/WBBcwnwQpV89/s/cat/en"
    
    @IBOutlet weak var txtValue: UITextField!
    @IBOutlet weak var tableViewResult: UITableView!
    var sentences:[Sentence]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewResult.dataSource = self
        txtValue.delegate = self
        
        tableViewResult.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        tableViewResult.separatorStyle = .singleLine
    }
   
    func getDataFromAPI(withURL: String, completion: @escaping (DictionaryOnline) -> ())
    {
        
        URLSession.shared.dataTask(with: URL(string: withURL)!) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            var dictOnline:DictionaryOnline?
            do {
                dictOnline = try JSONDecoder().decode(DictionaryOnline.self, from: data!)
                DispatchQueue.main.async {
                    completion(dictOnline!)
                }
            }catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    @IBAction func searchAnhVietButton(_ sender: UIButton) {
        
        guard let input = txtValue.text else {
            return
        }
        if let encodedString = input.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed){
            let link = API.API_URL + "/s/" + encodedString + "/" + Language.en.rawValue
            getDataFromAPI(withURL: link) { (dict) in
                self.sentences = dict.sentences
                self.tableViewResult.reloadData()
            }
        }
    }
    @IBAction func cancelTextFieldButton(_ sender: ADButton) {
        sentences = []
        txtValue.text = ""
        txtValue.resignFirstResponder()
        DispatchQueue.main.async {
            self.tableViewResult.reloadData()
        }
        
    }
    
}
extension AnhVietViewController:UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sentences != nil {
            return sentences!.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardConstants.resultCell, for: indexPath)
        let sentence = sentences![indexPath.row]
        
        // MARK: - Custom cell
        cell.layer.cornerRadius = 5
        let orangeColor = UIColor(red: 255/255, green: 138/255, blue: 47/255, alpha: 1.0).cgColor
        let blueColor = UIColor(red: 133/255, green: 191/255, blue: 255/255, alpha: 1.0).cgColor
        cell.layer.backgroundColor = (indexPath.row % 2 == 0) ? orangeColor : blueColor
        cell.layer.masksToBounds = true
        
        // MARK: - Custom textLabel
        cell.textLabel?.text = "en: " + sentence.fields.en.replacingOccurrences(of: "<em>", with: "").replacingOccurrences(of: "</em>", with: "")
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "Avenir-Heavy", size: 15)
        cell.textLabel?.numberOfLines = 0
        
        // MARK: - Custom detailLabel
        cell.detailTextLabel?.text = "vi: " + sentence.fields.vi
        cell.detailTextLabel?.textColor = UIColor.white
        cell.detailTextLabel?.backgroundColor = UIColor.clear
        cell.detailTextLabel?.font = UIFont(name: "Avenir-Heavy", size: 15)
        cell.detailTextLabel?.numberOfLines = 0
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
}

extension AnhVietViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
