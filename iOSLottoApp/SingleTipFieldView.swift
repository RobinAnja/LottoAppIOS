//
//  LottoTipFieldView.swift
//  iOSLottoApp
//
//  Created by Robin Fischer on 30.07.19.
//  Copyright © 2019 Robin Fischer. All rights reserved.
//

import SwiftUI
import UIKit

struct SingleTipFieldView: View {
    @EnvironmentObject var lottoTicket: LottoTicket
    var index: Int
    let numbers = 1...49

    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<7){ rowIndex in
                HStack(spacing: 0) {
                    ForEach(1..<8) { columnIndex in
                        SingleTipFieldCellView(number: (rowIndex * 7) + columnIndex, tipFieldIndex: self.index)
                    }
                }
            }
            HStack {
                
                Button(action: {
                    self.lottoTicket.removeNumbers(tipFieldIndex: self.index)
                }, label: {
                    Image("garbage").renderingMode(.original)
                }).padding(.horizontal, 5)
                
                Button(action: {
                    self.lottoTicket.generateRandomNumbers(tipFieldIndex: self.index, cardCount: 1)
                }, label: {
                    Image("dices").renderingMode(.original)
                }).padding(.horizontal, 5)
                
                Spacer()
                
                Button(action: {
                    self.lottoTicket.generateRandomNumbers(tipFieldIndex: self.index, cardCount: 1)
                 }, label: {
                     Text("+1").foregroundColor(Color("text"))
                 }).padding(.horizontal, 5)
                 Button(action: {
                     self.lottoTicket.generateRandomNumbers(tipFieldIndex: self.index, cardCount: 4)
                 }, label: {
                     Text("+4").foregroundColor(Color("text"))
                 }).padding(.horizontal, 5)
                Button(action: {
                     self.lottoTicket.generateRandomNumbers(tipFieldIndex: self.index, cardCount: 8)
                 }, label: {
                     Text("+8").foregroundColor(Color("text"))
                 }).padding(.horizontal, 5)
                 Button(action: {
                     self.lottoTicket.generateRandomNumbers(tipFieldIndex: self.index, cardCount: 14)
                 }, label: {
                     Text("+14").foregroundColor(Color("text"))
                 }).padding(.horizontal, 5)
            }.padding(.vertical, 10)
        }.padding(.top, 20).padding(.horizontal, 20).background(Color.white).cornerRadius(7)
        }
    
    
}




#if DEBUG
var singleTipFieldViewLottoTicket = LottoTicket()

struct SingleTipFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SingleTipFieldView(index: 0).environmentObject(singleTipFieldViewLottoTicket)
    }
}
#endif
