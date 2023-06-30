import CommonConstants from '../common/constants/CommonConstants';
import mainViewModel from '../viewmodel/MainViewModel';
import classifyViewModel from '../viewmodel/ClassifyViewModel';
import ItemData from '../common/bean/ItemData';
import ClassifyModel from '../common/bean/ClassifyModel';
import CourseModel from '../common/bean/CourseModel';
import router from '@ohos.router';

/**
 * Home tab content
 */
@Component
export default struct Home {
  private swiperController: SwiperController = new SwiperController();
  private searchController: SearchController = new SearchController()
  @State searchChangeValue: string = ''
  @State searchSubmitValue: string = ''
  @State cname: string ='';
  @State cprice: number = 0;


  build() {
    Scroll() {
      Column({ space: CommonConstants.COMMON_SPACE }) {

        //首页顶部搜索框
        Search({ value: this.searchChangeValue, placeholder: 'JS从入门到入土', controller: this.searchController })
          .searchButton('搜索')
          .width('100%')
          .height(50)
          .margin({top : 15})
          .backgroundColor('#F5F5F5')
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .textFont({ size: 14, weight: 400 })
          .onSubmit(() => {
            router.pushUrl({
              url:'pages/SearchPage'
            })
          })
          .onChange((value: string) => {
            this.searchChangeValue = value
          })


        Swiper(this.swiperController) {
          ForEach(mainViewModel.getSwiperImages(), (img: Resource) => {
            Image(img).borderRadius($r('app.float.home_swiper_borderRadius'))
          }, img => img.id)
        }
        //.margin({ top: $r('app.float.home_swiper_margin') })
        .autoPlay(true)
        .interval(2500)
        .duration(500)
        .width('100%')
        //.height('20%')

        Grid() {
          ForEach(mainViewModel.getFirstGridData(), (item: ItemData) => {
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
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .columnsGap($r('app.float.home_grid_columnsGap'))
        .rowsGap($r('app.float.home_grid_rowGap'))
        .padding({ top: $r('app.float.home_grid_padding'), bottom: $r('app.float.home_grid_padding') })
        .height($r('app.float.home_grid_height'))
        .backgroundColor(Color.White)
        .borderRadius($r('app.float.home_grid_borderRadius'))

        Column() {
          Text('热门推荐')
            .width(CommonConstants.FULL_PARENT)
            .fontSize($r('app.float.title_line_height'))
            .fontWeight(FontWeight.Bold)
            .margin({ top: $r('app.float.home_text_margin') })

          Column() {
            ForEach(classifyViewModel.getLinkData()[1].courseList, (courseData: CourseModel) => {
              Row(){
                Image(courseData.imageUrl)
                  .backgroundColor(Color.White)
                  .borderRadius(7)
                  .align(Alignment.TopStart)
                  .width(CommonConstants.HOME_PAGE_COURSE_IMG_WIDTH)
                  .height(CommonConstants.LAYOUT_WIDTH_OR_HEIGHT)

                Column()
                {
                  Text(courseData.courseName)
                    .fontSize($r('app.float.title_line_height'))
                    .fontWeight(FontWeight.Bold)
                    .margin({ top: $r('app.float.home_text_margin') })

                  Text(courseData.price.toString() + "元")
                    .fontSize($r('app.float.header_font_size'))
                    .fontColor($r('app.color.price_color'))

                  Row(){
                    Text('1000+人正在观看')
                      .fontSize($r('app.float.small_text_size'))
                      .fontWeight(FontWeight.Medium)
                      .fontColor(Color.Gray)

                    Button("现在报名")
                      .fontSize($r('app.float.small_text_size'))
                  }

                }
                .height(CommonConstants.LAYOUT_WIDTH_OR_HEIGHT)
                .width(CommonConstants.HOME_PAGE_COURSE_TEXT_WIDTH)
                .justifyContent(FlexAlign.SpaceAround)
              }
              .justifyContent(FlexAlign.SpaceBetween)
              .height(CommonConstants.GOODS_LIST_HEIGHT)
              .width(CommonConstants.LAYOUT_WIDTH_OR_HEIGHT)
              .margin(5)
              .backgroundColor(Color.White)
              //这部分就是传参，应该可以直接复用
              .onClick(()=>{
                this.cname = courseData.courseName
                this.cprice = courseData.price
                router.pushUrl({
                  url:'pages/videoDetail',
                  params: {cnameParm: this.cname,
                    cpriceParm: this.cprice}
                })
              })
              //结束
            })
          }

          Text('期末速通')
            .width(CommonConstants.FULL_PARENT)
            .fontSize($r('app.float.title_line_height'))
            .fontWeight(FontWeight.Bold)
            .margin({ top: $r('app.float.home_text_margin') })

          ForEach(classifyViewModel.getLinkData()[0].courseList, (courseData: CourseModel) => {
            Row(){
              Image(courseData.imageUrl)
                .backgroundColor(Color.White)
                .borderRadius(7)
                .align(Alignment.TopStart)
                .width(CommonConstants.HOME_PAGE_COURSE_IMG_WIDTH)
                .height(CommonConstants.LAYOUT_WIDTH_OR_HEIGHT)

              Column()
              {
                Text(courseData.courseName)
                  .fontSize($r('app.float.title_line_height'))
                  .fontWeight(FontWeight.Bold)
                  .margin({ top: $r('app.float.home_text_margin') })

                Text(courseData.price.toString() + "元")
                  .fontSize($r('app.float.header_font_size'))
                  .fontColor($r('app.color.price_color'))

                Row(){
                  Text('1000+人正在观看')
                    .fontSize($r('app.float.small_text_size'))
                    .fontWeight(FontWeight.Medium)
                    .fontColor(Color.Gray)

                  Button("现在报名")
                    .fontSize($r('app.float.small_text_size'))
                }

              }
              .height(CommonConstants.LAYOUT_WIDTH_OR_HEIGHT)
              .width(CommonConstants.HOME_PAGE_COURSE_TEXT_WIDTH)
              .justifyContent(FlexAlign.SpaceAround)
            }

            .justifyContent(FlexAlign.SpaceBetween)
            .height(CommonConstants.GOODS_LIST_HEIGHT)
            .width(CommonConstants.LAYOUT_WIDTH_OR_HEIGHT)
            .margin(5)
            .backgroundColor(Color.White)
            //这部分就是传参，可以直接复用
            .onClick(()=>{
              this.cname = courseData.courseName
              this.cprice = courseData.price
              router.pushUrl({
                url:'pages/videoDetail',
                params: {cnameParm: this.cname,
                  cpriceParm: this.cprice}
              })
            })
            //结束
          })
        }

        Text($r('app.string.to_bottom')).fontSize(CommonConstants.NORMAL_FONT_SIZE).fontColor($r('app.color.gray'))
        }

      }
      .width(CommonConstants.FULL_PARENT)
      .margin({bottom:20})
    }




}
