//
//  TicketView.swift
//  PurplePumpkinHalloween
//
//  Created by Raphael Cerqueira on 12/11/20.
//

import SwiftUI

struct TicketView: View {
    @Binding var showDetails: Bool
    
    var body: some View {
        ZStack {
            Blur(style: .systemUltraThinMaterialDark).ignoresSafeArea(.all, edges: .all)
            
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    Image("p2")
                        .resizable()
                        .scaledToFit()
                        .overlay(
                            VStack(alignment: .leading) {
                                HStack {
                                    Spacer()
                                    
                                    Button(action: {
                                        withAnimation(.spring()) {
                                            showDetails.toggle()
                                        }
                                    }, label: {
                                        Image(systemName: "xmark")
                                            .resizable()
                                            .frame(width: 18, height: 18)
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(Blur(style: .systemUltraThinMaterialDark))
                                            .clipShape(Circle())
                                    })
                                }
                                .padding()
                                
                                Spacer()
                                
                                HStack {
                                    Text("Purple Pumpkin\nHalloween Weekend 🎃")
                                        .font(.system(size: 28, weight: .bold))
                                        .foregroundColor(.white)
                                        .padding(.leading)
                                    
                                    Spacer()
                                }
                                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1041709855, green: 0.1140443161, blue: 0.1138538793, alpha: 1)), Color.clear]), startPoint: .bottom, endPoint: .top))
                            }
                        )
                    
                    Text("Atendee")
                        .font(.system(size: 15))
                        .foregroundColor(.orange)
                        .padding(.top)
                        .padding(.leading)
                    
                    Text("Raphael Cerqueira")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.leading)
                        .padding(.top, 8)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Dates")
                                .font(.system(size: 15))
                                .foregroundColor(.orange)
                            
                            Text("30 - 31 Out")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.top, 8)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("Location")
                                .font(.system(size: 15))
                                .foregroundColor(.orange)
                            
                            Text("Sangre Lounge")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.top, 8)
                        }
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    
                    Spacer(minLength: 0)
                    
                    Line()
                        .stroke(style: StrokeStyle(lineWidth: 0.7, dash: [8]))
                        .foregroundColor(.gray)
                        .frame(height: 1)
                        .padding()
                    
                    Spacer(minLength: 0)
                    
                    Image("barcode")
                        .resizable()
                        .foregroundColor(Color.white.opacity(0.9))
                        .frame(height: 110)
                        .padding(.horizontal)

                    Text("2 4 3 5 4 6 5 7 7 9")
                        .font(.system(size: 14, design: .monospaced))
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 60)
                        .padding(.bottom, 30)
                }
                .background(Color(#colorLiteral(red: 0.1041709855, green: 0.1140443161, blue: 0.1138538793, alpha: 1)))
                .cornerRadius(30)
                .padding()
                .offset(y: showDetails ? (UIScreen.main.bounds.height / 2) - (geometry.size.height / 2) - geometry.safeAreaInsets.top: UIScreen.main.bounds.height)
            }
        }
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView(showDetails: .constant(true))
    }
}
