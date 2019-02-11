//
//  ChangeCityViewController.swift
//  Clima Earth
//
//  Created by Alex Bes on 18/01/2019.
//  Copyright (c) 2019 Alex Ltd. All rights reserved.
//

import UIKit


//Write the protocol declaration here:
protocol ChangeCityDelegate {
    func userEnteredANewCityName(city: String)
}


class ChangeCityViewController: UIViewController, UITextFieldDelegate {

    var delegate: ChangeCityDelegate?

    @IBOutlet weak var changeCityTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        changeCityTextField.delegate = self
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        changeCityTextField.resignFirstResponder()
    }

    //Called when 'return' key pressed.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)

        if (changeCityTextField.text?.isEmpty)! {
            displayMassage()
        } else {
        changeCity()
        }
        return true
    }



    @IBAction func getWeatherPressed(_ sender: AnyObject) {

        if (changeCityTextField.text?.isEmpty)! {
            displayMassage()
        } else {

        let cityName = changeCityTextField.text!

        delegate?.userEnteredANewCityName(city: cityName)
        self.dismiss(animated: true, completion: nil)
        }
    }

    

    //It dismisses the ChangeCityViewController.
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    func displayMassage() {
        let alert = UIAlertController(title: "Ooops", message: "Please enter a city name", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)

        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    func changeCity() {
        let cityName = changeCityTextField.text!

        delegate?.userEnteredANewCityName(city: cityName)
        self.dismiss(animated: true, completion: nil)
    }

    
}
