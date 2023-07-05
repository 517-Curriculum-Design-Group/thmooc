import router from '@ohos.router';

@Entry
@Component
struct videoDetail {
  @State cname2: string = router.getParams()['cnameParm']
  @State cprice2: number = router.getParams()['cpriceParm']
  @State videoSrc: Resource = $rawfile('video.mp4')
  @State previewUri: Resource = $rawfile('videoindex.jpg')
  @State curRate: PlaybackSpeed = PlaybackSpeed.Speed_Forward_1_00_X
  @State isAutoPlay: boolean = false
  @State showControls: boolean = true
  @State isClick: boolean = false
  @State isChange: boolean = false
  controller: VideoController = new VideoController()
  scroller: Scroller = new Scroller()

  public GetRandomNum(Min, Max): Number {
    var Range = Max - Min;
    var Rand = Math.random();
    return (Min + Math.round(Rand * Range));
  }

  build() {

    Row() {
      Stack({alignContent : Alignment.Bottom}) {

        Scroll() {
          Row() {
            Column() {
              Video({
                src: this.videoSrc,
                previewUri: this.previewUri,
                controller: this.controller
              }).width('100%')
                .height(300)
                .autoPlay(this.isAutoPlay)
                .controls(this.showControls)


              Column() {
                Text(this.cname2)
                  .width("100%")
                  .fontSize(24)
                  .margin({ left: 20, top: 10 })
                Row() {
                  Text("视频评分：4.7")
                    .fontSize(18)
                    .fontColor('#fbbf24')
                  Text('目前有' + this.GetRandomNum(800, 1500).toString() + '人在学')
                    .width("100%")
                    .padding({ left: 20 })
                    .fontSize(14)
                    .fontColor(Color.Gray)
                }.margin({ top: 10, left: 20 })

                Divider()
                  .color('#e5e5e5')
                  .strokeWidth('2')
                  .margin({ left: 15, right: 15, top: 10 })

                if (this.cprice2 == 0) {
                  Text("免费")
                    .width('100%')
                    .margin({ top: 20 })
                    .fontSize(25)
                    .fontWeight(15)
                    .fontColor('#f43f5e')
                    .margin({ left: 20, top: 16 })
                }
                else {
                  Text('￥' + this.cprice2.toString())
                    .width('100%')
                    .margin({ top: 20 })
                    .fontSize(25)
                    .fontWeight(15)
                    .fontColor('#f43f5e')
                    .margin({ left: 20, top: 16 })
                }

                Divider()
                  .strokeWidth(30)
                  .color('#e5e5e5')
                  .margin({ top: 16, bottom: 16 })

                Row() {
                  Image($r('app.media.CatCool'))
                    .width($r('app.float.setting_account_size'))
                    .height($r('app.float.setting_account_size'))
                  .margin({left:6})
                  Column() {
                    Text('大熊课堂')
                      .fontSize($r('app.float.setting_account_fontSize'))
                      .margin({ left: 10 })
                    Text('1.35w位学员')
                      .fontSize($r('app.float.little_text_size'))
                      .margin({ top: $r('app.float.setting_name_margin') })
                  }
                  .width('70%')
                  .margin({ left: $r('app.float.setting_account_margin') })
                }

                Divider()
                  .strokeWidth(10)
                  .color('#e5e5e5')
                  .margin({ top: 16, bottom: 16 })

                Text('课程简介')
                  .width('100%')
                  .fontSize(25)
                  .fontWeight(20)
                  .margin({ left: 20 })

                Text("本课程对每个专题的讲座内容进行系统整理，形成了由讲座概要、专题内容、拓展阅读文献、教学课件和教学视频等组成的教学内容体系。\n\n" +
                "学生可以根据自己的学习兴趣，由浅入深地进行拓展学习。通过学术讲座、学术沙龙、学术讨论等形式，使学生掌握较扎实的课程与教学的基础理论知识和其他相关知识，树立先进的教育观念；了解国内外教育改革实践；了解国内外课程与教学研究的历史、现状和动向，形成较强的独立从事课程与教学研究能力；对现实的课程与教学问题具有清晰的认识，能在现代教育观念指导下投入我国基础教育课程改革的实践。\n\n" +
                "主要内容：本课程首先向学生介绍与课程及教学相关的前沿问题，主要通过专家讲座的形式，阐释不同的学者对课程与教学的不同认识，引导学生形成自己的课程与教学观念，让学生了解当代课程与教学改革的基本趋势，能够运用所学解决课程与教学实际问题，并掌握研究相关问题的原则和方法。\n\n" +
                "主要内容包括：教学哲学的价值论维度、异域教学思想本土化的思考、教学理解的意义之维、美国通识教育与课程、教学认识的活动机制、两会课程简介、教学艺术若干理论问题的思考 、PCK的内涵、特征与发展趋势、课程组织与类型、教学的概念与本质。\n\n")
                  .textOverflow({ overflow: TextOverflow.None })
                  .margin({ left: 8, top: 8, right: 8})


                Divider()
                  .strokeWidth(10)
                  .color('#e5e5e5')
                  .margin({ top:2 })

                Image($r('app.media.ad')).width('100%').margin({bottom: 8 })

              }
              .width('100%')
            }

          }

        }


        //容器位于最底部
        Stack() {
          Row(){
              Row(){

                Image(this.isClick ? $r('app.media.like'):$r('app.media.nofill_like') ).width($r('app.float.mainPage_baseTab_size')).height($r('app.float.mainPage_baseTab_size'))

                Text('想学').fontColor(Color.Gray).margin({left:5})
              }.width('50%')
              .height('100%')
            .justifyContent(FlexAlign.Center)
            .onClick(()=>{
              this.isClick = !this.isClick
            })

          Row(){
            Button(this.isChange?"已购买":"+  立即购买").height('40').backgroundColor('#f97316').width(150)
              .onClick(()=>{
                this.isChange = !this.isChange
              })
          }
          .width('50%')
          .justifyContent(FlexAlign.Center)


          }
            .width('100%')
            .height('100%')
            .backgroundColor(Color.White)
        }
        .width('100%')
        .height('10%')
        .border({ width: {top:2} })
        .borderColor('#d4d4d8')
      }
      .width('100%')
      .height('100%')
      .backgroundColor('rgba(255,255,255, 0)')





    }
  }
}