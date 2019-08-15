//
//  LottoTipfieldsView.swift
//  iOSLottoApp
//
//  Created by Robin Fischer on 29.07.19.
//  Copyright © 2019 Robin Fischer. All rights reserved.
//

import SwiftUI
import UIKit

struct TipFieldsView: View {
    @EnvironmentObject var lottoTicket: LottoTicket
    
    var body: some View {
        /*
                PageView([SingleTipFieldView(index: 0), SingleTipFieldView(index: 1), SingleTipFieldView(index: 2)])
            
        */
        
        ScrollView(.horizontal, showsIndicators: true){
            HStack {
                ForEach(0..<self.lottoTicket.tipFields.tipFields.count) { index in
                        SingleTipFieldView(index: index).background(Color.white).cornerRadius(10).shadow(radius: 3)
                }.padding(.top, 10).padding(.bottom, 30).padding(.horizontal, 40)
                
            }
        }
    }
}

#if DEBUG
let tipFieldsViewLottoTicket = LottoTicket()

struct TipFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        TipFieldsView().environmentObject(tipFieldsViewLottoTicket)
    }
}
#endif
