# SakuraMaple我的世界Java版服务器启动批处理
## 批处理功能
### LittleSkin支持
<p>批处理添加了对于authlib-injector的支持，允许用户使用LittleSkin作为认证服务器，参考<a href="https://manual.littlesk.in/yggdrasil/authlib-injector" title="帮助文档">LittleSkin帮助文档</a></p>
<p>集成了authlib-injector的下载，支持了<a href="https://authlib-injector.yushi.moe/" title="官方源">官方下载源</a>和<a href="https://bmclapi2.bangbang93.com/mirrors/authlib-injector/" title="BMCLAPI">BMCLAPI</a></p>
<p>这**不是强制**的，可以在启动时停用，或在服务器停止后的菜单中停用该功能</p>
<P><em>需要注意的是，服务器配置文件的<strong>online-mode</strong>必须处于<strong>true</strong></em></p>
<p><em>若online-mode处于false则为离线模式，任何认证不生效</em></p>

### 自动重启(无人值守)
<p>批处理添加了对于无人值守的支持，允许用户在启用自动重启功能后实现当服务器停止运行后自动重启，直到批处理关闭</p>
<p>若中途不想继续使用自动重启功能，也可以在服务器停止后的菜单中关闭自动重启功能</p>

### eula文件
<p>批处理添加了对于服务器目录下的eula.txt文件检测</p>
<p>用于检测当前服务器许可协议状态</p>
<p>若不存在许可协议，则会指引用户确认是否通过批处理创建并同意</p>
<p>若许可协议存在，但处于false状态会引导用户确认是否通过批处理写入true</p>

### 服务器GUI窗口(仅部分核心可用)
<p>可以通过批处理实现控制部分服务器核心的GUI是否显示</p>

## 变量说明
### Java环境配置
#### %JVM%
<p>%JVM%用于指定Java路径，默认配置的是"java"，该值会根据系统的环境变量选择Java</p>
<p>若要指定请在<strong>set "JVM="</strong>等号后面输入Java安装路径，一直写到<em>.\bin\java.exe</em></p>
<p>此处也支持系统环境变量，如:<strong>%ProgramFiles%</strong></p>

### 服务器Jar文件配置
#### %ServerJar%
<p>%ServerJar%变量用于指定服务器核心(jar)文件路径，当前写入的是一个PaperMC核心的文件名，请替换成你所使用的核心文件名，<strong>以<em>.jar</em>结尾</strong></p>
<p>如果没有特殊需求建议将服务器核心(jar)文件与该批处理放在相同目录下</p>

### 内存设置
#### %Xmx%
<p>用于指定最大可用内存，<strong>在变量等号后键入数字,单位<em>MB</em></strong></p>

#### %Xms%
<p>用于指定最小内存用量，<strong>在变量等号后键入数字,单位<em>MB</em></strong></p>

### GUI模式(仅部分核心可用)
<p>变量%gui%用于控制服务器的GUI显示和隐藏</p>
<p>默认情况下这个变量是空的<em>(即显示服务器GUI[如果支持])</em></p>
<p>若设置变量为"nogui"则为始终不显示服务器GUI</p>

## 经过测试的服务器核心
### PaperMC
<p><a href="papermc.io" title="PaperMC">PaperMC核心官网</a></p>

### ArcLight
<p><a href="https://github.com/IzzelAliz/Arclight" title="ArcLight">ArcLight核心GitHub仓库</a></p>

### CatServer
<p><a href="https://catmc.org/" title="CatServer">CatServer核心官网</a></p>

### Fabric
<p><a href="https://fabricmc.net/use/" title="Fabric Server">Fabric官网</a></p>

### Quilt
<p><a href="https://quiltmc.org/install/" title="Quilt Server">Quilt官网</a></p>

### Mohist
<p>尚未测试该核心的可用性，请移步本项目的第三方<a href="https://github.com/Steverjava/Minecraft-Server-Launcher" title="Steverjava">Python版本</a>，<br>由<a href="https://github.com/Steverjava/" title="Steverjava">Steverjava</a>开发，已完成对Mohist核心及其Fabric/NeoForge版本测试</p>
