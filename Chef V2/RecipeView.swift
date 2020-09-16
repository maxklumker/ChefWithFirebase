//
//  RecipeView.swift
//  Chef V2
//
//  Created by Lewis Wall on 16.09.20.
//

import SwiftUI
import Firebase


struct RecipeView : View {
            
@ObservedObject var recipes = getRecipesData()
            
      var body : some View {
                
            if self.recipes.datas.count != 0{

                NavigationView {
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 8) {
                                ForEach(self.recipes.datas) {i in
                                    RecipeCard(data: i)
                                    
                                    }
                                }
                            }.navigationBarTitle("Recipes")
                        }
                     }
                }
            }

        
            struct RecipeCard : View {
                
                var data : recipe
                
                var body: some View {
                    
                    ZStack{
                        Image(data.image)
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 334, height: 334)
                            .cornerRadius(10)
                            .padding()
                            .shadow(color: Color.black.opacity(0.2), radius: 12, y: 10)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .background(LinearGradient(gradient: Gradient(colors: [.clear, Color.black.opacity(1)]), startPoint: .bottom, endPoint: .top))
                            .frame(width: 334, height: 334)
                            .offset(y: -216)
                            .cornerRadius(10)

                        HStack{
                            Text(data.title)
                                .font(.system(size: 27,weight: .bold))
                                .foregroundColor(.white)
                                .frame(minWidth: 10, maxWidth: .infinity, alignment: .leading)
                                .lineLimit(2)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                                .padding(.bottom, 268)
                                .padding(EdgeInsets(top: 0, leading: 34, bottom: 0, trailing: 8))

                            }
                        }
                     }
                }
         
                
        class getRecipesData : ObservableObject{
            
            @Published var datas = [recipe]()
            
            init() {
                
                let db = Firestore.firestore()
                db.collection("recipes").addSnapshotListener { (snap, err) in
                    
                    if err != nil{
                        
                        print((err?.localizedDescription)!)
                        return
                    }
                    
                    for i in snap!.documentChanges{
                        
                        let id = i.document.documentID
                        let title = i.document.get("title") as! String
                        let image = i.document.get("image") as! String
                        
                        self.datas.append(recipe(id: id, title: title, image: image))
                        
                    }
                }
            }
        }

        struct recipe : Identifiable {

            var id : String
            var title : String
            var image : String
        }
        

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
