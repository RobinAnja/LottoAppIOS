//
//  PriceBottomSheet.swift
//  iOSLottoApp
//
//  Created by Robin Fischer on 31.07.19.
//  Copyright © 2019 Robin Fischer. All rights reserved.
//

import SwiftUI

struct PriceOverviewBottomSheet: View {
    @EnvironmentObject var lottoTicket: LottoTicket
    
    var body: some View {
        VStack {
            Text("").frame(width: 50, height: 5, alignment: .center).background(Color("light_gray")).padding(.vertical, 5)
                                        
            HStack {
                Text("Gesamtpreis: ")
                Spacer()
                Text( String(self.lottoTicket.getPrice())).fontWeight(.bold).font(.system(size: 20))
            }
                        Button(action: {}) {
                            HStack {
                                Spacer()
                                Text("SCHEIN ABGEBEN")
                                                            .padding(.vertical, 10)
                                Spacer()
                            }
                        
                        }
                        .background(Color("red"))
                        .foregroundColor(Color.white)
                        .cornerRadius(7)
                        .padding(.bottom, 30)
                        HStack {
                            Text("Anzahl Tipfelder: ")
                            Spacer()
                            Text(String(self.lottoTicket.fullTipFieldCount))
                        }
                        HStack {
                            Text("Wochentag: ")
                            Spacer()
                            Text(self.lottoTicket.weekDay)
                        }
                        HStack {
                            Text("Gültigkeit: ")
                            Spacer()
                            Text(String(self.lottoTicket.duration))
                        }
        }.padding(.horizontal, 20)
    }
}

#if DEBUG
var priceOverviewBottomSheetLottoTicket = LottoTicket()

struct PriceOverviewBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        PriceOverviewBottomSheet().environmentObject(priceOverviewBottomSheetLottoTicket)
    }
}
#endif
