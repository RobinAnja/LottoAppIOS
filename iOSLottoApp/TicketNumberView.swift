//
//  TicketNumberView.swift
//  iOSLottoApp
//
//  Created by Robin Fischer on 29.07.19.
//  Copyright © 2019 Robin Fischer. All rights reserved.
//

import SwiftUI

struct TicketNumberView: View {
    @EnvironmentObject var lottoTicket: LottoTicket
    
    var body: some View {
        VStack {
            HStack {
                Text("LOSNUMMER").fontWeight(.bold).foregroundColor(Color("text"))
                Spacer()
                Button(action: {
                        for index in 0...6{
                        self.lottoTicket.ticketNumber[index] = Int.random(in: 1..<10)
                    }
                }
                    , label: {
                        Image("dices").renderingMode(.original)
                })
            }.padding(.vertical, 5)
            HStack {
               ForEach(0..<6){ index in
                    TicketNumberStepper(index: index)
                    Spacer()
                }
                TicketNumberStepper(index: 6)
            }
        
        }.padding(.horizontal, 20)
    }
}

#if DEBUG
var ticketNumberViewLottoTicket = LottoTicket()

struct TicketNumberView_Previews: PreviewProvider {
    static var previews: some View {
        TicketNumberView().environmentObject(ticketNumberViewLottoTicket)
    }
}
#endif
