//
//  ViewController.swift
//  color_matching_game
//
//  Created by Marcus Man on 29/6/2017.
//  Copyright © 2017 Marcus Man. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var shuffleArray = [Int]()
    var outletArray = [UIView]()
    var myscore = 0
    var remainTime = 10
    var clock: Timer!

    enum color:Int {
        case redColor
        case blueColor
        case greenColor
        case grayColor
        case yellowColor
        case orangeColor
        case whiteColor
        case blackColor
        case purpleColor
        case brownColor
        case magentaColor
        case cyanColor

        func uicolor() -> UIColor{
            switch self {
            case .redColor:
                return UIColor.red
            case .blueColor:
                return UIColor.blue
            case .greenColor:
                return UIColor.green
            case .grayColor:
                return UIColor.gray
            case .yellowColor:
                return UIColor.yellow
            case .orangeColor:
                return UIColor.orange
            case .whiteColor:
                return UIColor.white
            case .blackColor:
                return UIColor.black
            case .purpleColor:
                return UIColor.purple
            case .brownColor:
                return UIColor.brown
            case .magentaColor:
                return UIColor.magenta
            case .cyanColor:
                return UIColor.cyan
            }
        }
    }

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var ans_box: UIView!
    @IBOutlet weak var box_1: UIView!
    @IBOutlet weak var box_2: UIView!
    @IBOutlet weak var box_3: UIView!
    @IBOutlet weak var box_4: UIView!
    @IBOutlet weak var box_5: UIView!
    @IBOutlet weak var box_6: UIView!
    @IBOutlet weak var box_7: UIView!
    @IBOutlet weak var box_8: UIView!
    @IBOutlet weak var box_9: UIView!
    @IBOutlet var topView: UIView!

    @IBAction func startGame(_ sender: Any) {
        topView.isHidden = true
        myscore = 0
        remainTime = 10
        time.text = "\(remainTime)"

        clock = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(endGame), userInfo: nil, repeats: true)

        shuffle()

    }
    @IBAction func box_1_tap(_ sender: UITapGestureRecognizer) {
        checking(boxTriger: box_1)
    }
    @IBAction func box_2_tap(_ sender: UITapGestureRecognizer) {
        checking(boxTriger: box_2)
    }
    @IBAction func box_3_tap(_ sender: UITapGestureRecognizer) {
        checking(boxTriger: box_3)
    }
    @IBAction func box_4_tap(_ sender: UITapGestureRecognizer) {
        checking(boxTriger: box_4)
    }
    @IBAction func box_5_tap(_ sender: UITapGestureRecognizer) {
        checking(boxTriger: box_5)
    }
    @IBAction func box_6_tap(_ sender: UITapGestureRecognizer) {
        checking(boxTriger: box_6)
    }
    @IBAction func box_7_tap(_ sender: UITapGestureRecognizer) {
        checking(boxTriger: box_7)
    }
    @IBAction func box_8_tap(_ sender: UITapGestureRecognizer) {
        checking(boxTriger: box_8)
    }
    @IBAction func box_9_tap(_ sender: UITapGestureRecognizer) {
        checking(boxTriger: box_9)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleArray = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
        outletArray.append(box_1)
        outletArray.append(box_2)
        outletArray.append(box_3)
        outletArray.append(box_4)
        outletArray.append(box_5)
        outletArray.append(box_6)
        outletArray.append(box_7)
        outletArray.append(box_8)
        outletArray.append(box_9)
    }

    func shuffle(){

        for i in 0..<shuffleArray.count {
            let remainingCount = shuffleArray.count - i
            let exchangeIndex = Int(arc4random_uniform(UInt32(remainingCount))) + i
            let tempt = shuffleArray[i]
            shuffleArray[i] = shuffleArray[exchangeIndex]
            shuffleArray[exchangeIndex] = tempt
        }

        //assign
        for (index, value) in outletArray.enumerated() {
            value.backgroundColor = color(rawValue: shuffleArray[index])!.uicolor()
        }
        let randAns = Int(arc4random_uniform(9))
        ans_box.backgroundColor = outletArray[randAns].backgroundColor
    }

    func checking(boxTriger: UIView){

        if ans_box.backgroundColor == boxTriger.backgroundColor{
            //addScore
            myscore += 10
            score.text = "\(myscore)"
            shuffle()
        }
    }

    func endGame(){
        remainTime -= 1
        time.text = "\(remainTime)"
        if(remainTime == 0){
            clock.invalidate()
            topView.isHidden = false
        }
    }


}

