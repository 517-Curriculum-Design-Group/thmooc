import commonConst from '../common/constants/CommonConstants';
import { ListDataSource } from '../viewmodel/ListDataSource';
import router from '@ohos.router';

@Component
export default struct GoodsList {
  @Provide goodsListData: ListDataSource = new ListDataSource();

  build() {
    Row() {
      List({ space: commonConst.LIST_ITEM_SPACE }) {
        LazyForEach(this.goodsListData,(item) => {
          ListItem() {
            Row() {
              Column() {
                Row(){
                    Image($r('app.media.CatCool'))
                      .width(40)
                      .height(40)
                      .margin({bottom:10,top:10})
                      Text($r('app.string.setting_account_name'))
                        .fontSize(18)
                        .margin({left:10})
                }
                .width('100%')

                Text(item?.goodsName).fontSize(22).fontWeight(50).width('100%').margin({bottom:5})

                Image(item?.goodsImg)
                  .width('100%')
                  .height(commonConst.LAYOUT_WIDTH_OR_HEIGHT)
                  .onClick(()=>{
                    router.pushUrl({
                      url:'pages/CommunityDetail',
                      params:{
                        currentVideo : item.video,
                        currentCover : item.cover
                      }
                    })
                  })

                Row(){
                  Row(){
                    Image($r('app.media.highlights'))
                      .width($r('app.float.mainPage_baseTab_size'))
                      .height($r('app.float.mainPage_baseTab_size'))
                    Text('收藏')
                      .fontColor(Color.Gray)
                      .margin({left:5})
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
            }
            .justifyContent(FlexAlign.Center)
            .height(commonConst.GOODS_LIST_HEIGHT)
            .width('100%')
            .margin({bottom:120})

          }
        })
      }
      .backgroundColor(Color.White)
      .width(commonConst.GOODS_LIST_WIDTH)
    }
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.Center)
    .width(commonConst.LAYOUT_WIDTH_OR_HEIGHT)
  }
}