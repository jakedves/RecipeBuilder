//
//  LaunchLogo.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 26/06/2021.
//

import SwiftUI

struct LaunchLogo: View {
    let title: String
    let titleSize: CGFloat
    let message: String
    let messageSize: CGFloat
    let logo: Image
    let color: Color
    
    init(title: String = "Hello World!", titleSize: CGFloat = 50,
        message: String = "What's happening today?", messageSize: CGFloat = 18,
        logo: Image, color: Color = .green) {
        
        self.title = title
        self.titleSize = titleSize
        self.message = message
        self.messageSize = messageSize
        self.logo = logo
        self.color = color
    }
    
    var body: some View {
        HStack {
            Spacer()
            Logo(Image("Logo"))
            VStack {
                LaunchTitle(title, size: titleSize, color: color)
                
                LaunchMessage(message: message, size: messageSize, color: color)
            }
            Spacer()
        }
    }
}

struct LaunchLogo_Previews: PreviewProvider {
    static var previews: some View {
        LaunchLogo(logo: Image("Logo"))
    }
}
