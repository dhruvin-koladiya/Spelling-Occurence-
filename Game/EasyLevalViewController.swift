//
//  EasyLevalViewController.swift
//  Game
//
//  Created by R82 on 09/01/23.
//

import UIKit

struct Numbers {
    var id: Int
}

struct Questions {
    var name: String
    var number: Int
}


class EasyLevalViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var gamePageCollectionViewCell: UICollectionView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet  weak var timerProgressView: UIProgressView!
    
    // MARK: - Variable
    var array: [String] = ["Bus", "Travel", "Bus", "abd", "hgd", "man", "Lab", "Travel", "abd", "man", "bus", "man" ]
    var Score =  0
    var timerCount: Double = 7
    var timer = Timer ()
    var answer = 0
    var currentQuestion: Questions?
    var questionPosition = 0
    var arrNumbers =  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    var question: [Questions] = [Questions(name: "Bus", number: 0),
                                 Questions( name: "Car", number: 0),
                                 Questions( name: "Bus", number: 0),
                                 Questions( name: "Travel", number: 0),
                                 Questions( name: "Car", number: 1),
                                 Questions( name: "Word", number: 0),
                                 Questions( name: "Bus", number: 1),
                                 Questions( name: "Bus", number: 2),
                                 Questions( name: "Car", number: 2),
                                 Questions( name: "Word", number: 1),
                                 Questions( name: "Car", number: 3),
                                 Questions( name: "Bus", number: 3),
                                 Questions( name: "Bus", number: 4),
                                 Questions( name: "Word", number: 2),
                                 Questions( name: "Bus", number: 5),
                                 Questions( name: "Car", number: 4),
                                 Questions( name: "Word", number: 3),
                                 Questions( name: "Sleep", number: 0),
                                 Questions( name: "Out", number: 0),
                                 Questions( name: "Night", number: 0),
                                 Questions( name: "Word", number: 4)]
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    // MARK: - Initialization
    private func setup() {
        progress()
        loadNextQuestions()
        Score = 0
        pointLabel.text = "\(Score)"
        configureCollectionView()
        [pointLabel].forEach {
            setBorder(view: $0, color: .red, width: 1)
            setCornerRadious(view: $0, cornerRadious: 10)
        }
    }
    
    private func scoreCount() {
        Score = Score + 1
        pointLabel.text = "\(Score)"
        progress()
    }
    
    private func loadNextQuestions() {
        if questionPosition + 1 <= question.count {
            questionPosition += 1
            currentQuestion = question[questionPosition]
            setQuestions()
        }
    }
    
    private  func setQuestions() {
        nameLabel.text = currentQuestion?.name
    }
    
    private func progress() {
        timer.invalidate()
        var randomTime: Float  = 1.0
        self.timerProgressView.progress = randomTime
        timer = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true, block: {(_)in
            randomTime -= 0.02
            self.timerProgressView.progress = randomTime
            if self.timerProgressView.progress == 0.0 {
                self.displayAlert()
                self.timer.invalidate()
            }
        })
    }
    
    func setCornerRadious(view: UIView?, cornerRadious: CGFloat) {
        view?.layer.cornerRadius = cornerRadious
        view?.layer.masksToBounds = true
    }
    
    func setBorder(view: UIView?, color: UIColor, width: CGFloat) {
        view?.layer.borderColor = color.cgColor
        view?.layer.borderWidth = width
    }
    
    private func alertNavigation(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController2: SecondPageViewController = storyBoard.instantiateViewController(identifier: "SecondPageViewController")
        navigationController?.popViewController(animated: true)
    }
    
    
    private func displayAlert(){
        
        let alert: UIAlertController = UIAlertController(title: "Game Over", message: "Score : \(Score)\n High Score : \(Score)", preferredStyle: .alert)
        let playAgainButton: UIAlertAction = UIAlertAction(title: "Play Again", style: .default){ _ in
            self.restartGame()
        }
        alert.addAction(playAgainButton)
        
        let homeButton: UIAlertAction = UIAlertAction(title: "Home", style: .default){ _ in
            self.alertNavigation()
            self.Score = 0
        }
        alert.addAction(homeButton)
        present(alert, animated: true)
    }
    
    private func restartGame() {
        Score = 0
        questionPosition = 0
        loadNextQuestions()
        progress()
        gamePageCollectionViewCell.reloadData()
        pointLabel.text = "\(Score)"
        nameLabel.text = currentQuestion?.name
    }
    
    private func configureCollectionView() {
        let nibFile: UINib = UINib(nibName: "GamePageCollectionViewCell", bundle: nil)
        gamePageCollectionViewCell.register(nibFile, forCellWithReuseIdentifier: "GamePageCollectionViewCell")
    }
}

// MARK: - Get Home Page Details

extension EasyLevalViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrNumbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: GamePageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GamePageCollectionViewCell", for: indexPath)as! GamePageCollectionViewCell
        let Numbers = arrNumbers[indexPath.row]
        cell.numberLabel.text = "\(Numbers)"
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.red.cgColor
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if currentQuestion?.number != arrNumbers[indexPath.row] {
            displayAlert()
        }
        scoreCount()
        loadNextQuestions()
        progress()
        gamePageCollectionViewCell.reloadData()
    }
}

extension EasyLevalViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}



