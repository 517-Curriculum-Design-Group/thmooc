import CommonConstants from '../common/constants/CommonConstants';
import mainViewModel from '../viewmodel/MainViewModel';
import ItemData from '../common/bean/ItemData';
import TabBar from '../view/TabBarsComponent';

@Component
export default struct Community{
  build() {
    Row() {
      Navigation() {
        Column() {
          TabBar()
        }
        .width(CommonConstants.LAYOUT_WIDTH_OR_HEIGHT)
        .justifyContent(FlexAlign.Center)
      }
      .size({ width: CommonConstants.LAYOUT_WIDTH_OR_HEIGHT, height: CommonConstants.LAYOUT_WIDTH_OR_HEIGHT })
      .title(CommonConstants.STORE)
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(true)
      
    }
    .height(CommonConstants.LAYOUT_WIDTH_OR_HEIGHT)
    .backgroundColor($r('app.color.primaryBgColor'))
  }
}