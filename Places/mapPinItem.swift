//
//  mapPinItem.swift
//  Places
//
//  Created by Kareem Ragab Hassan on 27/11/2023.
//

import SwiftUI

struct mapPinItem: View {
    var body: some View {
        VStack(spacing:0){
            Image(systemName: "map.circle")
                .font(.system(size: 35, weight: .semibold, design: .default))
                .foregroundColor(Color("AccentColor-1"))
            
            Image(systemName: "triangle.fill")
                .font(.system(size: 15, weight: .semibold, design: .default))
                .rotationEffect(Angle(degrees: 180))
                .foregroundColor(Color("AccentColor-1"))
                .offset(x: 0, y: -8)
                .padding(.bottom,20)
        }
    }
}

struct mapPinItem_Previews: PreviewProvider {
    static var previews: some View {
        mapPinItem()
    }
}
