//
//  FirstPageViewController.swift
//  Game
//
//  Created by R82 on 07/01/23.
//

import UIKit

class FirstPageViewController: UIViewController {
    
    
    @IBOutlet weak var PlayButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        // Do any additional setup after loading the view.
    }
    
    private func setup() {
        
        [PlayButton].forEach {
            setBorder(view: $0, color: .green, width: 2)
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
    
    
    
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let secondPageViewController: SecondPageViewController = storyBoard.instantiateViewController(withIdentifier: "SecondPageViewController") as! SecondPageViewController
        navigationController?.pushViewController(secondPageViewController, animated: true)
        
    }
    
}
