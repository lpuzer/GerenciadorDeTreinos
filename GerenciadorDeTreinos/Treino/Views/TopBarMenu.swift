//
//  TopBarMenu.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 27/11/21.
//

import SwiftUI

struct TopBarMenu: View {
        var buttonBarWidth:CGFloat
        var buttonBarHeight:CGFloat
        var buttonBarColor:Color
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "plus")
                .resizable()
                .frame(width: buttonBarWidth, height: buttonBarHeight)
                .font(.system(size: 25))
                .foregroundColor(buttonBarColor)
                
        }
        .padding(.horizontal, 30)
    }
}

struct TopBarMenu_Previews: PreviewProvider {
    static var previews: some View {
        TopBarMenu(buttonBarWidth: 40.0, buttonBarHeight: 40.0, buttonBarColor: .green)
    }
}
