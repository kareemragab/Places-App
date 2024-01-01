//
//  LocationDetailView.swift
//  Places
//
//  Created by Kareem Ragab Hassan on 27/11/2023.
//

import SwiftUI
import MapKit


struct LocationDetailView: View {
    //property
    @EnvironmentObject var vm:locationViewModel
    let location :Location
      
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment:.leading){
                headerView
               Divider()
                titleView
                    .padding(.leading)
                Divider()
              descriptionView
                .padding(.leading)
                Divider()
                    MapView
                
                Divider()
                Link(destination: URL(string: location.link)!) {
                    Text("learn More From Wikipedia")
                        .padding()
                }
            }
            
            
        }
        .overlay(
            Button(action: {
                vm.SheetLocation=nil
        }, label: {
            Image(systemName: "xmark.rectangle")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .foregroundColor(.black)
                .padding(.top)
                .padding(.leading)
                .padding()
        }),alignment: .topLeading)
        .edgesIgnoringSafeArea(.top)
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var vm  = locationViewModel()
    static var previews: some View {
        LocationDetailView(location: vm.locations.first!)
            .environmentObject(locationViewModel())
    }
}

extension LocationDetailView {
    
    var headerView:some View {
        TabView{
            ForEach(location.imageNames,id:\.self){ item in
                Image(item)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2, alignment: .center)
                    .clipped()
                
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2, alignment: .center)
        .tabViewStyle(PageTabViewStyle())
       
    }
    
}


extension LocationDetailView{
    var titleView : some View {
        VStack(alignment:.leading,spacing: 10){
            Text(location.name)
                .font(.system(size: 25, weight: .semibold, design: .serif))
            
            
            Text(location.cityName)
                .font(.system(size: 20, weight: .bold, design: .serif))
                
            
            
        }
    }
}

extension LocationDetailView{
    var descriptionView:some View {
        VStack(alignment:.leading){
            Text(location.description)
                .font(.system(size: 18, weight: .medium, design: .serif))
                .multilineTextAlignment(.leading)
                .padding(.trailing,5)
        }
    }
}


extension LocationDetailView{
    var MapView:some View {
        VStack{
            Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))),annotationItems: [location]) { location in
                MapAnnotation(coordinate: location.coordinates) {
                    mapPinItem()
                }
            }
        }
        .allowsHitTesting(false)
        .padding()
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2.5, alignment: .center)
        
    }
}
