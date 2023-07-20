//
//  SecondPageViewController.swift
//  Game
//
//  Created by R82 on 07/01/23.
//

import UIKit

class SecondPageViewController: UIViewController {
    
    @IBOutlet weak var selectModeLabel: UILabel!
    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        
    }
    
    private func setup(){
        
        [selectModeLabel, easyButton, mediumButton, hardButton].forEach {
            setCornerRadious(view: $0, cornerRadious: 15)
            
        }
        
    }
    
    func setCornerRadious(view: UIView?, cornerRadious: CGFloat) {
        view?.layer.cornerRadius = cornerRadious
        view?.layer.masksToBounds = true
    }
    
    func setBorder(view: UIView?, color: UIColor, width: CGFloat) {
        view?.layer.borderColor = color.cgColor
        view?.layer.borderWidth = width
        
    }
    
    
    
    @IBAction func easyButtonTapped(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let easyLevalViewController: EasyLevalViewController = storyBoard.instantiateViewController(withIdentifier: "EasyLevalViewController") as! EasyLevalViewController
        navigationController?.pushViewController(easyLevalViewController, animated: true)
    }
    
    
    @IBAction func mediumButtonTapped(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let easyLevalViewController: EasyLevalViewController = storyBoard.instantiateViewController(withIdentifier: "EasyLevalViewController") as! EasyLevalViewController
        navigationController?.pushViewController(easyLevalViewController, animated: true)
        
    }
    
    @IBAction func hardButtonTapped(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let easyLevalViewController: EasyLevalViewController = storyBoard.instantiateViewController(withIdentifier: "EasyLevalViewController") as! EasyLevalViewController
        navigationController?.pushViewController(easyLevalViewController, animated: true)
        
    }
}
