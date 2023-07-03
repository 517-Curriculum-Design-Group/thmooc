import commonConst from '../common/constants/CommonConstants';
import router from '@ohos.router';

@Entry
@Component

export default struct  ComunityDetail{
  @State pageVideo : Resource = router.getParams()['currentVideo']
  @State pageCover : Resource = router.getParams()['currentCover']
  controller: VideoController = new VideoController()
  @State curRate: PlaybackSpeed = PlaybackSpeed.Speed_Forward_1_00_X
  @State isAutoPlay:boolean = false

  build(){
    Scroll(){
      Column(){
        Video({
          src:this.pageVideo,
          previewUri:this.pageCover,
          currentProgressRate: this.curRate,
          controller: this.controller
        }).width('100%').height('80%').autoPlay(this.isAutoPlay)

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

        Column(){
          Text('评论').width('100%').fontSize(25).fontWeight(20)

          Row(){
            Image($r('app.media.account'))
              .width(40)
              .height(40)
              .margin({bottom:10,top:10})
            Column(){
              Text($r('app.string.setting_account_name')).fontSize(14).fontWeight(20).width('100%').fontColor(Color.Gray).margin({bottom:5})
              Text($r('app.string.comment1')).fontSize(18).width('100%')
            }.width('100%').margin({top:20,left:5}).height(60)

          }.width('100%')

          Row(){
            Image($r('app.media.account'))
              .width(40)
              .height(40)
              .margin({bottom:10,top:10})
            Column(){
              Text($r('app.string.setting_account_name'))
                .fontSize(14)
                .fontWeight(20)
                .width('100%')
                .fontColor(Color.Gray)
                .margin({bottom:5})
              Text($r('app.string.comment2')).fontSize(18).width('100%')
            }.width('100%').margin({top:20,left:5}).height(60)

          }.width('100%')

          Row(){
            Image($r('app.media.account'))
              .width(40)
              .height(40)
              .margin({bottom:10,top:10})
            Column(){
              Text($r('app.string.setting_account_name')).fontSize(14).fontWeight(20).width('100%').fontColor(Color.Gray).margin({bottom:5})
              Text($r('app.string.comment3')).fontSize(18).width('100%')
            }.width('100%').margin({top:20,left:5}).height(60)

          }.width('100%')


        }.margin({top:20}).padding(20)
      }

      .width('100%')
    }
    }
}