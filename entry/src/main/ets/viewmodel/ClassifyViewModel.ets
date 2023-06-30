/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import ClassifyModel from '../common/bean/ClassifyModel';
import CourseModel from '../common/bean/CourseModel';
import LinkDataModel from '../common/bean/LinkDataModel';

class ClassifyViewModel {
  /**
   * Get Classify list data
   *
   * @returns Array<ClassifyModel> linkDataList
   */
  getLinkData(): Array<ClassifyModel> {
    let linkDataList: Array<ClassifyModel> = [];
    let superId: number = 0;
    LINK_DATA.forEach((item: LinkDataModel) => {
      if (superId !== item.superId) {
        // add the course classify model.
        let classifyItem: ClassifyModel = {
          classifyId: item.superId,
          classifyName: item.superName,
          courseList: []
        };
        linkDataList.push(classifyItem);
      }
      // add the course model.
      let courseItem: CourseModel = {
        classifyId: superId,
        courseId: item.id,
        courseName: item.courseName,
        imageUrl: item.imageUrl,
        price: item.price
      };
      linkDataList[linkDataList.length-1].courseList.push(courseItem);
      superId = item.superId;
    });
    return linkDataList;
  }
}

let classifyViewModel = new ClassifyViewModel();
export default classifyViewModel as ClassifyViewModel;

