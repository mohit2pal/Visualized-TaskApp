import SwiftUI

struct SplitScreen: View {
    @Binding var isPresented: Bool
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to TaskGraph")
                .font(.custom("Fixel Display Semi Bold", size: 30))
                .multilineTextAlignment(.center)
            
            Image("icon")
                .resizable()
                .frame(width: 300,height: 300)
                .padding(.vertical)
            
            Text("Welcome to TaskGraph Pro – Your Ultimate Task Manager! 🚀 Unleash the power of seamless task management and intuitive data visualization designed for the Apple ecosystem. Stay organized, boost productivity, and achieve your goals with elegance. Let's embark on a journey of efficiency and style together. Start accomplishing more with TaskGraph Pro!")
                .multilineTextAlignment(.center)
                   .font(.system(.callout, design: .rounded, weight: .bold))
                   .padding()
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .frame(width: 300,height: 60)
                
                Button("Done") {
                    isPresented.toggle()
                }
                .foregroundColor(.white)
                 .font(.custom("Fixel Display Semi Bold", size: 25))
            }
            
        }.padding()
    }
}

#Preview {
    SplitScreen(isPresented: .constant(true))
}
