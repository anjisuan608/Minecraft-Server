# SakuraMaple我的世界Java版服务器启动批处理
<p><strong>警告:该批处理仅适用于Windows平台!不适用于Linux、Unix、MacOS等平台!</strong></p>
<p><em>如果需要支持跨平台启动，请移步至由<a href="https://github.com/Steverjava/" title="Steverjava">Steverjava(GitHub)</a>(<a href="https://gitee.com/Steverjava/" title="Steverjava">Steverjava(Gitee)</a>)开发的第三方<a href="https://github.com/Steverjava/Minecraft-Server-Launcher" title="Steverjava">Python版本(GitHub)</a>(<a href="https://gitee.com/Steverjava/Minecraft-Server-Launcher" title="Steverjava">Python版本(Gitee)</a>)</em></p><hr>

## 批处理功能
### LittleSkin支持
<p>批处理添加了对于authlib-injector的支持，允许用户使用LittleSkin作为认证服务器，参考<a href="https://manual.littlesk.in/yggdrasil/authlib-injector" title="帮助文档">LittleSkin帮助文档</a></p>
<p>集成了authlib-injector的下载，支持了<a href="https://authlib-injector.yushi.moe/" title="官方源">官方下载源</a>和<a href="https://bmclapi2.bangbang93.com/mirrors/authlib-injector/" title="BMCLAPI">BMCLAPI</a></p>
<p>这<strong>不是强制</strong>的，可以在启动时停用，或在服务器停止后的菜单中停用该功能</p>
<P><em>需要注意的是，服务器配置文件的<strong>online-mode</strong>必须处于<strong>true</strong></em></p>
<p><em>若online-mode处于false则为离线模式，任何基于authlib-injector的认证不会生效</em></p>

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
<p>注:此处换算为:1024K=1M;1024M=1G;1024G=1T</p>

#### %Xmx%
<p>用于指定最大可用内存，<strong>在变量等号后键入数字,单位<em>MB</em></strong></p>

#### %Xms%
<p>用于指定最小内存用量，<strong>在变量等号后键入数字,单位<em>MB</em></strong></p>

### GUI模式(仅部分核心可用)
<p>变量%gui%用于控制服务器的GUI显示和隐藏</p>
<p>默认情况下这个变量是空的<em>(即显示服务器GUI[如果支持])</em></p>
<p>若设置变量为"nogui"则为始终不显示服务器GUI</p>

## 经过测试的服务器核心
### Vanilla
<p>原版服务器核心</p>
<p><a href="https://www.minecraft.net/zh-hans/download/server" title="Vanilla">Minecraft官网</a></p>

### PaperMC
<p>Paper 是一款基于 Spigot 的 Minecraft 游戏服务器，旨在大大提高性能并提供更高级的功能和 API</p>
<p><a href="papermc.io" title="PaperMC">PaperMC核心官网</a></p>

### SpongeVanilla
<p><a href="https://spongepowered.org/downloads/spongevanilla" title="海绵香草">海绵原版端</a></p>

### ArcLight
<p>使用 Mixin 在模组环境中实现 Bukkit 服务器</p>
<p><a href="https://github.com/IzzelAliz/Arclight" title="ArcLight">ArcLight核心GitHub仓库</a></p>
<p>注:部分版本的服务器核心(jar)文件部署后存放于libraries文件夹下的版本请参考批处理注释完成设置</p>

### CatServer
<p>高性能和高兼容性的1.12.2/1.16.5/1.18.2版本Forge+Bukkit+Spigot服务端</p>
<p><a href="https://catmc.org/" title="CatServer">CatServer核心官网</a></p>

### Fabric
<p><a href="https://fabricmc.net/use/" title="Fabric Server">Fabric官网</a></p>

### Quilt
<p><a href="https://quiltmc.org/install/" title="Quilt Server">Quilt官网</a></p>

### Forge
<p><a href="https://files.minecraftforge.net/" title="Forge">Forge官网</a></p>
<p>注:部分版本的服务器核心(jar)文件部署后存放于libraries文件夹下的版本请参考批处理注释完成设置</p>

### NeoForge
<p><a href="https://projects.neoforged.net/neoforged/neoforge" title="NeoForge">NeoForge官网</a></p>
<p>注:该核心的jar文件部署后存放于libraries文件夹下，请参考批处理注释完成设置</p>

### Mohist
<p><a href="https://mohistmc.com/" title="Mohist">Mohist官网</a></p>
<p>注:部分版本的服务器核心(jar)文件部署后存放于libraries文件夹下的版本请参考批处理注释完成设置</p>
<p>警告:尚未测试该核心的可用性，请移步本项目的第三方<a href="https://github.com/Steverjava/Minecraft-Server-Launcher" title="Steverjava">Python版本(GitHub)</a>(<a href="https://gitee.com/Steverjava/Minecraft-Server-Launcher" title="Steverjava">Python版本(Gitee)</a>)，由<a href="https://github.com/Steverjava/" title="Steverjava">Steverjava(GitHub)</a>(<a href="https://gitee.com/Steverjava/" title="Steverjava">Steverjava(Gitee)</a>)开发(本段简称"开发者")，<br>开发者已完成对Mohist核心及其Fabric/NeoForge版本的启动测试</p>
