//
//  PageControl.swift
//  PurplePumpkinHalloween
//
//  Created by Raphael Cerqueira on 10/11/20.
//  Copyright © 2020 Raphael Cerqueira. All rights reserved.
//

import UIKit
import SwiftUI

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.7)
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        pageControl.numberOfPages = self.numberOfPages
        pageControl.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(sender:)), for: .valueChanged)
        return pageControl
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
