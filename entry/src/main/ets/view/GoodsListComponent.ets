/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import commonConst from '../common/constants/CommonConstants';
import { ListDataSource } from '../viewmodel/ListDataSource';

@Component
export default struct GoodsList {
  @Provide goodsListData: ListDataSource = new ListDataSource();
  private startTouchOffsetY: number = 0;
  private endTouchOffsetY: number = 0;


  build() {
    Row() {
      List({ space: commonConst.LIST_ITEM_SPACE }) {
        LazyForEach(this.goodsListData, (item) => {
          ListItem() {
            Row() {
              Column() {
                  Text(item?.goodsName)
                    .fontSize(18).fontWeight(50).width('100%').margin({bottom:5})
                    // .margin({ bottom: commonConst.BIGGER_FONT_SIZE })
                Image(item?.goodsImg)
                  .width('100%')
                  .height(commonConst.LAYOUT_WIDTH_OR_HEIGHT)
                Row(){
                  Row(){
                    Image($r('app.media.highlights')).width($r('app.float.mainPage_baseTab_size')).height($r('app.float.mainPage_baseTab_size'))
                    Text('收藏').fontColor(Color.Gray).margin({left:5})
                  }
                  Row(){
                    Image($r('app.media.comments')).width($r('app.float.mainPage_baseTab_size')).height($r('app.float.mainPage_baseTab_size'))
                    Text('评论').fontColor(Color.Gray).margin({left:5})
                  }
                  Row(){
                    Image($r('app.media.thumbsup')).width($r('app.float.mainPage_baseTab_size')).height($r('app.float.mainPage_baseTab_size'))
                    Text('点赞').fontColor(Color.Gray).margin({left:5})
                  }
                }.width('100%').justifyContent(FlexAlign.SpaceAround).margin({top:10})
              }
              .width('100%')
              .height(commonConst.LAYOUT_WIDTH_OR_HEIGHT)

              // Column() {
              //   Text(item?.goodsName)
              //     .fontSize(commonConst.NORMAL_FONT_SIZE)
              //     .margin({ bottom: commonConst.BIGGER_FONT_SIZE })
              //
              //   Text(item?.advertising_language)
              //     .fontColor($r('app.color.gray'))
              //     .fontSize(commonConst.GOODS_EVALUATE_FONT_SIZE)
              //     .margin({ right: commonConst.MARGIN_RIGHT, bottom: commonConst.BIGGER_FONT_SIZE })
              //
              //   Row() {
              //     Text(item?.evaluate).fontSize(commonConst.GOODS_EVALUATE_FONT_SIZE).fontColor($r('app.color.deepGray'))
              //     Text(item?.price).fontSize(commonConst.NORMAL_FONT_SIZE).fontColor($r('app.color.freshRed'))
              //   }
              //   .justifyContent(FlexAlign.SpaceAround)
              //   .width(commonConst.GOODS_LIST_WIDTH)
              // }
              // .padding(commonConst.GOODS_LIST_PADDING)
              // .width(commonConst.GOODS_FONT_WIDTH)
              // .height(commonConst.LAYOUT_WIDTH_OR_HEIGHT)
            }
            .justifyContent(FlexAlign.Center)
            .height(commonConst.GOODS_LIST_HEIGHT)
            .width('100%')
            .margin({bottom:70})
          }
          .onTouch((event: TouchEvent) => {
            switch (event.type) {
              case TouchType.Down:
                this.startTouchOffsetY = event.touches[0].y;
                break;
              case TouchType.Up:
                this.startTouchOffsetY = event.touches[0].y;
                break;
              case TouchType.Move:
                if(this.startTouchOffsetY - this.endTouchOffsetY > 0) {
                  this.goodsListData.pushData();
                }
                break;
            }
          })
        })
      }
      .width(commonConst.GOODS_LIST_WIDTH)
    }
    .justifyContent(FlexAlign.Center)
    .width(commonConst.LAYOUT_WIDTH_OR_HEIGHT)
  }
}