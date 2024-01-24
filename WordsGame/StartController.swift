//
//  StartController.swift
//  WordsGame
//
//  Created by Rakshanda Alaskarova on 21.01.24.
//

import UIKit

class StartController: UIViewController {
    
    @IBOutlet weak var bigWordTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var secondNameTF: UITextField!
    @IBOutlet weak var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        [bigWordTF, firstNameTF, secondNameTF, startButton ].forEach { view in
            view?.layer.cornerRadius = 12
        }
    }
    
    @IBAction func startTap(_ sender: UIButton) {
        guard let bigWord = bigWordTF.text else {
            print("Длинное слово не создано")
            return
        }
        guard bigWord.count >= 8 else {
            print("Длинное слово короткое")
            return
        }
        
        for char in bigWord {
            guard char.isCased else {
                print("Все символы должны быть буквами")
                return
            }
        }
        
        guard var name1 = firstNameTF.text,
              var name2 = secondNameTF.text else {
            return
        }
        
        if name1.isEmpty {name1 = "Игрок 1"}
        if name2.isEmpty {name2 = "Игрок 2"}
        
        performSegue(withIdentifier: "toGameVC", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toGameVC":
            guard let destVC = segue.destination as? GameVC else {return}
            destVC.bigWord = self.bigWordTF.text ?? "fig you"
        default: break
        }
    }
}

