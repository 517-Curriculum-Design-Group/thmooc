import router from '@ohos.router';
import Const from '../common/constants/CommonConstants'
import Logger from '../common/utils/Logger'

@Entry
@Component
struct Index {

  @State userName: string = '' //用户名使用手机号
  @State password: string = '' //密码
  @State isSelect: boolean = false //隐私协议是否勾选
  @State customPopup: boolean = false

  private userNameCheckReg = /^1[3|4|5|6|7|8|9][0-9]{9}/ //手机号校验规则


  // popup构造器定义弹框内容
  @Builder popupBuilder() {
    Row({ space: 2 }) {
      //Image($r("app.media.app_icon")).width(24).height(24).margin({ left: -5 })
      Text('自定义弹窗内容').fontSize(20)
    }.width(100).height(50).padding(5)
  }


  build() {

    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {

      Text($r('app.string.App_title'))
        .fontSize($r('app.float.login_title_font_size'))
        .fontWeight(Const.FONT_BOLDER)
        .padding({top:80})
        .fontColor('#ff2d4d73')

      Column() {

        // if(!this.userNameCheckReg.test(this.userName) && this.userName !='')
        // {
        //   Text($r('app.string.user_name_error_message'))
        //     .fontSize($r('app.float.login_error_message_font_size'))
        //     .fontColor(Color.Red)
        //     .width('80%')
        //     .visibility(Visibility.Visible)
        // }
        // else
        // {
        //   Text($r('app.string.user_name_error_message'))
        //     .fontSize($r('app.float.login_error_message_font_size'))
        //     .fontColor(Color.Red)
        //     .width('80%')
        //     .visibility(Visibility.Hidden)
        // }

        TextInput({ placeholder: $r('app.string.Login_UserName') })
          .width('80%')
          .height($r('app.float.login_input_height'))
          //.margin({ top: $r('app.float.login_input_margin_top') })
          .onChange((value)=>{
            this.userName = value;

            if(value.length < 11)
            {
              this.customPopup = false
              return
            }

            if(!this.userNameCheckReg.test(this.userName) || value.length > 11)
            {
              this.customPopup = true
            }
            else
            {
              this.customPopup = false
            }
          })
          .bindPopup(this.customPopup, {
            message: '用户名要为11位的手机号',
            placementOnTop: true,
            builder: this.popupBuilder,
            //enableArrow: true,
          })

        TextInput({ placeholder: $r('app.string.Login_Password') })
          .type(InputType.Password)
          .width('80%')
          .height($r('app.float.login_input_height'))
          .margin({ top: 30 })
          .onChange((value)=>{
            this.password = value;
          })
      }.width(Const.CONTENT_SIZE)

      Column(){
        Button($r('app.string.Login'))
          .width(Const.HALF_SIZE)
          .opacity($r('app.float.login_button_opacity'))
          .onClick(()=>{
            if(!this.isSelect){
              AlertDialog.show({
                title:'提示:',
                message:'请先同意隐私协议',
                confirm:{
                  value:'关闭',
                  action:()=>{
                    console.info('confirm')
                  }
                }
              })
            }
            else if(this.password==='88888888'){
              Logger.error('Login:',`${this.userName}登录成功>>>>>`)
              console.info('login ok!')
              // 登录跳转

              router.pushUrl({
                url:'pages/Loading',
                params:{
                  userNameParam:this.userName
                }
              })

            }else{
              Logger.error('Login:',`${this.userName}登录失败<<<<<<`)
              AlertDialog.show({
                title:'提示:',
                message:'用户名或密码错误',
                confirm:{
                  value:'关闭',
                  action:()=>{
                    console.info('confirm!')
                  }
                }
              })
            }
          })

        Text("没有账号?点此注册")
          .fontSize(15)
          .margin({top:30})
          .onClick(()=>{
            Logger.debug("跳转到注册页")
          })

      }

      Row() {
        Checkbox().select(this.isSelect).backgroundColor($r('app.color.login_select_background_color'))
          .onChange((value)=>{
            this.isSelect = value;
          })
        Text($r('app.string.Login_check_License'))
          .fontColor($r('app.color.login_check_license_font_color'))
      }

    }
    .width(Const.FULL_WIDTH)
    .height(Const.FULL_HEIGHT)
    .backgroundImage($r('app.media.cloud'))
    .backgroundImageSize(ImageSize.Cover)
    .onClick(()=>{
      Logger.info("jiance")
    })

  }
}