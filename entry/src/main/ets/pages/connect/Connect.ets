import { UserInfoModel } from '../../models/users'
import { WeChatStore } from '../../utils/chat_store'

@Component
struct Connect {
  @State
  userList: UserInfoModel[] = []

  aboutToAppear(): void {
  }

  async getUserList() {
    this.userList = await WeChatStore.getWeChatConnect()
  }

  build() {
    Text("联系人组件")
  }
}

export default Connect