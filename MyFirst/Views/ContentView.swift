//
//  ContentView.swift
//  MyFirst
//
//  Created by Derrick on 22/02/23.
//

import SwiftUI


struct ContentView: View {
    
    @State var cities = [City]()
    
    @State var products = [Product]()
    
    private var symbols = ["ben-affleck", "brad-pitt", "chris-evans", "daniel-craigg", "dwayne-johnson", "leonardo-dicaprio", "tom-cruise"]
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    private var gridLayout = [GridItem(.fixed(64)), GridItem(.fixed(50.0)),GridItem(.fixed(64)), GridItem(.fixed(50.0)),GridItem(.fixed(64)), GridItem(.fixed(50.0))]
    
    //
    //    let testStr = symbols[i % symbols.count]
    //
    //    var arr: [String] = []
    //    for element in
    //            testStr .split(separator: "-"){
    //        let e = hp.capitalizeFirstLetter(input: element.trimmingCharacters(in: .whitespacesAndNewlines))
    //        arr.append(e)
    //    }
    //
    //    let str = arr.joined(separator: " ")
    
    var body: some View {
        NavigationView {
            TabView {
                ScrollView([.vertical, .horizontal]){
                    LazyHGrid(rows: gridLayout, spacing: 32){
                        ForEach(0...symbols.count-1, id:\.self){
                            Image(uiImage: (symbols[$0 % symbols.count] + ".jpeg").picFromAsset!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80, alignment: .leading)
                                .clipShape(Circle())
                            symbols[$0 % symbols.count].name.localizedCapitalized.text
                                .textSelection(.enabled)
                                .onTapGesture {
                                }
                        }}
                }
                .padding(.leading, 20)
                .tabItem {
                        "phone.fill".icon
                        "First Tab".localizedCapitalized.text
                }.onAppear {
                                        print("Hi")
                                        print(currentNetwork)
                                        print("Bye")
                    //                    Api().loadCities { (cities) in
                    //                        self.cities = cities
                    //                    }
                }
                ScrollView {
                    LazyVGrid(columns: gridItemLayout,
                              spacing: 40) {
                        ForEach((0...symbols.count-1), id: \.self) {
                            Image(uiImage: (symbols[$0 % symbols.count] + ".jpeg").picFromAsset!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100.0, height: 100.0, alignment: .center)
                                .clipShape(Circle()).onTapGesture {
                                    print($0.y)
                                }
                            symbols[$0 % symbols.count].name.text
                                .textSelection(.enabled)
                                .onTapGesture {
                                    print($0.x)
                                }
                        }
                    }
                }
                .tabItem {
                    "tv.fill".icon
                    "Second Tab".localizedCapitalized.text
                }
                ScrollView {
                    "All Products".localizedCapitalized.text
                        .font(.title)
                        .bold()
                                    VStack(alignment: .leading) {
                                                    ForEach(products) { product in
                                                        NavigationLink(destination: ProductDetailView(product: product)) {
                                                            HStack(alignment:.center) {
                                                                AsyncImage(url: product.category.image.uri) { img in
                                                                    img.image?.resizable()
                                                                }
                                                                    .frame(width: 50, height: 50)
                        
                                                                VStack(alignment: .leading) {
                                                                    product.title.localizedCapitalized.text.bold()
                        
//                                                                    Text(product.description)
    
                                                                    product.category.name.localizedCapitalized.text                       }
                                    }
                                                            .frame(width: 300,height: 50, alignment: .leading)
                                                            .padding()
                                                            .background(Color(#colorLiteral(red: 0.6667672396, green: 0.7527905703, blue: 1, alpha: 0.2662717301)))
                                                            .cornerRadius(20)
                                                        }
                                                    }
                            }
                }
                .tabItem {
                    "folder.fill".icon
                    "Third Tab".localizedCapitalized.text
                }.onAppear() {
                    Api().loadProducts { (products) in
                        self.products = products
                    }
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
