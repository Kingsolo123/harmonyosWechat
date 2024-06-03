import { WeChat_ConnectKey, WeChat_StoreKey } from '../constants'
import preferences from '@ohos.data.preferences'
import { DefaultUserList, UserInfoModel } from '../models/users'

export class WeChatStore {
  static getWeChatStore() {
    return preferences.getPreferences(getContext(), WeChat_StoreKey)
  }

  // 获取微信联系人
  static async getWeChatConnect() {
    const store = await WeChatStore.getWeChatStore()
    return JSON.parse(store.getSync(WeChat_ConnectKey, JSON.stringify(DefaultUserList)) as string) as UserInfoModel[]
  }
}
