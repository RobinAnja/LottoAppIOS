//
//  LottoTipFieldCellView.swift
//  iOSLottoApp
//
//  Created by Robin Fischer on 30.07.19.
//  Copyright © 2019 Robin Fischer. All rights reserved.
//

import SwiftUI

struct SingleTipFieldCellView: View {
    @EnvironmentObject var lottoTicket: LottoTicket
    
    let number: Int
    let tipFieldIndex: Int
    
    var body: some View {
        
        Text(String(self.number)).foregroundColor(Color("text")).overlay(
            Image("x")
                .renderingMode(.original)
                .frame(width: 40, height: 40, alignment: .center)
                .opacity(self.lottoTicket.tipFields.tipFields[self.tipFieldIndex].lottoNumbers.contains(self.number) ? 1 : 0)
                .overlay(Text(String(self.number)).font(.system(size: 15))
                    .opacity(self.lottoTicket.tipFields.tipFields[self.tipFieldIndex].lottoNumbers.contains(self.number) ? 1 : 0)
                    .foregroundColor(Color.white), alignment: .center)).font(.system(size: 15))
            .frame(width: 40, height: 40, alignment: .center).border(Color("text"), width: 0.5).foregroundColor(Color.gray)
            .gesture(
                TapGesture()
                    .onEnded{
                        self.lottoTicket.actionOnNumber(number: self.number, index: self.tipFieldIndex)
                    }
            )
    }
}



#if DEBUG
var singleTipFieldCellViewLottoTicket = LottoTicket()

struct SingleTipFieldCellView_Previews: PreviewProvider {
    static var previews: some View {
        SingleTipFieldCellView(number: 1, tipFieldIndex: 0).environmentObject(singleTipFieldCellViewLottoTicket)
    }
}
#endif
