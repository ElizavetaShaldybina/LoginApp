//
//  ElizavetaViewController.swift
//  LoginApp
//
//  Created by Елизавета Шалдыбина on 10.10.2023.
//  Copyright © 2023 Alexey Efimov. All rights reserved.
//

import UIKit

final class ElizavetaViewController: UIViewController {
    @IBOutlet weak var myPhoto: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var studyLabel: UILabel!
    @IBOutlet weak var specialityLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    
    var userTwo: User!
    
    private let primaryColor = UIColor(
        red: 69/255,
        green: 50/255,
        blue: 46/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 188/255,
        green: 152/255,
        blue: 126/255,
        alpha: 1
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(userTwo.answers.name) \(userTwo.answers.surname)"
        
        nameLabel.text = userTwo.answers.name
        surnameLabel.text = userTwo.answers.surname
        cityLabel.text = userTwo.answers.city
        studyLabel.text = userTwo.answers.study
        specialityLabel.text = userTwo.answers.speciality
        languagesLabel.text = userTwo.answers.languages
        myPhoto.image = userTwo.image
        
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
    }
    
    override func viewWillLayoutSubviews() {
        myPhoto.layer.cornerRadius =
        myPhoto.frame.width / 2
        myPhoto.clipsToBounds = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? BiografiaViewController else { return }
        settingsVC.userThree = userTwo
    }
}
