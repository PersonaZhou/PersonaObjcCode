# PersonaObjcCode


### 一、简介

> 这是一个iOS演示项目，主要是演示一些常用的三方库和自定义组件的使用。

### 二、目录结构


![add image](https://github.com/ZhouShisong/PersonaObjcCode/raw/master/DemonstrationImage/PersonaObjcCode.png)


* Business - 业务模块目录
* Core - 封装的一些底层接口，包括：MVVM架构（ViewController和ViewModel绑定），导航控制（原生跳转和统跳），网络请求和mock数据，其他一些工具类。
* Resources - 文件资源
* Assets - 图片资源文件

### 三、演示模块

* 自定义TableViewController，继承PERListViewController和PERListViewModel即可简易使用tableView
* Texture（AsyncDisplayKit），Facebook组件，异步渲染组件演示
* Yoga，Facebook组件，提供Flexbox布局演示
* ReactiveCocoa，提供了函数响应式编程框架的使用演示
* MVVM，提供了如何将对ViewModel和ViewController进行数据绑定的演示
* DoraemonKit，集成调试攻击的演示

### 四、演示界面

##### 登录界面

<img style="border:3px solid #ebfafb; box-shadow: 2px 2px 1px #888888;" src="https://github.com/ZhouShisong/PersonaObjcCode/raw/master/DemonstrationImage/demonstration_1.png" width = "414" height = "896" alt="demonstration_1" 
align=center>

##### 首页界面

<img style="border:3px solid #ebfafb; box-shadow: 2px 2px 1px #888888;" src="https://github.com/ZhouShisong/PersonaObjcCode/raw/master/DemonstrationImage/demonstration_2.png" width = "414" height = "896" alt="demonstration_2" 
align=center>

##### 我的界面

<img style="border:3px solid #ebfafb; box-shadow: 2px 2px 1px #888888;" src="https://github.com/ZhouShisong/PersonaObjcCode/raw/master/DemonstrationImage/demonstration_3.png" width = "414" height = "896" alt="demonstration_3" 
align=center>

##### Texture界面

<img style="border:3px solid #ebfafb; box-shadow: 2px 2px 1px #888888;" src="https://github.com/ZhouShisong/PersonaObjcCode/raw/master/DemonstrationImage/demonstration_4.png" width = "414" height = "896" alt="demonstration_4" 
align=center>

##### 自定义TableViewController界面

<img style="border:3px solid #ebfafb; box-shadow: 2px 2px 1px #888888;" src="https://github.com/ZhouShisong/PersonaObjcCode/raw/master/DemonstrationImage/demonstration_5.png" width = "414" height = "896" alt="demonstration_5" 
align=center>

##### ReactiveCocoa文档界面

<img style="border:3px solid #ebfafb; box-shadow: 2px 2px 1px #888888;" src="https://github.com/ZhouShisong/PersonaObjcCode/raw/master/DemonstrationImage/demonstration_6.png" width = "414" height = "896" alt="demonstration_6" 
align=center>


### 五、后续计划

* 集成Flutter
* 蓝牙和iBeacon
* 动画
* 绘图
* Swift混编和PersonaSwiftCode演示项目
*  接入Infer
* ......

### 备注

##### GitHub页面无法正常加载图片

**解决办法：**

###### 方法一：
开启代理，如果还不行切换到全局模式；

###### 方法二： (该方法不推荐，可能会导致开启代理无法正常访问谷歌)
通过[IPAddress](https://www.ipaddress.com/)首页，输入`raw.githubusercontent.com`查询到真实IP地址

```objc
sudo vi /etc/hosts
```

```objc
199.232.68.133 raw.githubusercontent.com
```