# SakuraMaple我的世界Java版服务器启动批处理
<p><strong>警告:该批处理仅适用于Windows平台!不适用于Linux、Unix、MacOS等平台!</strong></p>

## 项目仓库(存储库)

<p>若访问缓慢可尝试前往以下站点的项目仓库:</p>
<ul>
  <li>GitHub: <a href="https://github.com/anjisuan608/Minecraft-Java-Edition-Server-Launcher" title="GieCode">GitHub项目地址</a></li>
  <li>Gitee: <a href="https://gitee.com/anjisuan608/Minecraft-Java-Edition-Server-Launcher" title="GieCode">Gitee项目地址</a></li>
  <li>GitCode: <a href="https://gitcode.com/anjisuan608/Minecraft-Java-Edition-Server-Launcher" title="GieCode">GitCode项目地址</a></li>
  <li>GitLab:(停止维护)</li>
  <li>JiHuLab:(暂无)</li>
</ul>

## 跨平台支持(实验性)

<p>PowerShell版已停止开发</p>
<p><a href="#%E7%AC%AC%E4%B8%89%E6%96%B9python%E7%89%88%E6%9C%AC%E5%AE%9E%E9%AA%8C%E6%80%A7" title="第三方Python版本">点击跳转</a>至第三方Python版本说明</p>

<!-- <p><em>如果需要支持跨平台启动，请移步至由<a href="https://github.com/Steverjava/" title="Steverjava">Steverjava(GitHub)</a>(<a href="https://gitee.com/Steverjava/" title="Steverjava">Steverjava(Gitee)</a>)(<a href="https://gitcode.com/Steverjava/" title="Steverjava">Steverjava(GitCode)</a>)开发的第三方<a href="https://github.com/Steverjava/Minecraft-Server-Launcher" title="Steverjava">Python版本(GitHub)</a>(<a href="https://gitee.com/Steverjava/Minecraft-Server-Launcher" title="Steverjava">Python版本(Gitee)</a>)(<a href="https://gitcode.com/Steverjava/Minecraft-Server-Launcher" title="Steverjava">Python版本(GitCode)</a>)</em></p><hr> -->

<h2>若查看或编辑批处理文件时出现乱码,请使用"GB 2312"或"GBK"编码打开文件!</h2>

## 批处理功能
### 第三方认证服务器
<p>批处理添加了对于authlib-injector的支持，允许用户使用<strong><a href="https://littleskin.cn/" title="LittleSkin">LittleSkin</a> 、<a href="https://skin.mualliance.ltd/" title="MUA(Minecraft高校联盟)">MUA<em>(Minecraft高校联盟)</a></em></strong>作为认证服务器，参考<a href="https://manual.littlesk.in/yggdrasil/authlib-injector" title="帮助文档">LittleSkin帮助文档</a> ,同时允许添加自定义的认证服务器</p>
<p>集成了authlib-injector的下载，支持了<a href="https://authlib-injector.yushi.moe/" title="官方源">官方下载源</a>和<a href="https://bmclapi2.bangbang93.com/mirrors/authlib-injector/" title="BMCLAPI">BMCLAPI</a> (实验性功能)</p>
<p>这<strong>不是强制</strong>的，可以在启动时停用，或在服务器停止后的菜单中停用该功能</p>
<P><em>需要注意的是，服务器配置文件<em>server.properties</em>的<strong>online-mode</strong>必须处于<strong>true</strong></em></p>
<p><em>若online-mode处于false则为离线模式，则不启用认证</em></p>
<br>

### 自动重启(无人值守)
<p>批处理添加了对于无人值守的支持，允许用户在启用自动重启功能后实现当服务器停止运行后自动重启，直到批处理关闭</p>
<p>若中途不想继续使用自动重启功能，也可以在服务器停止后的菜单中关闭自动重启功能</p>
<br>

### eula文件生成/同意
<p>批处理添加了对于服务器目录下的eula.txt文件检测</p>
<p>用于检测当前服务器许可协议状态</p>
<p>若不存在许可协议，则会指引用户确认是否通过批处理创建并同意</p>
<p>若许可协议存在，但处于false状态会引导用户确认是否通过批处理写入true</p>
<br>

### 服务器GUI窗口显示/隐藏(仅部分核心可用)
<p>可以通过批处理实现控制部分服务器核心的GUI是否显示</p>
<br>