const LINK_DATA: LinkDataModel[] = [
  {
    'superId': 1,
    'superName': '特别推荐',
    'id': 1,
    'courseName': ' vtuber精品课',
    'imageUrl': $r('app.media.ic_img_1'),
    'price': 0
  },
  {
    'superId': 1,
    'superName': '特别推荐',
    'id': 2,
    'courseName': '基金定投实践课',
    'imageUrl': $r('app.media.ic_img_2'),
    'price': 800
  },
  {
    'superId': 1,
    'superName': '特别推荐',
    'id': 3,
    'courseName': 'Python0基础速成课',
    'imageUrl': $r('app.media.ic_img_3'),
    'price': 2250
  },
  {
    'superId': 1,
    'superName': '特别推荐',
    'id': 4,
    'courseName': '0基础学会商业级插画',
    'imageUrl': $r('app.media.ic_img_4'),
    'price': 222
  },
  {
    'superId': 1,
    'superName': '特别推荐',
    'id': 5,
    'courseName': 'vue精品实战课',
    'imageUrl': $r('app.media.ic_img_5'),
    'price': 256
  },
  {
    'superId': 1,
    'superName': '特别推荐',
    'id': 6,
    'courseName': '机器学习在图像分割场景中的应用',
    'imageUrl': $r('app.media.ic_img_6'),
    'price': 0
  },
  {
    'superId': 1,
    'superName': '特别推荐',
    'id': 7,
    'courseName': '十分钟入门鸿蒙生态',
    'imageUrl': $r('app.media.ic_img_7'),
    'price': 0
  },
  {
    'superId': 1,
    'superName': '特别推荐',
    'id': 8,
    'courseName': 'PS教程全网最全合集',
    'imageUrl': $r('app.media.ic_img_8'),
    'price': 400
  },
  {
    'superId': 2,
    'superName': '有道英语',
    'id': 9,
    'courseName': '六级写作高分技巧解析',
    'imageUrl': $r('app.media.ic_img_9'),
    'price': 65
  },
  {
    'superId': 2,
    'superName': '有道英语',
    'id': 10,
    'courseName': '专八阅读精读策略与技巧讲解课程',
    'imageUrl': $r('app.media.ic_img_10'),
    'price': 0
  },
  {
    'superId': 2,
    'superName': '有道英语',
    'id': 11,
    'courseName': '托福听力突破技巧讲解',
    'imageUrl': $r('app.media.ic_img_11'),
    'price': 50
  },
  {
    'superId': 2,
    'superName': '有道英语',
    'id': 12,
    'courseName': '高效记单词方法与技巧',
    'imageUrl': $r('app.media.ic_img_12'),
    'price': 70
  },
  {
    'superId': 2,
    'superName': '有道英语',
    'id': 13,
    'courseName': '英语学术写作指导课程：提升论文写作技巧',
    'imageUrl': $r('app.media.ic_img_13'),
    'price': 0
  },
  {
    'superId': 2,
    'superName': '有道英语',
    'id': 14,
    'courseName': '高效阅读训练方法与技巧：快速抓住文章核心信息',
    'imageUrl': $r('app.media.ic_img_14'),
    'price': 80
  },
  {
    'superId': 2,
    'superName': '有道英语',
    'id': 15,
    'courseName': '有道英语口语突破训练：自信流利地表达',
    'imageUrl': $r('app.media.ic_img_15'),
    'price': 120
  },
  {
    'superId': 2,
    'superName': '有道考研',
    'id': 16,
    'courseName': '嘉然的考研指导',
    'imageUrl': $r('app.media.ic_img_16'),
    'price': 120
  },
  {
    'superId': 3,
    'superName': '有道考研',
    'id': 17,
    'courseName': '"有道考研"全科定制班',
    'imageUrl': $r('app.media.ic_img_17'),
    'price': 1020
  },
  {
    'superId': 3,
    'superName': '有道考研',
    'id': 18,
    'courseName': '英语强化集训营',
    'imageUrl': $r('app.media.ic_img_18'),
    'price': 0
  },
  {
    'superId': 3,
    'superName': '有道考研',
    'id': 19,
    'courseName': '数学考研精品讲解系列',
    'imageUrl': $r('app.media.ic_img_9'),
    'price': 0
  },
  {
    'superId': 3,
    'superName': '有道考研',
    'id': 20,
    'courseName': '政治高分冲刺集训课程',
    'imageUrl': $r('app.media.ic_img_10'),
    'price': 0
  },
  {
    'superId': 3,
    'superName': '有道考研',
    'id': 21,
    'courseName': '数学考点串讲与难题攻克',
    'imageUrl': $r('app.media.ic_img_1'),
    'price': 60
  },
  {
    'superId': 3,
    'superName': '有道考研',
    'id': 22,
    'courseName': '考研真题精讲与解析',
    'imageUrl': $r('app.media.ic_img_2'),
    'price': 120
  },
  {
    'superId': 4,
    'superName': '大学考试',
    'id': 23,
    'courseName': '四六级词汇语法精讲系列',
    'imageUrl': $r('app.media.ic_img_3'),
    'price': 0
  },
  {
    'superId': 4,
    'superName': '大学考试',
    'id': 24,
    'courseName': '24专升本考试指导课程',
    'imageUrl': $r('app.media.ic_img_4'),
    'price': 99
  },
  {
    'superId': 4,
    'superName': '大学考试',
    'id': 25,
    'courseName': '普通话证书考试突破训练班',
    'imageUrl': $r('app.media.ic_img_5'),
    'price': 30
  },
  {
    'superId': 4,
    'superName': '大学考试',
    'id': 26,
    'courseName': '计算机二级证书考试实战模拟',
    'imageUrl': $r('app.media.ic_img_6'),
    'price': 80
  },
  {
    'superId': 4,
    'superName': '大学考试',
    'id': 27,
    'courseName': '大学英语词汇扩展训练',
    'imageUrl': $r('app.media.ic_img_7'),
    'price': 160
  },
  {
    'superId': 4,
    'superName': '大学考试',
    'id': 28,
    'courseName': '六级听力突破技巧',
    'imageUrl': $r('app.media.ic_img_8'),
    'price': 0
  },
  {
    'superId': 5,
    'superName': 'IT互联网',
    'id': 29,
    'courseName': 'JavaScript Web开发实战课程：打造交互性网页应用',
    'imageUrl': $r('app.media.ic_img_9'),
    'price': 0
  },
  {
    'superId': 5,
    'superName': 'IT互联网',
    'id': 30,
    'courseName': 'C++游戏开发入门：构建2D游戏引擎',
    'imageUrl': $r('app.media.ic_img_10'),
    'price': 130
  },
  {
    'superId': 5,
    'superName': 'IT互联网',
    'id': 31,
    'courseName': '深度学习原理与实践：构建神经网络模型',
    'imageUrl': $r('app.media.ic_img_11'),
    'price': 100
  },
  {
    'superId': 5,
    'superName': 'IT互联网',
    'id': 32,
    'courseName': '自然语言处理与文本分析：实现情感分析应用',
    'imageUrl': $r('app.media.ic_img_12'),
    'price': 100
  },
  {
    'superId': 5,
    'superName': 'IT互联网',
    'id': 33,
    'courseName': '强化学习与智能决策：构建智能体与优化策略',
    'imageUrl': $r('app.media.ic_img_13'),
    'price': 1200
  },
  {
    'superId': 5,
    'superName': 'IT互联网',
    'id': 34,
    'courseName': '数字营销策略与社交媒体推广实战',
    'imageUrl': $r('app.media.ic_img_14'),
    'price': 156
  },
  {
    'superId': 5,
    'superName': 'IT互联网',
    'id': 35,
    'courseName': '品牌管理与传播策略',
    'imageUrl': $r('app.media.ic_img_15'),
    'price': 130
  },
  {
    'superId': 6,
    'superName': '设计创作',
    'id': 36,
    'courseName': '从零开始学架构',
    'imageUrl': $r('app.media.ic_img_16'),
    'price': 120
  },
  {
    'superId': 6,
    'superName': '设计创作',
    'id': 37,
    'courseName': '平面设计入门与创意实践',
    'imageUrl': $r('app.media.ic_img_17'),
    'price': 0
  },
  {
    'superId': 6,
    'superName': '设计创作',
    'id': 38,
    'courseName': '创意插画绘画技法与灵感激发',
    'imageUrl': $r('app.media.ic_img_18'),
    'price': 0
  },
  {
    'superId': 6,
    'superName': '设计创作',
    'id': 39,
    'courseName': '视觉传达设计与品牌形象塑造',
    'imageUrl': $r('app.media.ic_img_9'),
    'price': 0
  },
  {
    'superId': 6,
    'superName': '设计创作',
    'id': 40,
    'courseName': 'Python实践指南',
    'imageUrl': $r('app.media.ic_img_10'),
    'price': 2001
  },
  {
    'superId': 6,
    'superName': '设计创作',
    'id': 41,
    'courseName': '数字艺术创作与图形设计',
    'imageUrl': $r('app.media.ic_img_1'),
    'price': 30
  },
  {
    'superId': 6,
    'superName': '设计创作',
    'id': 42,
    'courseName': '建筑与室内设计原理与实践',
    'imageUrl': $r('app.media.ic_img_2'),
    'price': 50
  },
  {
    'superId': 7,
    'superName': '职场提升',
    'id': 43,
    'courseName': '职场沟通技巧与有效表达',
    'imageUrl': $r('app.media.ic_img_3'),
    'price': 0
  },
  {
    'superId': 7,
    'superName': '职场提升',
    'id': 44,
    'courseName': '时间管理与工作效率提升',
    'imageUrl': $r('app.media.ic_img_4'),
    'price': 0
  },
  {
    'superId': 7,
    'superName': '职场提升',
    'id': 45,
    'courseName': 'Excel高级应用与数据分析技巧',
    'imageUrl': $r('app.media.ic_img_5'),
    'price': 0
  },
  {
    'superId': 8,
    'superName': '兴趣副业',
    'id': 46,
    'courseName': '创意手工DIY教程',
    'imageUrl': $r('app.media.ic_img_6'),
    'price': 50
  },
  {
    'superId': 8,
    'superName': '兴趣副业',
    'id': 47,
    'courseName': '烘焙与甜点制作课程',
    'imageUrl': $r('app.media.ic_img_7'),
    'price': 60
  },
  {
    'superId': 8,
    'superName': '兴趣副业',
    'id': 48,
    'courseName': '摄影与后期处理技巧分享',
    'imageUrl': $r('app.media.ic_img_8'),
    'price': 80
  },
  {
    'superId': 8,
    'superName': '兴趣副业',
    'id': 49,
    'courseName': '健身与运动教练指导',
    'imageUrl': $r('app.media.ic_img_9'),
    'price': 300
  },
  {
    'superId': 8,
    'superName': '兴趣副业',
    'id': 50,
    'courseName': '音乐创作与演奏技巧分享',
    'imageUrl': $r('app.media.ic_img_10'),
    'price': 150
  },
  {
    'superId': 8,
    'superName': '兴趣副业',
    'id': 51,
    'courseName': '网络写作与内容创作指导',
    'imageUrl': $r('app.media.ic_img_11'),
    'price': 200
  },
  {
    'superId': 8,
    'superName': '兴趣副业',
    'id': 52,
    'courseName': '演讲与公众演讲技巧培训',
    'imageUrl': $r('app.media.ic_img_12'),
    'price': 0
  },
  {
    'superId': 8,
    'superName': '兴趣副业',
    'id': 53,
    'courseName': '嘉然今天吃什么',
    'imageUrl': $r('app.media.ic_img_13'),
    'price': 0
  },
  {
    'superId': 8,
    'superName': '兴趣副业',
    'id': 54,
    'courseName': '电影剪辑与视频制作技巧',
    'imageUrl': $r('app.media.ic_img_14'),
    'price': 100
  },
  {
    'superId': 8,
    'superName': '兴趣副业',
    'id': 55,
    'courseName': '育儿与亲子教育分享',
    'imageUrl': $r('app.media.ic_img_15'),
    'price': 0
  }
]