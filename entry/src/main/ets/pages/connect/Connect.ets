import { UserInfo, UserInfoModel } from '../../models/users'
import { WeChatStore } from '../../utils/chat_store'
import { router } from '@kit.ArkUI'

@Component
struct Connect {
  @State
  userList: UserInfoModel[] = []
  @State
  @Watch('updateFilterList')
  searchName: string = ""
  @State
  filterList: UserInfoModel[] = []

  aboutToAppear(): void {
    this.getUserList()
  }

  async getUserList() {
    this.userList = await WeChatStore.getWeChatConnect()
    this.updateFilterList()
  }

  updateFilterList() {
    if (this.searchName) {
      this.filterList = this.userList.filter(item => item.username.indexOf(this.searchName) > -1)
      return
    }
    this.filterList = this.userList
  }

  build() {
    Column() {
      Row() {
        Search({ placeholder: '搜索', value: $$this.searchName })
          .height(30)
          .backgroundColor($r('app.color.white'))
          .borderRadius(4)
      }.width('100%')
      .padding({
        left: 10,
        right: 10
      })

      List() {
        ForEach(this.filterList, (item: UserInfo) => {
          ListItem() {
            Row({ space: 10 }) {
              Image(item.avatar)
                .width(30)
                .height(30)
                .borderRadius(4)
              Column() {
                Text(item.username)
                  .fontColor($r('app.color.text_primary'))
                  .fontSize(14)
              }.layoutWeight(1)
              .alignItems(HorizontalAlign.Start)
              .justifyContent(FlexAlign.Center)
            }
            .width('100%')
            .height(60)
            .padding({ left: 10, right: 10 })
            .stateStyles({
              pressed: {
                .backgroundColor($r('app.color.back_color'))
              },
              normal: {
                .backgroundColor($r('app.color.white'))
              }
            })
          }.onClick(() => {
            router.pushUrl({
              url: 'pages/ChatDetail/ChatDetail',
              params: item
            })
          })
        }, (item: UserInfo) => item.user_id)
      }
      .backgroundColor(Color.White)
      .padding({
        top: 10,
        bottom: 10
      })
      .divider({
        strokeWidth: 1,
        color: $r('app.color.border_color')
      })
    }
    .height('100%')
    .padding({
      top: 20
    })
    .backgroundColor($r('app.color.back_color'))
  }
}

export default Connect