## 变量说明
### Java环境配置
#### %JVM%
<p>%JVM%用于指定Java路径，默认配置的是"java"，该值会根据系统的环境变量调用Java</p>
<p>若要指定请在<strong>set "JVM="</strong>等号后面输入Java安装路径，一直写到<em>.\bin\java.exe</em></p>
<p>此处也支持系统环境变量，如:<strong>%ProgramFiles%</strong></p>
<br>

### 服务器核心配置
#### %ServerJar%
<p>%ServerJar%变量用于指定服务器核心(jar)文件路径，当前批处理中的是一个例子，请替换成你所使用的核心文件名，<strong>以<em>.jar</em>结尾</strong></p>
<p>如果没有特殊需求建议将服务器核心(jar)文件与该批处理放在相同目录下</p>
<br>

#### %ServerTXT%
<p>%ServerTXT%用于解决部分Forge、NeoForge核心的启动问题</p>
<p>部分Forge、NeoForge核心使用安装时生成的批处理文件,指向一个记录参数的txt文件启动服务器</p>
<p>当前批处理中的是一个例子，请替换成你所使用的引导核心txt文件路径</p>
<p>请在安装目录中找到Forge、NeoForge服务器安装器生成的<strong>"run.bat"</strong>文件,右键-->编辑</p>
<p>找到当中的<strong>"java @user_jvm_args.txt @libraries/net/xxxforge/xxxforge/x.x.x-xx.xx.xx/win_args.txt %*"</strong>语句</p>
<p>复制当中的<strong>"@libraries/net/xxxforge/xxxforge/x.x.x-xx.xx.xx/win_args.txt"</strong>字段</p>
<p>粘贴到下方ServerTXT变量的等号后面</p>
<p><strong>注:请务必看清文件扩展(后缀)名!当中的<em>run.sh</em>文件适用于<strong>Linux</strong>平台,请勿复制该文件的字段!</strong></p>
<p><em>开启文件扩展名显示:文件夹选项-->查看,在下方的选项框中找到"隐藏已知文件类型的扩展名"取消勾选,应用并确定</em></p>
<p><strong>注:当<em>%ServerJar%</em>变量有内容时, <em>ServerTXT</em>变量不生效</strong></p>
<br>

### 内存设置
<p>注:此处换算为:1024K=1M;1024M=1G;1024G=1T</p>
<br>

#### %Xmx%
<p>用于指定最大可用内存，<strong>在变量等号后键入数字,单位<em>MB</em></strong></p>
<br>

#### %Xms%
<p>用于指定最小内存用量，<strong>在变量等号后键入数字,单位<em>MB</em></strong></p>
<br>

### GUI模式(仅部分核心可用)
<p>变量%gui%用于控制服务器的GUI显示和隐藏</p>
<p>默认情况下这个变量是空的<em>(即显示服务器GUI[如果支持])</em></p>
<p>若设置变量为"nogui"则为始终不显示服务器GUI</p>
<br>

## 经过测试的服务器核心
### Vanilla
<p>原版服务器核心</p>
<p><a href="https://www.minecraft.net/zh-hans/download/server" title="Vanilla">Minecraft官网</a></p>
<br>

### PaperMC
<p>Paper 是一款基于 Spigot 的 Minecraft 游戏服务器，旨在大大提高性能并提供更高级的功能和 API</p>
<p><a href="papermc.io" title="PaperMC">PaperMC核心官网</a></p>
<br>

### SpongeVanilla
<p><a href="https://spongepowered.org/downloads/spongevanilla" title="海绵香草">海绵原版端</a></p>
<br>

### ArcLight
<p>使用 Mixin 在模组环境中实现 Bukkit 服务器</p>
<p><a href="https://github.com/IzzelAliz/Arclight" title="ArcLight">ArcLight核心GitHub仓库</a></p>
<p>注:部分版本的服务器核心(jar)文件部署后存放于libraries文件夹下的版本请参考批处理注释完成配置</p>
<br>

### CatServer
<p>高性能和高兼容性的1.12.2/1.16.5/1.18.2版本Forge+Bukkit+Spigot服务端</p>
<p><a href="https://catmc.org/" title="CatServer">CatServer核心官网</a></p>
<br>

### Fabric
<p><a href="https://fabricmc.net/use/" title="Fabric Server">Fabric官网</a></p>
<br>

