//
//  LottoTicket.swift
//  iOSLottoApp
//
//  Created by Robin Fischer on 29.07.19.
//  Copyright © 2019 Robin Fischer. All rights reserved.
//

import SwiftUI
import Combine

class LottoTicket: BindableObject {
        
        var willChange = PassthroughSubject<Void, Never>()
        let _servicePrice = 0.2
        
        var tipFields = LottoTipFields() {
            didSet {
                willChange.send()
                updatePrice()
            }
        }
    
        func getPrice() -> String{
            var priceString = String(_price)
            priceString = priceString.replacingOccurrences(of: ".", with: ",")
            return priceString + "0 €"
        }
        
        var ticketNumber =  [1,2,3,4,5,6,7] {
            didSet {
                willChange.send()
            }
        }
        
        var spiel77Selected = false {
            didSet {
                willChange.send()
                updatePrice()
            }
        }
        
        var super6Selected = false {
            didSet {
                willChange.send()
                updatePrice()
            }
        }
        
        var glueckSpiraleSelected = false {
            didSet {
                willChange.send()
                
                if self.siegerChanceSelected && !self.glueckSpiraleSelected {
                    self.siegerChanceSelected = false
                }
                updatePrice()
            }
        }
        
        var siegerChanceSelected = false{
            didSet {
                willChange.send()
                
                if self.siegerChanceSelected && !self.glueckSpiraleSelected {
                    self.glueckSpiraleSelected = true
                }
                updatePrice()
            }
        }

        var weekDay = "Mittwoch" {
            didSet {
                willChange.send()
                updatePrice()
            }
        }

        var duration = 1 {
            didSet {
                willChange.send()
                updatePrice()
            }
        }
    
        var _price = 0.0 {
            didSet {
                willChange.send()
            }
        }
    
    var fullTipFieldCount = 0 {
        didSet{
            willChange.send()
        }
    }
    
    func generateRandomNumbers(tipFieldIndex: Int, cardCount: Int){
        let maxCardIndex = (tipFieldIndex + cardCount) > 14 ? 14 : (tipFieldIndex + cardCount)
        for cardIndex in tipFieldIndex...(maxCardIndex - 1) {
            var indexArray = [Int]()
            var randomIndex: Int
            var maxRandom = 48
            for i in 0 ... 48 {
                indexArray.append(i)
            }
            
            self.tipFields.tipFields[cardIndex].lottoNumbers = []
            for _ in 0...5 {
                randomIndex = Int.random(in: 0..<maxRandom)
                self.tipFields.tipFields[cardIndex].lottoNumbers.append(indexArray[randomIndex])
                indexArray.remove(at: randomIndex)
                maxRandom -= 1
            }
            self.tipFields.tipFields[cardIndex].isFull = true
        }
    }
    
    func removeNumbers(tipFieldIndex: Int) {
        self.tipFields.tipFields[tipFieldIndex].lottoNumbers = []
        self.tipFields.tipFields[tipFieldIndex].isFull = false
    }
    
    func actionOnNumber(number: Int, index: Int){
        if (self.tipFields.tipFields[index].lottoNumbers.contains(number)){
            self.tipFields.tipFields[index].lottoNumbers.remove(at: self.tipFields.tipFields[index].lottoNumbers.firstIndex(of: number)!)
            self.tipFields.tipFields[index].isFull = false
        }else {
            if(self.tipFields.tipFields[index].lottoNumbers.count < 6){
                self.tipFields.tipFields[index].lottoNumbers.append(number)
            }
            if(self.tipFields.tipFields[index].lottoNumbers.count == 6){
                self.tipFields.tipFields[index].isFull = true
            }
                
        }
    }
    

    func updatePrice() {
        var tmpPrice = 0.0
        
        for tipField in tipFields.tipFields {
            if tipField.isFull {
                tmpPrice += 1
            }
        }
        
        fullTipFieldCount = Int(tmpPrice)
        
        if(tmpPrice > 0){
            if(weekDay == "Mi. und Sa."){
                tmpPrice = tmpPrice * 2
            }
            tmpPrice = tmpPrice * Double(duration)
            tmpPrice += _servicePrice
            
            if(spiel77Selected){
                tmpPrice += 5
            }
            if(super6Selected){
                tmpPrice += 2.5
            }
            if(glueckSpiraleSelected){
                tmpPrice += 5
            }
            if(siegerChanceSelected){
                tmpPrice += 3
            }
            
        }
        
        _price = tmpPrice
    }
        
    }

struct LottoTipFields {
    var tipFields = [ LottoTipField(index: 0), LottoTipField(index: 1), LottoTipField(index: 2), LottoTipField(index: 3), LottoTipField(index: 4), LottoTipField(index: 5), LottoTipField(index: 6), LottoTipField(index: 7), LottoTipField(index: 8), LottoTipField(index: 9), LottoTipField(index: 10), LottoTipField(index: 11), LottoTipField(index: 12), LottoTipField(index: 13)]

}

struct LottoTipField {
    var _isFull = false
    var lottoNumbers: [Int] = []
    var index: Int

    var isFull: Bool {
        set {
            _isFull = newValue
        }
        get {
            return _isFull
        }
    }
}
