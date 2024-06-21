import SwiftUI

struct ProductDetailView: View {
    @State private var index = 0
    var product: Product
    
    var body: some View {
        ScrollView{
            
        product.title.localizedCapitalized.text
            .font(.largeTitle)
            
            TabView(selection: $index) {
//                  ForEach(product.images, id: \.self) { picture in
//                                AsyncImage(url: picture.uri) { img in
//                                    img.image
//                                }
//                                .onTapGesture {
//                                    print(product.images.count.factorial)
//                                }
//
//                  }
                ForEach((0..<product.images.count), id: \.self) { index in
                    AsyncImage(url: product.images[index].uri) { img in
                        img.image
                    }
                    .onTapGesture {
                        print(product.images.count.factorial)
                    }
                }
            }
            .frame(height: screen.screenHeight/4)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        
//        VStack{
//                }
            //                    .padding(.bottom, 32)
            //                            .offset(y: 20)
        //        HStack(spacing: 2) {
//        }
//        .padding()
            VStack(alignment: .leading) {

//                HStack {
//
//                    Spacer()
//                }
                product.description.localizedCapitalized.text
                .font(.title3)
                .foregroundColor(.secondary)

                Divider()
                
                "Category".localizedCapitalized.text.font(.title)
                
                AsyncImage(url: product.category.image.uri) { img in
                    img.image?.resizable()
                }

//                Text("About \(product.updatedAt)")
//                    .font(.title2)
                product.category.name.localizedCapitalized.text.font(.title2)
            }
        }
        .padding()
    }
}
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product.emptyProduct)
    }
}
