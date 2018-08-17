//
//  ViewController.swift
//  class1_2017
//
//  Created by 魏品軒 on 2018/6/22.
//  Copyright © 2018年 魏品軒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    // 記錄翻了幾次卡牌
    var flipCount = 0 {
        didSet{
            // 觀察 一但有翻牌（flipCount變化）就更新顯示的數量
            flipCountLabel.text = "Flips : \(flipCount)"
        }
    }
    
    // 紀錄比較值（注意牌面上已經有值存在，被背景顏色蓋過去）
    var emojiChoices = ["🇹🇼","🇯🇵","🇹🇼","🇯🇵"]
    
    // MARK: - IBOutlet
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    // MARK: - IBAction
    // sender表示哪個按鈕被按
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        // cardNumber有可能為空 故使用if let，將被按的cardButtons的index指定給cardNumber
        if let cardNumber = cardButtons.index(of: sender){
            flipCard(withEmoji: "\(emojiChoices[cardNumber])", on: sender)
        }else{
            print("87")
        }
    }
    
    // MARK: - Public
    // 規則：被按按鈕得值是否跟emojiChoices一樣，一樣就覆蓋，不一樣就翻開，此處只是處理翻牌動作
    func flipCard(withEmoji emoji: String,on button: UIButton){
        if button.currentTitle == emoji{
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }else{
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
    }
    
}

