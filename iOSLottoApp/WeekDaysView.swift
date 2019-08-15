//
//  WeekDaysView.swift
//  iOSLottoApp
//
//  Created by Robin Fischer on 02.08.19.
//  Copyright © 2019 Robin Fischer. All rights reserved.
//

import SwiftUI

struct WeekDaysView: View {
    @EnvironmentObject var lottoTicket: LottoTicket
    
    var body: some View {
        
        VStack {
            Text("WOCHENTAG").fontWeight(.bold).foregroundColor(Color("text")).padding(.top, 10).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
            HStack {
                    
                        Button(action: { self.lottoTicket.weekDay = "Mittwoch" }, label: { Text("Mittwoch")
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)})
                            .foregroundColor(self.lottoTicket.weekDay == "Mittwoch" ? Color.white : Color("red"))
                            .background(self.lottoTicket.weekDay == "Mittwoch" ? Color("red") : Color.white)
                            .cornerRadius(5)
                            .border(Color("red"), width: 1, cornerRadius: 5)
                        
                        Spacer()
                
                        Button(action: { self.lottoTicket.weekDay = "Samstag" }, label: { Text("Samstag")
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)}).foregroundColor(self.lottoTicket.weekDay == "Samstag" ? Color.white : Color("red"))
                            .background(self.lottoTicket.weekDay == "Samstag" ? Color("red") : Color.white)
                            .cornerRadius(5)
                            .border(Color("red"), width: 1, cornerRadius: 5)
                        
                        Spacer()
                
                        Button(action: { self.lottoTicket.weekDay = "Mi. und Sa." }, label: { Text("Mi. und Sa.")
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)})
                            .foregroundColor(self.lottoTicket.weekDay == "Mi. und Sa."  ? Color.white : Color("red"))
                            .background(self.lottoTicket.weekDay == "Mi. und Sa."  ? Color("red") : Color.white)
                            .cornerRadius(5)
                            .border(Color("red"), width: 1, cornerRadius: 5)
                    }
        }
        
    }
}

#if DEBUG
var weekDaysViewLottoTicket = LottoTicket()
struct WeekDaysView_Previews: PreviewProvider {
    static var previews: some View {
        WeekDaysView().environmentObject(weekDaysViewLottoTicket)
    }
}
#endif
