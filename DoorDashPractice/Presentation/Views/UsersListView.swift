import SwiftUI

struct UserListView: View {
    @StateObject var viewModel: FetchRandomPersonViewModel
    
    var body: some View {
        List(viewModel.results, id: \.email) { content in
            RowView(userName: content.name, phoneNumber: content.phone, email: content.email)
        }
        .onAppear {
            Task {
                await viewModel.fetchRandomPeople()
            }
        }
    }
}

#Preview {
    UserListView(viewModel: FetchRandomPersonViewModel(apiServiceClient: ApiPreviewClient(),
                                                       serviceResource: ServiceResource(endPoint: MockAPIEndpoint.fetchRandomUsers)))
}
