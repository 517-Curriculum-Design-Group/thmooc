import { initTabBarData } from '../viewmodel/InitialData';
import commonConst from '../common/constants/CommonConstants';
import GoodsList from './GoodsListComponent';
import PutDownRefresh from './PutDownRefreshLayout';
import { ListDataSource } from '../viewmodel/ListDataSource';
import router from '@ohos.router';

@Component
export default struct TabBar {
  private currentOffsetY: number = 0;
  private timer: number = 0;
  @State tabsIndex: number = 0;
  @State refreshStatus: boolean = false;
  @State refreshText: Resource = $r('app.string.refresh_text');
  goodsList: ListDataSource = new ListDataSource();


  @Builder firstTabBar() {
    Column() {
      Text($r('app.string.selected'))
        .fontSize(this.tabsIndex === 0 ? commonConst.BIGGER_FONT_SIZE : commonConst.NORMAL_FONT_SIZE)
        .fontColor(this.tabsIndex === 0 ? Color.Black : $r('app.color.gray'))
    }
    .width(commonConst.LAYOUT_WIDTH_OR_HEIGHT)
    .height(commonConst.LAYOUT_WIDTH_OR_HEIGHT)
    .justifyContent(FlexAlign.Center)
  }

  @Builder otherTabBar(content, index) {
    Column() {
      Text(content)
        .fontSize(this.tabsIndex === index + 1 ? commonConst.BIGGER_FONT_SIZE : commonConst.NORMAL_FONT_SIZE)
        .fontColor(this.tabsIndex === index + 1 ? Color.Black : $r('app.color.gray'))
    }
    .width(commonConst.LAYOUT_WIDTH_OR_HEIGHT)
    .height(commonConst.LAYOUT_WIDTH_OR_HEIGHT)
    .justifyContent(FlexAlign.Center)
  }

  putDownRefresh(event: TouchEvent) {
    switch (event.type) {
      case TouchType.Down:
        this.currentOffsetY = event.touches[0].y;
        break;
      case TouchType.Move:
        this.refreshStatus = event.touches[0].y - this.currentOffsetY > commonConst.MAX_OFFSET_Y;
        break;
      case TouchType.Cancel:
        break;
      case TouchType.Up:

        this.timer = setTimeout(() => {
          this.refreshStatus = false;
        }, commonConst.REFRESH_TIME);
        break;
    }
  }

  aboutToDisappear() {
    clearTimeout(this.timer);
  }

  build() {
    Tabs() {
      TabContent() {
        Scroll() {
          Column() {
            if (this.refreshStatus) {
              PutDownRefresh({ refreshText: $refreshText })
            }
            GoodsList()
            Text($r('app.string.to_bottom'))
              .fontSize(commonConst.NORMAL_FONT_SIZE)
              .fontColor($r('app.color.gray'))
              .margin({top:30,bottom:30})
          }
          .width(commonConst.LAYOUT_WIDTH_OR_HEIGHT)
        }
        .scrollBar(BarState.Off)
        .edgeEffect(EdgeEffect.Spring)
        .width(commonConst.LAYOUT_WIDTH_OR_HEIGHT)
        .height(commonConst.LAYOUT_WIDTH_OR_HEIGHT)
      }
      .tabBar(this.firstTabBar)

      ForEach(initTabBarData, (item, index) => {
        TabContent() {
          Row() {
            List() {
              LazyForEach(this.goodsList, (item) => {
                  ListItem() {
                    if(item.category === index){
                      Row() {
                        Column() {
                          Row(){
                            // Row(){
                            //   Image($r('app.media.account'))
                            //     .width(40)
                            //     .height(40)
                            //     .margin({bottom:10,top:10})
                            //   Text($r('app.string.setting_account_name'))
                            //     .fontSize(18)
                            //     .margin({left:10})
                            // }
                            // .width('100%')

                            Image($r('app.media.CatCool'))
                              .width(40)
                              .height(40)
                              .margin({bottom:10})
                            Text($r('app.string.setting_account_name'))
                              .fontSize(18)
                              .margin({left:10})
                          }
                          .width('100%')

                          Text(item?.goodsName)
                            .fontSize(18).fontWeight(50).width('100%').margin({bottom:5})

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
                      }
                      .justifyContent(FlexAlign.Center)
                      .height(commonConst.GOODS_LIST_HEIGHT)
                      .width('100%')
                      .margin({bottom:140})
                    }
                  }

              })
            }
            .backgroundColor(Color.White)
            .width(commonConst.GOODS_LIST_WIDTH)
            .height('100%')
          }
          .backgroundColor(Color.White)
          .justifyContent(FlexAlign.Center)
          .width(commonConst.LAYOUT_WIDTH_OR_HEIGHT)
        }
        .backgroundColor(Color.White)
        .tabBar(this.otherTabBar(item, index))
      })
    }
    .onChange((index: number) => {
      this.tabsIndex = index;
    })
    .vertical(false)
  }
}