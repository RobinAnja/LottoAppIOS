//
//  LottoTicketOptionsView.swift
//  iOSLottoApp
//
//  Created by Robin Fischer on 29.07.19.
//  Copyright © 2019 Robin Fischer. All rights reserved.
//

import SwiftUI
import Combine

struct TicketOptionsView: View {
    @EnvironmentObject var lottoTicket: LottoTicket
    var horizontalLength = CGFloat(20)
    var verticalLength = CGFloat(10)
    var cornrRadius =  CGFloat(7.0)
    
    var body: some View {
        VStack {
         
            AdditionalLotteriesView()
            WeekDaysView()
            TicketDurationView()
           
            VStack(alignment: .center) {
                Text("Chance ca. 1:140 Mio. Teilnahme ab 18 Jahren.").foregroundColor(Color.gray).frame(minWidth: 0, maxWidth: .infinity, alignment: .center).font(.system(size: 13))
                Text("Glückspiel kann süchtig machen. Hilfe BZgA.").foregroundColor(Color.gray).frame(minWidth: 0, maxWidth: .infinity, alignment: .center).font(.system(size: 13))
            }.padding(.top, 10)
            
        }.padding(.horizontal, 20)
    }
}

#if DEBUG
let ticketOptionsViewLottoTicket = LottoTicket()

struct TicketOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        TicketOptionsView().environmentObject(ticketOptionsViewLottoTicket)
    }
}
#endif
