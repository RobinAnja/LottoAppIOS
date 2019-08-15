//
//  AdditionalLotteriesView.swift
//  iOSLottoApp
//
//  Created by Robin Fischer on 02.08.19.
//  Copyright © 2019 Robin Fischer. All rights reserved.
//

import SwiftUI

struct AdditionalLotteriesView: View {
    @EnvironmentObject var lottoTicket: LottoTicket
    
    var body: some View {
                    VStack {
        Text("ZUSATZLOTTERIEN").fontWeight(.bold).foregroundColor(Color("text")).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top, 20)
        Toggle(isOn: $lottoTicket.spiel77Selected) {
            Text("Spiel 77").fontWeight(.bold).foregroundColor(Color("spiel77"))
        }
        Toggle(isOn: $lottoTicket.super6Selected) {
            Text("Super 6").fontWeight(.bold).foregroundColor(Color("super6"))
        }
        Toggle(isOn: $lottoTicket.glueckSpiraleSelected) {
            Text("Glückspirale").fontWeight(.bold)
        }
        Toggle(isOn: $lottoTicket.siegerChanceSelected) {
            Text("SiegerChance").fontWeight(.bold)
        }
        
    }
}
}

#if DEBU
var additionalLotteriesViewLottoTicket = LottoTicket()

struct AdditionalLotteriesView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionalLotteriesView().environmentObject(additionalLotteriesViewLottoTicket)
    }
}
#endif
