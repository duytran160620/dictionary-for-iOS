//
//  VocabularyViewController.swift
//  Dictionary
//
//  Created by admin on 30/09/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//

import UIKit

class VocabularyViewController: UIViewController {

    @IBOutlet weak var vocabularyTableView: UITableView!
    var selectedIndex:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        vocabularyTableView.delegate = self
        vocabularyTableView.dataSource = self
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.5)
    }
    
    @IBAction func dismissVC(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension VocabularyViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedIndex = indexPath.row
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: StoryboardConstants.segueDetailVocabulary, sender: "Từ vựng Oxford")
            break
        case 1:
            self.performSegue(withIdentifier: StoryboardConstants.segueDetailVocabulary, sender: "Từ vựng TOEIC")
            break
        case 2:
            self.performSegue(withIdentifier: StoryboardConstants.segueDetailVocabulary, sender: "Động từ bất quy tắc")
            break
        default:
            break
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
}

extension VocabularyViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardConstants.vocabularyCell, for: indexPath) as! VocabularyTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.labelVocabulary.text = "Từ vựng Oxford"
            break
        case 1:
            cell.labelVocabulary.text = "Từ vựng TOEIC"
            break
        case 2:
            cell.labelVocabulary.text = "Động từ bất quy tắc"
            break
        default:
            break
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let titleBar = sender as? String
        let vc = segue.destination as? DetailVocabularyViewController
        if titleBar == "Từ vựng Oxford" {
            vc?.tieude = titleBar
            vc?.index = selectedIndex
            FileHelper.readFileOxfordVocabularyJSON(nameFile: "OxfordVocabulary") { (oxford) in
                vc?.oxfordArray = oxford
            }
        }else if titleBar == "Từ vựng TOEIC"{
            vc?.tieude = titleBar
            vc?.index = selectedIndex
            FileHelper.readFileTOEICVocabularyJSON(nameFile: "TOEICVocabulary") { (toeic) in
                vc?.toeicArray = toeic
            }
        }
        else if titleBar == "Động từ bất quy tắc"{
            vc?.tieude = titleBar
            vc?.index = selectedIndex
            FileHelper.readFileIrregularVerbsJSON(nameFile: "IrregularVerbs") { (irregular) in
                vc?.irregularArray = irregular
            }
        }
    }
    
    
}