### Quilt
<p><a href="https://quiltmc.org/install/" title="Quilt Server">Quilt官网</a></p>
<br>

### Forge
<p><a href="https://files.minecraftforge.net/" title="Forge">Forge官网</a></p>
<p>注:部分版本的服务器核心(jar)文件部署后存放于libraries文件夹下的版本请参考批处理注释完成配置</p>
<br>

### NeoForge
<p><a href="https://projects.neoforged.net/neoforged/neoforge" title="NeoForge">NeoForge官网</a></p>
<p>注:该核心的jar文件部署后存放于libraries文件夹下，请参考批处理注释完成配置</p>
<br>

### Mohist
<p><a href="https://mohistmc.com/" title="Mohist">Mohist官网</a></p>
<p>注:部分版本的服务器核心(jar)文件部署后存放于libraries文件夹下的版本请参考批处理注释完成配置</p>
<p>警告:尚未测试该核心的可用性，请移步本项目的<a href="#%E7%AC%AC%E4%B8%89%E6%96%B9python%E7%89%88%E6%9C%AC%E5%AE%9E%E9%AA%8C%E6%80%A7" title="第三方Python版本">第三方Python版本</a>，<br>开发者已完成对Mohist核心及其Fabric/NeoForge版本的启动测试</p>
<br>

## 第三方Python版本(实验性)

<!-- <p><em>如果需要支持跨平台启动，请移步至由<a href="https://github.com/Steverjava/" title="Steverjava">Steverjava(GitHub)</a>(<a href="https://gitee.com/Steverjava/" title="Steverjava">Steverjava(Gitee)</a>)(<a href="https://gitcode.com/Steverjava/" title="Steverjava">Steverjava(GitCode)</a>)开发的第三方<a href="https://github.com/Steverjava/Minecraft-Server-Launcher" title="Steverjava">Python版本(GitHub)</a>(<a href="https://gitee.com/Steverjava/Minecraft-Server-Launcher" title="Steverjava">Python版本(Gitee)</a>)(<a href="https://gitcode.com/Steverjava/Minecraft-Server-Launcher" title="Steverjava">Python版本(GitCode)</a>)</em></p><hr> -->

<!-- <p>Steverjava开发的Python版本</p> -->
<!-- <p>Steverjava的主页</p>
<ul>
  <li><a href="https://github.com/Steverjava/" title="Steverjava's GitHub user profile">GitHub主页</a></li>
  <li><a href="https://gitee.com/Steverjava/" title="Steverjava's Gitee user profile">Gitee主页</a></li>
  <li><a href="https://gitcode.com/Steverjava/" title="Steverjava's GitCode user profile">GitCode主页</a></li>
</ul>
<p>Steverjava的Python版本项目主页</p>
<ul>
  <li><a href="https://github.com/Steverjava/Minecraft-Server-Launcher" title="Steverjava's GitHub Project profile">GitHub项目主页</a></li>
  <li><a href="https://gitee.com/Steverjava/Minecraft-Server-Launcher" title="Steverjava's Gitee Project profile">Gitee项目主页</a></li>
  <li><a href="https://gitcode.com/Steverjava/Minecraft-Server-Launcher" title="Steverjava's GitCode Project profile">GitCode项目主页</a></li>
</ul> -->

<p>第三方Python版——由Steverjava开发</p>
<p>注: 第三方版本与该项目无关,请勿套用该项目相关条款处理第三方版本!</p>
<ul>
  <li>GitHub: <a href="https://github.com/Steverjava/" title="Steverjava's GitHub user profile">开发者主页</a> <a href="https://github.com/Steverjava/Minecraft-Server-Launcher" title="Steverjava's GitHub Project profile">项目仓库</a></li>
  <li>Gitee: <a href="https://gitee.com/Steverjava/" title="Steverjava's Gitee user profile">开发者主页</a> <a href="https://gitee.com/Steverjava/Minecraft-Server-Launcher" title="Steverjava's Gitee Project profile">项目仓库</a></li>
  <li>GitCode: <a href="https://gitcode.com/Steverjava/" title="Steverjava's GitCode user profile">开发者主页</a> <a href="https://gitcode.com/Steverjava/Minecraft-Server-Launcher" title="Steverjava's GitCode Project profile">项目仓库</a></li>
</ul>




