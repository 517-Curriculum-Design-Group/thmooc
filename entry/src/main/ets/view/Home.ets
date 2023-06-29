import CommonConstants from '../common/constants/CommonConstants';
import mainViewModel from '../viewmodel/MainViewModel';
import classifyViewModel from '../viewmodel/ClassifyViewModel';
import ItemData from '../common/bean/ItemData';
import ClassifyModel from '../common/bean/ClassifyModel';
import CourseModel from '../common/bean/CourseModel';

/**
 * Home tab content
 */
@Component
export default struct Home {
  private swiperController: SwiperController = new SwiperController();
  private searchController: SearchController = new SearchController()
  @State searchChangeValue: string = ''
  @State searchSubmitValue: string = ''


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
          .onSubmit((value: string) => {
            this.searchSubmitValue = value
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



        Text('热门推荐')
          .width(CommonConstants.FULL_PARENT)
          .fontSize($r('app.float.title_line_height'))
          .fontWeight(FontWeight.Bold)
          .margin({ top: $r('app.float.home_text_margin') })


        //TODO:首页推送课程列表
        List() {
          ForEach(classifyViewModel.getLinkData(), (classifyData: ClassifyModel) => {
            ListItem(){
              Column() {
                ForEach(classifyData.courseList, (courseData: CourseModel) => {

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
                        //align(Alignment.TopStart)

                      Text(courseData.price.toString() + "元")
                        .fontSize($r('app.float.normal_text_size'))
                        .fontWeight(FontWeight.Medium)
                    }
                    .height(CommonConstants.LAYOUT_WIDTH_OR_HEIGHT)
                    .width(CommonConstants.LAYOUT_WIDTH_OR_HEIGHT)
                  }
                  .justifyContent(FlexAlign.SpaceBetween)
                  .height(CommonConstants.GOODS_LIST_HEIGHT)
                  .width(CommonConstants.LAYOUT_WIDTH_OR_HEIGHT)
                  .margin(5)
                  .backgroundColor(Color.White)

                })
              }
            }
            .height(CommonConstants.LAYOUT_WIDTH_OR_HEIGHT)

          })

        }
        .width(CommonConstants.FULL_PARENT)


        Grid() {
          ForEach(mainViewModel.getSecondGridData(), (secondItem: ItemData) => {
            GridItem() {
              Column() {
                Text(secondItem.title)
                  .fontSize($r('app.float.normal_text_size'))
                  .fontWeight(FontWeight.Medium)
                Text(secondItem.others)
                  .margin({ top: $r('app.float.home_list_margin') })
                  .fontSize($r('app.float.little_text_size'))
                  .fontColor($r('app.color.home_grid_fontColor'))
              }
              .alignItems(HorizontalAlign.Start)
            }
            .padding({ top: $r('app.float.home_list_padding'), left: $r('app.float.home_list_padding') })
            .borderRadius($r('app.float.home_backgroundImage_borderRadius'))
            .align(Alignment.TopStart)
            .backgroundImage(secondItem.img)
            .backgroundImageSize(ImageSize.Cover)
            .width(CommonConstants.FULL_PARENT)
            .height(CommonConstants.FULL_PARENT)
          }, secondItem => JSON.stringify(secondItem))
        }
        .width(CommonConstants.FULL_PARENT)
        .height($r('app.float.home_secondGrid_height'))
        .columnsTemplate('1fr')
        .rowsTemplate('1fr 1fr 1fr 1fr')
        .columnsGap($r('app.float.home_grid_columnsGap'))
        .rowsGap($r('app.float.home_grid_rowGap'))
        .margin({ bottom: $r('app.float.setting_button_bottom')})
      }
    }
    .height(CommonConstants.FULL_PARENT)
  }
}
