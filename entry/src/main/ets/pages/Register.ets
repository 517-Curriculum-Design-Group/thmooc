import router from '@ohos.router';
import Const from '../common/constants/CommonConstants'
import Logger from '../common/utils/Logger'

@Entry
@Component
struct Register
{
  private userNameCheckReg = /^1[3|4|5|6|7|8|9][0-9]{9}/ //手机号校验规则

  build()
  {
      Flex({direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center})
      {
        Text($r('app.string.App_title'))
          .fontSize($r('app.float.login_title_font_size'))
          .padding({top:80})
          .fontWeight(Const.FONT_BOLDER)
          .fontColor('#ff2d4d73')

        Column()
        {
          TextInput({ placeholder:"输入注册手机号" })
            .width('80%')
            .height($r('app.float.login_input_height'))
            .margin({ top: 30 })
            .onChange((value)=>{

            })

          TextInput({ placeholder:"输入密码" })
            .type(InputType.Password)
            .width('80%')
            .height($r('app.float.login_input_height'))
            .margin({ top: 30 })
            .onChange((value)=>{

            })

          TextInput({ placeholder: "确认密码" })
            .type(InputType.Password)
            .width('80%')
            .height($r('app.float.login_input_height'))
            .margin({ top: 30 })
            .onChange((value)=>{

            })

        }

        Button("注册")
          .width(Const.HALF_SIZE)
          .opacity($r('app.float.login_button_opacity'))
          .margin({bottom:150})


      }
      .width(Const.FULL_WIDTH)
      .height(Const.FULL_HEIGHT)
      .backgroundImage($r('app.media.cloud'))
      .backgroundImageSize(ImageSize.Cover)
  }
}