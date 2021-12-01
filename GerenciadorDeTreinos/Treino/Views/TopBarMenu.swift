//
//  TopBarMenu.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 27/11/21.
//

import SwiftUI

struct TopBarMenu: View {
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "plus")
                .font(.system(size: 25))
                .foregroundColor(Color.black)
        }
        .padding(.horizontal, 30)
    }
}

struct TopBarMenu_Previews: PreviewProvider {
    static var previews: some View {
        TopBarMenu()
    }
}
