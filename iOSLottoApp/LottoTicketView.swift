//
//  ContentView.swift
//  iOSLottoApp
//
//  Created by Robin Fischer on 25.07.19.
//  Copyright © 2019 Robin Fischer. All rights reserved.
//

import SwiftUI
import Combine

struct LottoTicketView: View {
    @EnvironmentObject var lottoTicket: LottoTicket
    @State var bottomSheetHeight = CGSize(width: .infinity, height: 130.0)
    
    var body: some View {
        ZStack(alignment: .bottom) {
       ScrollView {
            VStack {
                VStack {
                    Text("Lotto 6aus49").font(.system(size: 20)).fontWeight(.bold).foregroundColor(Color("red")).padding(.top, 50).foregroundColor(Color.red)
                    TipFieldsView()
                }.background(LinearGradient(gradient: Gradient(colors: [Color("light_yellow"), Color("yellow")]), startPoint: .center, endPoint: .bottom))
                TicketNumberView().background(Color.white)
                TicketOptionsView().background(Color.white)
            }.padding(.bottom, 150)
            }
            PriceOverviewBottomSheet()
                .frame(height: self.bottomSheetHeight.height, alignment: .topLeading)
                .background(Color.white)
                .gesture(
                DragGesture()
                    .onChanged{ value in
                        let newBottomSheetHeight = self.bottomSheetHeight.height + (value.startLocation.y - value.location.y)
                        if(newBottomSheetHeight > 600){
                            self.bottomSheetHeight.height = 600
                        }else if(newBottomSheetHeight < 130){
                            self.bottomSheetHeight.height = 130
                        }else{
                            self.bottomSheetHeight.height = newBottomSheetHeight
                        }
                    }
                )
                .cornerRadius(10)
                .shadow(radius: 10)
        }.edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
let lottoTicketViewLottoTicket = LottoTicket()

struct LottoTicketView_Previews: PreviewProvider {
    static var previews: some View {
        LottoTicketView().environmentObject(lottoTicketViewLottoTicket)
    }
}
#endif
