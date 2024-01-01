//
//  LIstRowView.swift
//  Places
//
//  Created by Kareem Ragab Hassan on 27/11/2023.
//

import SwiftUI

struct LIstRowView: View {
    // property
    
    @EnvironmentObject var vm : locationViewModel
    let loaction :Location
    
    //body
    var body: some View {
        HStack{
            Image(loaction.imageNames.first!)
                .resizable()
                .frame(width: 80, height: 80, alignment: .center)
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 10){
                Text(loaction.name)
                    .font(.system(size: 20, weight: .semibold, design: .serif))
                
                
                Text(loaction.cityName)
                    .font(.system(size: 20, weight: .medium, design: .serif))
                    .padding(.bottom)
          
            }.padding(.leading,50)
            
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.7)){
                vm.isListDisplayed=false
                vm.CurrentMApLocation=loaction
          
                
            }
        }
    }
}

struct LIstRowView_Previews: PreviewProvider {
    static let vm = locationViewModel()
    
    static var previews: some View {
        LIstRowView(loaction:vm.locations.first!)
            .environmentObject(locationViewModel())
    }
}
