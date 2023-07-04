/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import CommonConstants from '../common/constants/CommonConstants';
import ItemData from '../common/bean/ItemData';
import mainViewModel from '../viewmodel/MainViewModel';
import router from '@ohos.router';

/**
 * Setting tab content
 */
@Component
export default struct Setting {
  @Builder settingCell(item: ItemData) {
    Row() {
      Row({ space: CommonConstants.COMMON_SPACE }) {
        Image(item.img)
          .width($r('app.float.setting_size'))
          .height($r('app.float.setting_size'))
        Text(item.title)
          .fontSize($r('app.float.normal_text_size'))
      }

      if (item.others === null) {
        Image($r('app.media.right_grey'))
          .width($r('app.float.setting_jump_width'))
          .height($r('app.float.setting_jump_height'))
      } else {
        Toggle({ type: ToggleType.Switch, isOn: false })
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width(CommonConstants.FULL_PARENT)
    .padding({
      left: $r('app.float.setting_settingCell_left'),
      right: $r('app.float.setting_settingCell_right')
    })
  }


  build() {
    Scroll() {
      Column({ space: CommonConstants.COMMON_SPACE }) {
        Column(){
          Text($r('app.string.mainPage_tabTitles_mine'))
            .fontWeight(FontWeight.Medium)
            .fontSize($r('app.float.page_title_text_size'))
            .margin({ top: $r('app.float.mainPage_tabTitles_margin') })
        }
        .width(CommonConstants.FULL_PARENT)
        .alignItems(HorizontalAlign.Start)

        Column(){
          Row() {
            Row() {
              Image($r('app.media.account'))
                .width($r('app.float.setting_account_size'))
                .height($r('app.float.setting_account_size'))
              Column() {
                Text($r('app.string.setting_account_name'))
                  .fontSize($r('app.float.setting_account_fontSize'))
                Text($r('app.string.setting_account_signature'))
                  .fontSize($r('app.float.little_text_size'))
                  .margin({ top: $r('app.float.setting_name_margin') })
              }
              .alignItems(HorizontalAlign.Start)
              .margin({ left: $r('app.float.setting_account_margin') })
            }

            Image($r('app.media.right_grey'))
              .width(20)
              .height(20)

          }
          .onClick(()=> {
            router.pushUrl({url: 'pages/PersonalPage'})
          })
          .margin({ top: $r('app.float.setting_account_margin') })
          .justifyContent(FlexAlign.SpaceBetween)
          .width(CommonConstants.FULL_PARENT)
          // .height($r('app.float.setting_account_height'))
          Grid() {
            ForEach(mainViewModel.getSettingPersonData(), (item: ItemData) => {
              GridItem() {
                Column() {
                  Image(item.img)
                    .width($r('app.float.home_homeCell_size'))
                    .height($r('app.float.home_homeCell_size'))
                  Text(item.title)
                    .fontSize($r('app.float.little_text_size'))
                    .margin({ top: $r('app.float.home_homeCell_margin') })
                }
              }
            }, item => JSON.stringify(item))
          }
          .columnsTemplate('1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr')
          .columnsGap($r('app.float.setting_grid_columnsGap'))
          .rowsGap($r('app.float.home_grid_rowGap'))
          .padding({ top: $r('app.float.home_grid_padding'), bottom: $r('app.float.home_grid_padding')})
          .height($r('app.float.setting_account2_height'))
          .width(CommonConstants.FULL_PARENT)
        }
        .width(CommonConstants.FULL_PARENT)
        .height($r('app.float.setting_account_height'))
        .backgroundColor(Color.White)
        .padding({
          left: $r('app.float.setting_account_padding'),
          right: $r('app.float.setting_settingCell_right')
        })
        .borderRadius($r('app.float.setting_account_borderRadius'))



        List() {
          ForEach(mainViewModel.getSettingListData(), (item: ItemData) => {
            ListItem() {
              this.settingCell(item)
            }
            .height($r('app.float.setting_list_height'))
          }, item => JSON.stringify(item))
        }
        .backgroundColor(Color.White)
        .divider({
          strokeWidth: $r('app.float.setting_list_strokeWidth'),
          color: Color.Grey,
          startMargin: $r('app.float.setting_list_startMargin'),
          endMargin: $r('app.float.setting_list_endMargin')
        })
        .borderRadius($r('app.float.setting_list_borderRadius'))
        .padding({ top: $r('app.float.setting_list_padding'), bottom: $r('app.float.setting_list_padding') })

        // Blank()

        // Button($r('app.string.setting_button'), { type: ButtonType.Capsule })
        //   .width(CommonConstants.BUTTON_WIDTH)
        //   .height($r('app.float.login_button_height'))
        //   .fontSize($r('app.float.normal_text_size'))
        //   .fontColor($r('app.color.setting_button_fontColor'))
        //   .fontWeight(FontWeight.Medium)
        //   .backgroundColor($r('app.color.setting_button_backgroundColor'))
        //   .margin({ bottom: $r('app.float.setting_button_bottom')})
        //   .onClick(()=>{
        //     router.pushUrl({url: 'pages/Index'})
        //   })
      }
      .height(CommonConstants.FULL_PARENT)
    }
  }
}



