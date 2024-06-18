import SwiftUI

struct ProductDetailView: View {
    @State private var index = 0
    var product: Product
    
    var body: some View {
        product.title.localizedCapitalized.text
            .font(.largeTitle)
        
        VStack{
                    TabView(selection: $index) {
                        ForEach((0..<product.images.count), id: \.self) { index in
                            AsyncImage(url: product.images[index].uri) { img in
                                img.image?.resizable()
                            }
                            .onTapGesture {
                                print(product.images.count.factorial)
                            }
//                            .offset(y: 20)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//                    .padding(.bottom, 32)
                }
//                .frame(height: 200)
        //        HStack(spacing: 2) {
//            ForEach((0..<(product.images.count - 1)), id: \.self) { index in
//                Circle()
//                    .fill(index == self.index ? Color.purple : Color.purple.opacity(0.5))
//                    .frame(width: 20, height: 20)
//
//            }
//        }
//        .padding()

        ScrollView{
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
