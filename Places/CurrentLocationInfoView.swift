//
//  CurrentLocationInfoView.swift
//  Places
//
//  Created by Kareem Ragab Hassan on 27/11/2023.
//

import SwiftUI

struct CurrentLocationInfoView: View {
    //property
    let location : Location
   @EnvironmentObject var vm : locationViewModel
    
    // body
    
    var body: some View {
      
        HStack{
            VStack(alignment:.leading,spacing: 0){
                Image(location.imageNames.first!)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .padding(6)
                    .background(.white)
                    .cornerRadius(12)
                
                Text(location.name)
                    .font(.system(size: 20, weight: .semibold, design: .serif))
                    .padding(.top,6)
                     
                
                Text(location.cityName)
                    .font(.system(size: 24, weight: .bold, design: .serif))
                    .padding(.top,6)
                
            }
            .padding(.leading,30)
            Spacer()
            VStack{
                
                Button {
                    vm.SheetLocation=location
                    
                } label: {
                    Text("Learn More")
                        .font(.system(size: 17, weight: .medium, design: .serif))
                        .frame(width: 100, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .padding(.horizontal,10)
                        .background(.blue)
                        .cornerRadius(8)
                    
                }
                .padding(.top)
                .padding(.bottom,3)
                
                Button {
                    withAnimation(.easeInOut) {
                        vm.getNextLocation()
                    }
                  
                    
                } label: {
                    Text("Next")
                        .font(.system(size: 17, weight: .medium, design: .serif))
                        .frame(width: 100, height: 50, alignment: .center)
                        .foregroundColor(.black)
                        .padding(.horizontal,10)
                        .background(.red.opacity(0.6))
                        .cornerRadius(8)
                    
                    
                }


                
            }    .padding(.trailing,30)
            
        }
        .padding(.vertical,5)
        .background(Color.white.opacity(0.9).cornerRadius(12).offset(x: 0, y: 40))
        
        
    }
}

struct CurrentLocationInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationInfoView(location: LocationsDataService.locations.first!)
            .padding(.vertical,150)
            .background(.blue)
            .environmentObject(locationViewModel())
           
    }
}
