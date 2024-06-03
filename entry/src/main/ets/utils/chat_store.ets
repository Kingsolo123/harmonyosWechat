import { WeChat_ConnectKey, WeChat_CurrentUserKey, WeChat_StoreKey } from '../constants'
import preferences from '@ohos.data.preferences'
import { CurrentUser, DefaultUserList, UserInfoModel } from '../models/users'

export class WeChatStore {
  static context: Context

  static getWeChatStore() {
    return preferences.getPreferences(WeChatStore.context || getContext(), WeChat_StoreKey)
  }

  // 获取微信联系人
  static async getWeChatConnect() {
    const store = await WeChatStore.getWeChatStore()
    return JSON.parse(store.getSync(WeChat_ConnectKey, JSON.stringify(DefaultUserList)) as string) as UserInfoModel[]
  }

  // 获取当前用户信息
  static async getCurrentUser() {
    const store = await WeChatStore.getWeChatStore()
    return JSON.parse(store.getSync(WeChat_CurrentUserKey, JSON.stringify(CurrentUser)) as string) as UserInfoModel
  }
}
