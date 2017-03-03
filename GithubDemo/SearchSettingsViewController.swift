//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Sandeep Raghunandhan on 3/2/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SearchSettingsViewController: UIViewController {
    weak var delegate: SettingsPresentingViewControllerDelegate?

    var settings: GithubRepoSearchSettings!
    
    @IBOutlet weak var starCount: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        starCount.text = "\(settings!.minStars)"
        slider.value = Float(settings!.minStars)
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        self.delegate?.didSaveSettings(settings: settings!)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.delegate?.didCancelSettings()
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        settings!.minStars = Int(sender.value)
        starCount.text = "\(settings!.minStars)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol SettingsPresentingViewControllerDelegate: class {
    func didSaveSettings(settings: GithubRepoSearchSettings)
    func didCancelSettings()
}
