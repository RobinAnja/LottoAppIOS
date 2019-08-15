//
//  TicketDurationView.swift
//  iOSLottoApp
//
//  Created by Robin Fischer on 02.08.19.
//  Copyright © 2019 Robin Fischer. All rights reserved.
//

import SwiftUI

struct TicketDurationView: View {
    @EnvironmentObject var lottoTicket: LottoTicket
    
    var body: some View {
        VStack {
            
            Text("WOCHENLAUFZEIT").fontWeight(.bold).foregroundColor(Color("text")).padding(.top, 10).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    
            HStack(spacing: 8) {
 
                                    Button(action: { self.lottoTicket.duration = 1 }, label: { Text("1")
                                        .padding(.horizontal, 23)
                                        .padding(.vertical, 8)})
                                        .foregroundColor(self.lottoTicket.duration == 1 ? Color.white : Color("red"))
                                        .background(self.lottoTicket.duration == 1  ? Color("red") : Color.white)
                                        .cornerRadius(10)
                                        .border(Color("red"), width: 1, cornerRadius: 10)
                                    
                                    Button(action: { self.lottoTicket.duration = 2 }, label: { Text("2")
                                        .padding(.horizontal, 23)
                                        .padding(.vertical, 8)})
                                        .foregroundColor(self.lottoTicket.duration == 2 ? Color.white : Color("red"))
                                        .background(self.lottoTicket.duration == 2  ? Color("red"): Color.white)
                                        .cornerRadius(10)
                                        .border(Color("red"), width: 1, cornerRadius: 10)
                                    
                                    Button(action: { self.lottoTicket.duration = 3 }, label: { Text("3")
                                        .padding(.horizontal, 23)
                                        .padding(.vertical, 8)})
                                        .foregroundColor(self.lottoTicket.duration == 3 ? Color.white : Color("red"))
                                        .background(self.lottoTicket.duration == 3  ? Color("red") : Color.white)
                                        .cornerRadius(10)
                                        .border(Color("red"), width: 1, cornerRadius: 10)
                                    
                                    Button(action: { self.lottoTicket.duration = 4 }, label: { Text("4")
                                        .padding(.horizontal, 23)
                                        .padding(.vertical, 8)})
                                        .foregroundColor(self.lottoTicket.duration == 4 ? Color.white : Color("red"))
                                        .background(self.lottoTicket.duration == 4  ? Color("red") : Color.white)
                                        .cornerRadius(10)
                                        .border(Color("red"), width: 1, cornerRadius: 10)
                                    
                                    Button(action: { self.lottoTicket.duration = 5 }, label: { Text("5")
                                        .padding(.horizontal, 23)
                                        .padding(.vertical, 8)})
                                        .foregroundColor(self.lottoTicket.duration == 5 ? Color.white : Color("red"))
                                        .background(self.lottoTicket.duration == 5  ? Color("red") : Color.white)
                                        .cornerRadius(10)
                                        .border(Color("red"), width: 1, cornerRadius: 10)
                                    
                                    Button(action: { self.lottoTicket.duration = 8 }, label: { Text("8")
                                        .padding(.horizontal, 23)
                                        .padding(.vertical, 8)})
                                        .foregroundColor(self.lottoTicket.duration == 8 ? Color.white : Color("red"))
                                        .background(self.lottoTicket.duration == 8  ? Color("red") : Color.white)
                                        .cornerRadius(10)
                                        .border(Color("red"), width: 1, cornerRadius: 10)
                                }
        }
        
    }
}

#if DEBUG
var ticketDurationViewLottoTicket = LottoTicket()

struct TicketDurationView_Previews: PreviewProvider {
    static var previews: some View {
        TicketDurationView().environmentObject(ticketDurationViewLottoTicket)
    }
}
#endif
