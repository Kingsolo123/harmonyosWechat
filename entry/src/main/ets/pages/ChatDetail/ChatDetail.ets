import { router } from '@kit.ArkUI'
import { WeChat_CurrentUserKey } from '../../constants'
import { UserInfo, UserInfoModel } from '../../models/users'
import BottomInput from './Components/BottomInput'

@Entry
@Component
struct ChatDetail {
  @StorageProp(WeChat_CurrentUserKey)
  currentUser: UserInfoModel = new UserInfoModel({} as UserInfo)
  @Provide
  talkUser: UserInfoModel = new UserInfoModel({} as UserInfo)

  aboutToAppear(): void {
    this.getTalkUser()
  }

  // 获取聊天者信息
  async getTalkUser() {
    this.talkUser = router.getParams() as UserInfoModel
  }

  build() {
    Column() {
      Row() {
        Stack({ alignContent: Alignment.Start }) {
          Image($r('app.media.ic_public_arrow_left'))
            .width(30)
            .height(30).onClick(() => {
            router.back()
          }).zIndex(2)

          Text(this.talkUser.username)
            .width('100%')
            .textAlign(TextAlign.Center)
            .fontSize(16)
            .fontColor($r('app.color.text_primary'))
        }
        .height(50)
      }
      .padding({
        left: 10,
        right: 10
      })

      Text(JSON.stringify(this.currentUser))
      BottomInput()
    }.height('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}