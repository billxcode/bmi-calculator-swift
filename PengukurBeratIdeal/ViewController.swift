//
//  ViewController.swift
//  PengukurBeratIdeal
//
//  Created by Bill Tanthowi Jauhari on 06/05/19.
//  Copyright © 2019 Batavia Hack Town. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tinggiSliderOutlet: UISlider!
    @IBOutlet weak var beratSliderOutlet: UISlider!
    @IBOutlet weak var hasilTinggiLabelOutlet: UILabel!
    @IBOutlet weak var hasilBeratLabelOutlet: UILabel!
    @IBOutlet weak var hasilKeseluruhanLabelOutlet: UILabel!
    @IBOutlet weak var emojiResult: UILabel!
    
    var beratSekarang: Float = 1
    var tinggiSekarang: Float = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tinggiSliderOutlet.minimumValue = 1
        tinggiSliderOutlet.maximumValue = 200
        
        beratSliderOutlet.minimumValue = 1
        beratSliderOutlet.maximumValue = 200
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeTheme(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            view.backgroundColor = .gray
        }else{
            view.backgroundColor = .white
        }

    }
    
    @IBAction func tinggiAction(_ sender: UISlider) {
        let roundedValue = round(sender.value)
        sender.value = roundedValue
       let result = String(Int(roundedValue))+" cm"
        tinggiSekarang = sender.value
        hasilTinggiLabelOutlet.text = result
        calculateBadanIdeal()
    }
    
    @IBAction func beratAction(_ sender: UISlider) {
        let roundedValue = round(sender.value)
        sender.value = roundedValue
        let result = String(Int(roundedValue))+" Kg"
        beratSekarang = sender.value
        hasilBeratLabelOutlet.text = result
        calculateBadanIdeal()
    }
    
    func calculateBadanIdeal(){
        let tinggi = Double(tinggiSekarang/100)
        let pangkatDuaTinggi = tinggi*tinggi
        let result = Double(beratSekarang)/pangkatDuaTinggi
        switch result {
        case 0...18.5:
            hasilKeseluruhanLabelOutlet.text = "Kurus"
            emojiResult.text = "😕"
            hasilKeseluruhanLabelOutlet.textColor = .blue
        case 18.5...24.9:
            hasilKeseluruhanLabelOutlet.text = "Normal"
            emojiResult.text = "😀"
            hasilKeseluruhanLabelOutlet.textColor = .green
        case 24.9...29.9:
            hasilKeseluruhanLabelOutlet.text = "Overweight"
            emojiResult.text = "😥"
            hasilKeseluruhanLabelOutlet.textColor = .yellow
        case 29.9...100:
            hasilKeseluruhanLabelOutlet.text = "Obesitas"
            emojiResult.text = "😵"
            hasilKeseluruhanLabelOutlet.textColor = .red
        default:
            hasilKeseluruhanLabelOutlet.text = "Human?"
            
        }
    }
    
}

