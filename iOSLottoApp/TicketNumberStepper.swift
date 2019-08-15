//
//  TicketNumberStepper.swift
//  iOSLottoApp
//
//  Created by Robin Fischer on 31.07.19.
//  Copyright © 2019 Robin Fischer. All rights reserved.
//

import SwiftUI

struct TicketNumberStepper: View {
    @EnvironmentObject var lottoTicket: LottoTicket
    var index: Int
    
    
    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                if(self.lottoTicket.ticketNumber[self.index] == 9){
                    self.lottoTicket.ticketNumber[self.index] = 1
                }else {
                    self.lottoTicket.ticketNumber[self.index] += 1
                }
            }, label: {
                if(self.index == 6){
                    Image("plus_red").renderingMode(.original).padding(.top, 10)
            }else {
                Image("plus_gray").renderingMode(.original).padding(.top, 10)
                }
                
            }
            )
            Text(String(self.lottoTicket.ticketNumber[index])).font(.system(size: 18)).frame(width: 10, height: 15, alignment: .center).foregroundColor(Color.white).padding(15).background(self.index == 6 ? Color("light_red") : Color("light_gray")).border(self.index == 6 ? Color("red") : Color("gray"))
            Button(action: {
                if(self.lottoTicket.ticketNumber[self.index] == 1){
                    self.lottoTicket.ticketNumber[self.index] = 9
                }else {
                    self.lottoTicket.ticketNumber[self.index] -= 1
                }
            }, label: {
                 if(self.index == 6){
                                   Image("minus_red").renderingMode(.original).padding(.bottom, 5)
                           }else {
                               Image("minus_gray").renderingMode(.original).padding(.bottom, 5)
                               }
                
            }).foregroundColor(self.index == 6 ? Color("red") : Color("gray")).padding(.bottom, 5)
        }.border(self.index == 6 ? Color("red") : Color("gray"), cornerRadius: 10)
}
}

#if DEBUG
var ticketNumberStepperLottoTicket = LottoTicket()

struct TicketNumberStepper_Previews: PreviewProvider {
    static var previews: some View {
        TicketNumberStepper(index: 6).environmentObject(ticketNumberStepperLottoTicket)
    }
}
#endif
