//
//  HomeView.swift
//  PurplePumpkinHalloween
//
//  Created by Raphael Cerqueira on 10/11/20.
//

import SwiftUI

struct HomeView: View {
    let topPadding = UIApplication.shared.windows.first?.safeAreaInsets.top
    let blurEffect = Blur(style: .systemUltraThinMaterialDark)
    
    @State var currentPage: Int = 0
    @Binding var showDetails: Bool
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1041709855, green: 0.1140443161, blue: 0.1138538793, alpha: 1)).ignoresSafeArea(.all, edges: .bottom)
            
            VStack(alignment: .leading) {
                PageViewController(
                    viewControllers: [
                        UIHostingController(rootView: PageView(image: "p1")),
                        UIHostingController(rootView: PageView(image: "p1")),
                        UIHostingController(rootView: PageView(image: "p1"))
                    ], currentPage: $currentPage)
                    .overlay(
                        VStack(alignment: .leading) {
                            HStack {
                                Button(action: {}, label: {
                                    Image(systemName: "arrow.left")
                                        .resizable()
                                        .frame(width: 18, height: 18)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(blurEffect)
                                        .clipShape(Circle())
                                })
                                
                                Spacer()
                                
                                Button(action: {}, label: {
                                    Image(systemName: "heart")
                                        .resizable()
                                        .frame(width: 18, height: 18)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(blurEffect)
                                        .clipShape(Circle())
                                })
                            }
                            .padding(.top, 44)
                            .padding(.horizontal)
                            
                            Spacer()
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    PageControl(numberOfPages: 3, currentPage: $currentPage)
                                        .frame(width: 40)
                                    
                                    Text("Purple Pumpkin\nHalloween Weekend 🎃")
                                        .font(.system(size: 32, weight: .bold))
                                        .foregroundColor(.white)
                                    
                                    Text("30 - 31 Oct Sangre Lounge")
                                        .font(.system(size: 17))
                                        .foregroundColor(.orange)
                                        .padding(.top, 8)
                                }
                                .padding(.leading)
                                
                                Spacer()
                            }
                            .padding(.bottom)
                            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1041709855, green: 0.1140443161, blue: 0.1138538793, alpha: 1)), Color(#colorLiteral(red: 0.1041709855, green: 0.1140443161, blue: 0.1138538793, alpha: 1)), Color.clear]), startPoint: .bottom, endPoint: .top))
                        }
                    )
                    .background(Color(#colorLiteral(red: 0.1041709855, green: 0.1140443161, blue: 0.1138538793, alpha: 1)))
                
                Text("Event Details")
                    .font(.system(size: 19, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.leading)
                
                ZStack(alignment: .bottom) {
                    ScrollView(.vertical, showsIndicators: false) {
                        Text("Celebrate this spooky festival with one of the collest Halloween themed weekend parties at the Sangre Lounge. Enjoy a free-flowing halloween special Sangrias all night.\n\nPlease note that booking is required for this Halloween party in NYC.")
                            .font(.system(size: 17))
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                            .padding(.horizontal)
                    }
                    
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1041709855, green: 0.1140443161, blue: 0.1138538793, alpha: 1)), Color.clear]), startPoint: .bottom, endPoint: .top)
                        .frame(height: 70)
                }
                .frame(height: 150)
                
                Spacer()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Price")
                            .font(.system(size: 17))
                            .foregroundColor(.orange)
                        
                        Text("$84.98")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        withAnimation(.spring()) {
                            showDetails.toggle()
                        }
                    }, label: {
                        HStack {
                            Text("Buy Tickets")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(.white)
                                .lineLimit(1)
                                .frame(width: 100)
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                                .padding()
                                .padding(.horizontal, 4)
                                .background(Color.white)
                                .cornerRadius(15)
                                .padding(.leading, 25)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 12)
                        .background(Color(#colorLiteral(red: 0.6117132902, green: 0.3182130456, blue: 0.6280415654, alpha: 1)))
                        .cornerRadius(20)
                    })
                }
                .padding(.horizontal)
            }
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

struct PageView: View {
    var image: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()
            
            Spacer()
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showDetails: .constant(false))
    }
}
