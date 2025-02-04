::SakuraMaple Studio &copy; 2020-2024
@echo off
::若文字不能正常显示
::If the text cannot be displayed properly
::请使用GB 2312编码查看和编辑文件!
::Please use GB 2312 encoding to view and edit this file!
::若切换到"UTF-8"编码
::If switching to UTF-8 encoding
::请移除下方"@REM",以确保正常显示
::Please remove '@ REM' below to ensure proper display
@REM chcp 65001
title Loading-XE-SakuraMaple_MCSL-vX-Preview
cls
::设置颜色变量信息
set "colorError=06"
set "colorRunning=02"
set "colorWarning=03"
set "colorChoose=09"
::配置Up One Level为"null"
set "uol=null"
color %colorWarning%
::基本信息
::系统时间
echo 当前系统时间: && time /t
::系统日期
echo 当前系统日期: && date /t
::系统版本
echo 正在运行的系统版本: && ver
::当前用户
echo 启动批处理的用户: && whoami
::主机名称
echo 主机名称: && hostname
::IP配置信息
echo IP地址配置信息: && ipconfig
::空行
echo.
::设置JVM(Java路径)(支持环境变量)
::路径一直写到./bin/java.exe
set "JVM=java"
::设置服务器核心文件名称,在变量等号后键入(一直接写到.jar)
::若核心没有实体的jar文件(如部分Forge、NeoForge核心,及其它核心采用同样策略的核心)请将该变量**留空**,按照下方说明填写 ServerTXT 变量!
set "ServerJar=paper-1.8.8-445.jar"
::特殊核心路径变量
::若使用的是部分Forge、NeoForge等核心,请在目录中找到Forge、NeoForge服务器安装器生成的"run.bat"文件
::右键->编辑
::找到当中的"java @user_jvm_args.txt @libraries/net/xxxforge/xxxforge/x.x.x-xx.xx.xx/win_args.txt %*"语句
::复制当中的"@libraries/net/xxxforge/xxxforge/x.x.x-xx.xx.xx/win_args.txt"字段
::粘贴到下方ServerTXT变量的等号后面
::注:请务必看清文件扩展(后缀)名!当中的run.sh文件适用于Linux平台,请勿复制该文件的字段!
::开启文件扩展名显示:文件夹选项->查看,在下方的选项框中找到"隐藏已知文件类型的扩展名"取消勾选,应用并确定
::注:当 ServerJar 变量有内容时, ServerTXT变量 **不生效**
set "ServerTXT=@libraries/net/minecraftforge/forge/1.20.1-47.2.20/win_args.txt"
::核心方案(若没有留空ServerJar变量则优先采用ServerJar变量中的内容启动)
if "%ServerJar%" neq "" (
    set "ServerFile=-jar "%ServerJar%""
) else (
    set "ServerFile="%ServerTXT%""
)
::设置服务器内存,最大与最小
::基本
::最大可用内存(在变量等号后键入数字,单位MB)
set "XmxSize=8192"
::最小内存用量(在变量等号后键入数字,单位MB)
set "XmsSize=4096"
::高级
::Xmn/Xss启用/禁用(设置为1时启用)
set "XmnTrue=0"
set "XssTrue=0"
::Xmn配置
::设置年轻代大小(在变量等号后键入数字,单位MB)
::整个堆大小=年轻代大小 + 年老代大小 + 持久代大小
::持久代一般固定大小为64m,所以增大年轻代后,将会减小年老代大小
::此值对系统性能影响较大
::Sun官方推荐配置为整个堆的3/8.
set "XmnSize=3072"
::Xss配置
::设置每个线程的堆栈大小(在变量等号后键入数字,单位MB)
set "XssSize=512"
::识别模块
if "%XmnTrue%" == "1" set "XmnStatus=-Xmn%XmnSize%m"
if "%XssTrue%" == "1" set "XssStatus=-Xss%XssSize%m"
::更多配置
::设置服务器GUI状态(留空为显示GUI,"nogui"为不显示GUI)
set "gui="
::配置自定义的登录认证服务器(非必要,请留空!)
::注:已预置LittleSkin和MUA
::如果使用其它的认证服务器则写在下方变量的等号后
set "CustomAuthURL="
::首次启动批处理自动配置首选项等待时间与状态
set "waitTime=/T 22"
set "DefaultChoice=/D y"
::首次启动批处理自动配置认证服务器等待时间与状态
set "AuthWaitTime=/T 8"
set "DefaultAuthURLChoice=/D l"

:bc
title Jump-XE-SakuraMaple_MCSL-vX-Preview
::跳转管理器-赋值
if "%uol%" == "null" set "BackCode=" && goto br
if "%uol%" == "AuthConfig" set "BackCode=l" && goto br
if "%uol%" == "AutoConfig" set "BackCode=a" && goto br
if "%uol%" == "MainConfig" set "BackCode=e" && goto br
if "%uol%" == "FastConfig" set "BackCode=f" && goto br
if "%uol%" == "EulaConfig" set "BackCode=t" && goto br
if "%uol%" == "running" set "BackCode=rsr" && goto br
::没有匹配,移步报错
set "ErrorCode=TeaPot" && goto br

:br
title Jump-XE-SakuraMaple_MCSL-vX-Preview
::跳转管理器-执行
if "%BackCode%" neq "" goto %BackCode%
::异常变量跳转
if "%ErrorCode%" == "TeaPot" echo "跳转管理器遇到严重错误,正在转到批处理主菜单…" && timeout /t 3 && goto e

:CheckServerCoreConfig

if "%ServerJar%" neq "" (
    goto CheckServerCoreConfigJarFile
) else (
    goto CheckServerCoreConfigTXTFile
)

:CheckServerCoreConfigJarFile

if "%ServerJar%" neq "" (
    echo 检测到已配置核心Jar文件
    goto CheckServerCoreStatus
) else (
    goto ErrorServerCore
)

:CheckServerCoreConfigTXTFile

if "%ServerFile%" neq "" (
    echo 检测到已配置txt启动文件
    goto FirstLaunch
) else (
    goto ErrorServerCore
)

:CheckServerCoreStatus

if exist .\%ServerJar% (
    echo 检测到配置的服务器核心
    goto FirstLaunch
) else (
    echo 未发现配置的服务器核心
    goto ErrorServerCore
)

:ErrorServerCore
set "colorError=04"
color %colorError%
echo 配置的服务器核心文件路径错误或不存在,请检查ServerJar或ServerTXT变量是否配置正确!
timeout /t 6
goto x

:FirstLaunch

echo ************************正在自检,如需停止,请按Ctrl+C停止启动,按任意键跳过直接启动************************
timeout /t 8



:CheckEula
echo 正在检查许可协议状态…
::Eula协议文件检查
title Eula-XE-SakuraMaple_MCSL-vX-Preview
if exist .\eula.txt (
    echo 检测到许可协议文件!
    set "EulaFile=1"
    goto ReadEula
) else (
    echo 检测不到许可协议文件!
    set "EulaFile=0"
    echo.
    echo 是否创建并写入内容?
    goto CheckEulaChoice
)

:CheckEulaChoice
::协议检查选项
echo 键入"y"确认,键入"n"取消,键入"x"关闭批处理
choice /C ynx /CS
if %errorlevel% == 1 goto CreateEula
if %errorlevel% == 2 goto t
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto CheckEulaChoice

:ReadEula
::Eula协议文件读取
title Eula-XE-SakuraMaple_MCSL-vX-Preview
::字符检查
echo 正在检查文件完整性…
::此处"eula"字符大小写敏感
::重定向到"nul"避免屏显
echo 注:检测仅能检测小写字符,若"true"为大写或者大小写混用仍会识别为不完整
findstr "eula=true" .\eula.txt >nul
if %errorlevel% == 0 (
    echo 协议同意信息完整!
    ::设置一个声明Eula协议完整的变量,这里不是eula.txt中填写的信息,仅用于后续调用识别与检测
    set "EulaContent=1"
    timeout /t 3
    goto ReadEulaJump
) else (
    echo 协议同意信息不完整
    set "EulaContent=0"
    echo.
    echo 是否覆写^(同意协议^)^?
    goto ReadEulaChoice
)

:ReadEulaJump
::跳转位置判断
if "%uol%" == "null" (
    goto f
) else (
    goto bc
)

:ReadEulaChoice
::协议读取选项
echo 键入"y"确认,键入"n"取消,键入"x"关闭批处理
choice /C ynx /CS
if %errorlevel% == 1 goto WriteEula
if %errorlevel% == 2 goto t
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto ReadEulaChoice

:f
color %colorChoose%
title Fest Boot-SakuraMaple_MCSL-vX-Preview
::FastConfig快速配置菜单
::配置Up One Level为"FastConfig"
set "uol=FastConfig"
if "%DefaultChoice%" == "/D y" (
    set "echoDefault=(默认)"
) else (
    set "echoDefault="
)
echo ******快速启动******
echo 键入"y"则开启服务器第三方认证%echoDefault%
echo 键入"n"则关闭服务器第三方认证
echo 键入"x"结束批处理运行
echo 键入"m"配置更多选项
echo 键入"s"切换服务器GUI显示状态(仅支持部分服务器核心)
echo 键入"4"切换服务器终止颜色(红/黄[默认])
choice %waitTime% /C ynx4ms /CS %DefaultChoice%
if %errorlevel% == 1 set "FirstStart=goto r" && goto AuthLibCheck
if %errorlevel% == 2 set "FirstStart=goto r" && goto ClearAuth
if %errorlevel% == 3 goto x
if %errorlevel% == 4 goto Colorful
if %errorlevel% == 5 goto e
if %errorlevel% == 6 goto nogui

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto f

:l
::第三方认证功能配置菜单
color %colorChoose%
title Authentication Server-SakuraMaple_MCSL-vX-Preview
::清除默认选项与等待时间
if "%waitTime%" neq "" set "waitTime="
if "%DefaultChoice%" neq "" set "DefaultChoice="
if "%DefaultAuthURLChoice%" neq "" set "DefaultAuthURLChoice="
if "%AuthWaitTime%" neq "" set "AuthWaitTime="
::第三方认证功能选项
echo 请选择是否启用第三方认证(LittleSkin/MUA):
echo.
echo 键入"y"则开启服务器第三方认证
echo 键入"n"则关闭服务器第三方认证
echo 键入"x"结束批处理运行
echo 键入"c"进入批处理配置
echo 键入"i"查询当前认证状态
echo 键入"s"切换服务器GUI显示状态(仅支持部分服务器核心)
echo 键入"4"切换服务器终止颜色(红/黄[默认])
echo 键入"0"下载authlib-injector(实验性:可能无法正常工作)
::配置Up One Level为"AuthConfig"
set "uol=AuthConfig"

choice /C ync4xis0 /CS
if %errorlevel% == 1 goto AuthLibCheck
if %errorlevel% == 2 goto ClearAuth
if %errorlevel% == 3 goto e
if %errorlevel% == 4 goto Colorful
if %errorlevel% == 5 goto x
if %errorlevel% == 6 goto AuthInfo
if %errorlevel% == 7 goto nogui
if %errorlevel% == 8 goto DownloadAuth

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto l

:Colorful
::终止颜色判断与切换
if "%colorError%" == "06" (
    echo.
    set "colorError=04"
    echo 已将终止颜色切换为红色
    echo.
    goto Preview
) else (
    echo.
    set "colorError=06"
    echo 已将终止颜色切换为黄色
    echo.
    goto Preview
)

:Preview
color %colorError%
pause

goto bc

:AuthLibCheck
echo 正在检测authlib-injector-1.2.5.jar是否存在…
if exist .\authlib-injector-1.2.5.jar (
    echo 成功检测到"authlib-injector-1.2.5.jar"!
    timeout /t 3
    goto ChoiceAuth
) else (
    echo 没有找到"authlib-injector-1.2.5.jar"!
    echo 是否前往下载?
    goto AuthLibCheckChoice
)

:AuthLibCheckChoice
echo 键入"y"前往下载,键入"n"取消下载并返回认证服务器配置,键入"x"关闭批处理
choice /C ynx /CS
if %errorlevel% == 1 goto DownloadAuth
if %errorlevel% == 2 goto l
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto AuthLibCheckChoice

:AuthInfo
::第三方认证状态信息
color %colorChoose%

title Authentication Information-SakuraMaple_MCSL-vX-Preview

echo.

if "%Auth%" == "" (
    echo 当前第三方认证服务处于关闭状态!
) else (
    echo 当前第三方认证服务处于开启状态!
    echo 变量信息:%Auth%
)
goto l

:ChoiceAuth
::选择认证服务器
if "%CustomAuthURL%" neq "" (
    echo 检测到已配置自定义的认证服务器!
    echo 当前自定义的认证服务器:%CustomAuthURL%
    echo 是否直接启用当前自定义的认证服务器?
    goto JudgeChoiceCustomAuthServer
) else (
    goto JudgeChoiceDefaultAuthServer
)

:JudgeChoiceCustomAuthServer

if "%uol%" == "FastConfig" (
    goto FastChoiceCustomAuthServer
) else (
    goto ChoiceCustomAuthServer
)

:JudgeChoiceDefaultAuthServer

if "%uol%" == "FastConfig" (
    goto FastChoiceDefaultAuthServer
) else (
    goto ChoiceDefaultAuthServer
)

:FastChoiceDefaultAuthServer

if "%DefaultAuthURLChoice%" == "/D l" (
    set "DefaultAuthURLEcho=(默认)"
) else (
    set "DefaultAuthURLEcho="
)

echo 是否要快速使用LittleSkin作为认证服务器:
echo 键入 y 快速使用LittleSkin作为认证服务器%DefaultAuthURLEcho%
echo 键入 n 或 a 前往认证服务器选择列表
echo 键入 l 前往认证服务器配置选项
echo 键入 x 结束批处理运行
choice %AuthWaitTime% /C ynalx /CS %DefaultAuthURLChoice%
if %errorlevel% == 1 set "AuthURL=https://littleskin.cn/api/yggdrasil" && goto SetAuth
if %errorlevel% == 2 goto ChoiceDefaultAuthServer
if %errorlevel% == 3 goto ChoiceDefaultAuthServer
if %errorlevel% == 4 goto l
if %errorlevel% == 5 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto FastChoiceDefaultAuthServer

:ChoiceDefaultAuthServer
::默认认证服务器列表

echo 请选择要使用的第三方认证服务器:
echo 键入 l 使用LittleSkin作为认证服务器
echo 键入 m 使用MUA(Minecraft高校联盟)作为认证服务器
echo 键入 c 使用自定义的认证服务器
echo 键入 b 返回上一级菜单
echo 键入 x 结束批处理运行
choice /C lmcbx /CS 
if %errorlevel% == 1 set "AuthURL=https://littleskin.cn/api/yggdrasil" && goto SetAuth
if %errorlevel% == 2 set "AuthURL=https://skin.mualliance.ltd/api/union/yggdrasil" && goto SetAuth
if %errorlevel% == 3 goto CheckCustomAuthServer
if %errorlevel% == 4 goto bc
if %errorlevel% == 5 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto ChoiceDefaultAuthServer

:FastChoiceCustomAuthServer

echo 键入 y 启用%echoDefault%
echo 输入 n 从默认的认证服务器列表中选择
echo 输入 a 从预设的认证服务器列表中选择
echo 输入 x 结束批处理运行
choice %AuthWaitTime% /C ynx /CS %DefaultChoice%
if %errorlevel% == 1 set "AuthURL=%CustomAuthURL%" && goto SetAuth
if %errorlevel% == 2 goto FastChoiceDefaultAuthServer
if %errorlevel% == 3 goto ChoiceDefaultAuthServer
if %errorlevel% == 4 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto FastChoiceCustomAuthServer

:ChoiceCustomAuthServer
echo 键入 y 启用
echo 输入 n 从默认的认证服务器列表中选择
echo 输入 x 结束批处理运行
choice /C ynx /CS
if %errorlevel% == 1 set "AuthURL=%CustomAuthURL%" && goto SetAuth
if %errorlevel% == 2 goto ChoiceDefaultAuthServer
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto ChoiceCustomAuthServer

:CheckCustomAuthServer

if %CustomAuthURL% neq "" (
    set "AuthURL=%CustomAuthURL%"
    goto SetAuth
) else (
    echo 没有检测到自定义认证服务器配置信息!
    goto ChoiceDefaultAuthServer
)

:SetAuth
::配置认证服务信息变量
echo 正在写入认证服务变量……
set "Auth=-javaagent:authlib-injector-1.2.5.jar=%AuthURL%"
timeout /t 1
::第一次启动行为
%FirstStart%
::是否立即重启服务器
echo.
echo 键入"y"立即启动/重启服务器
echo 键入"n"返回上一级菜单
echo 键入"x"退出批处理
choice /C ynx /CS
if %errorlevel% == 1 goto r
if %errorlevel% == 2 goto bc
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto SetAuth

:ClearAuth
::清除认证服务信息变量
echo 正在清除认证服务变量……
set "AuthURL="
::第一次启动行为
%FirstStart%
::是否立即重启服务器
echo.
echo 键入"y"立即重启服务器
echo 键入"n"返回上一级菜单
echo 键入"x"退出批处理
choice /C ynx /CS
if %errorlevel% == 1 goto r
if %errorlevel% == 2 goto bc
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto ClearAuth

:r

title Minecraft Server-SakuraMaple_MCSL-vX-Preview
color %colorRunning%
::清空首次启动配置信息
if "%FirstStart%" neq "" set "FirstStart="
cls
::服务器参数引导
echo 警告:
echo 请勿在服务器正常运行中强行关闭!
echo 强行关闭可能导致存档信息丢失或损坏!
echo 若需要关闭服务器,请在服务器终端键入 stop 命令并按"Enter(回车/换行)"键关闭服务器!
echo 若遇见服务器无响应,再考虑采取强行关闭的措施!
echo 若使用"命令提示符"或"Windows Terminal",请勿使用光标左键在"命令提示符"或"Windows Terminal"选择文字!
echo 若需要复制请尽快完成选择并使用"Enter(回车/换行)"键复制!
echo 若不慎选择,请按任意方向键(上/下/左/右)脱离选择模式!
echo 选择模式下会倒是服务器进程被挂起,长时间挂起可能导致崩溃!
timeout /t 11

:rsr
cls
echo **当前认证服务器URL:%AuthURL%
echo **如果启用认证服务器,则必须在server.properties文件中
echo **设置online-mode=true,否则服务器将处于**离线模式**,认证服务器不生效
echo ************************服务器开始启动!************************
::服务器启动参数
"%JVM%" -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=16M -XX:-UseAdaptiveSizePolicy -XX:-OmitStackTraceInFastThrow -Xmx%XmxSize%m -Xms%XmsSize%m %XmnStatus% %XssStatus% %Auth% %ServerFile% %gui%
::服务器停止信息
color %colorError%

echo ************************服务器停止运行!************************

title Stop-XE-SakuraMaple_MCSL-vX-Preview
::自动重启引入(若未启用自动重启,则该函数为空值)
%Auto%

timeout /t 8

:e
::批处理功能菜单
color %colorChoose%
::清除认证服务器配置等待时间与默认选项
if "%waitTime%" neq "" set "waitTime="
if "%DefaultChoice%" neq "" set "DefaultChoice="
if "%AuthWaitTime%" neq "" set "AuthWaitTime="
if "%DefaultAuthURLChoice%" neq "" set "DefaultAuthURLChoice="
::批处理配置菜单
echo 请键入对应字母进行相应操作:
echo.
echo 键入"r"重新启动
echo 键入"l"进入认证选项(设置认证服务器)
echo 键入"x"关闭批处理
echo 键入"c"清空终端消息
echo 键入"v"查询IP地址与当前使用的Java版本
echo 键入"a"设置自动重启状态
echo 键入"t"进入许可协议配置菜单
echo 键入"s"切换服务器GUI显示状态(仅支持部分服务器核心)
echo 键入"4"切换服务器终止颜色(红/黄[默认])
echo 键入"0"下载authlib-injector(实验性:可能无法正常工作)
echo 键入"i"查询系统信息
::配置Up One Level为"MainConfig"
set "uol=MainConfig"

choice /C rxc4vlats0i /CS
if %errorlevel% == 1 goto r
if %errorlevel% == 2 goto x
if %errorlevel% == 3 goto c
if %errorlevel% == 4 goto Colorful
if %errorlevel% == 5 goto v
if %errorlevel% == 6 goto l
if %errorlevel% == 7 goto a
if %errorlevel% == 8 goto t
if %errorlevel% == 9 goto nogui
if %errorlevel% == 10 goto DownloadAuth
if %errorlevel% == 11 goto SystemInformation

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto e

:nogui

if "%gui%" == "" (
    echo.
    echo 已关闭GUI显示!
    set "gui=nogui"
    echo.
) else (
    echo.
    echo 已开启GUI显示!
    set "gui="
    echo.
)
goto bc

:a
::自动重启配置菜单
color %colorChoose%

title Auto Restart-SakuraMaple_MCSL-vX-Preview

echo 是否要启用服务器停止后自动重启(无人值守)?
echo.
echo 键入"y"开启自动重启
echo 键入"n"关闭自动重启
echo 键入"m"回批处理配置菜单
echo 键入"x"结束批处理运行
echo 键入"i"查询当前状态
::配置Up One Level为"AutoConfig"
set "uol=AuthConfig"

choice /C ynmxi /CS
if %errorlevel% == 1 goto SetAuto
if %errorlevel% == 2 goto ShutAuto
if %errorlevel% == 3 goto e
if %errorlevel% == 4 goto x
if %errorlevel% == 5 goto AutoInfo

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto a

:AutoInfo
::自动重启状态信息
color %colorChoose%

title Auto Reboot Information-SakuraMaple_MCSL-vX-Preview

if "%Auto%" == "" (
    echo 当前服务器自动重启服务处于关闭状态
) else (
    echo 当前服务器自动重启可能处于开启状态
    echo 变量信息:%Auto%
)
pause
goto a

:SetAuto
::自动重启变量写入与写入后选项菜单
color %colorChoose%
::写入函数信息
echo 正在配置自动重启变量……
set "Auto=goto AR"
::自动重启写入后选项菜单
echo.
echo 是否要立即启动?
echo 键入 y 立即重启
echo 键入 n 稍后重启(返回菜单后键入 r 重启)
echo 键入 x 退出批处理
echo 键入 i 查询状态信息并返回到菜单
choice /C ynxi /CS
if %errorlevel% == 1 goto rsr
if %errorlevel% == 2 goto e
if %errorlevel% == 3 goto x
if %errorlevel% == 4 goto AutoInfo

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto SetAuto

:ShutAuto
::自动重启变量清除
title Auto Reboot Configuration Clear-SakuraMaple_MCSL-vX-Preview

color %colorChoose%

echo 正在清除自动重启变量……
set "Auto="

goto e

:AR
::自动重启模块
color %colorChoose%
title Auto Reboot Menu-SakuraMaple_MCSL-vX-Preview
::自动重启选项菜单
::5s等待操作时间,若无操作,自动执行重启
echo 服务器自动重启选项
echo.
echo 键入"c"快速重启(默认值)
echo 键入"e"返回批处理配置菜单(不改变自动重启状态)
echo 键入"s"关闭自动重启,并返回批处理配置菜单
echo 键入"x"退出批处理
echo 等待超时后自动执行重启!

choice /T 5 /C cesx /CS /D c
if %errorlevel% == 1 goto rsr
if %errorlevel% == 2 goto e
if %errorlevel% == 3 goto shut
if %errorlevel% == 4 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto AR

:t
::Eula相关"回收"菜单
title Eula-XE-SakuraMaple_MCSL-vX-Preview
echo 请选择要执行的操作
if "%uol%" == "null" (
    echo 键入"r"重新运行协议检查进程^(包含创建协议文件与写入同意信息^)
    echo 键入"s"跳过协议检查开始启动
) else (
    echo 键入"r"运行协议检查进程
    echo 键入"s"忽略协议检查并启动
)
echo 键入"b"进入批处理配置
echo 键入"a"进入自动重启配置
echo 键入"c"撤销同意许可协议
echo 键入"x"关闭批处理
set "uol=EulaConfig"
choice /C rsbacx /CS
if %errorlevel% == 1 goto CheckEula
if %errorlevel% == 2 set "uol=FastConfig" && goto bc
if %errorlevel% == 3 goto e
if %errorlevel% == 4 goto a
if %errorlevel% == 5 goto FalseEula
if %errorlevel% == 6 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto t

:c
::清屏工具
color %colorError%

title Clear-XE-SakuraMaple_MCSL-vX-Preview

cls

echo ************************已清空************************

timeout /t 3

goto e

:v
::杂项工具
color %colorChoose%
title Configuration Information-SakuraMaple_MCSL-vX-Preview
cls
::JVM信息查询
echo 当前使用的Java信息:
"%JVM%" -version
echo.
pause
::IP地址信息查询
echo IP地址配置信息:
ipconfig
pause
::IP信息高级查询选项
::8s无操作执行返回批处理菜单
echo.
echo 键入 i 查看IP地址详细信息
echo 键入 b 返回到批处理菜单
choice /T 8 /C ib /CS /D b
if %errorlevel% == 1 goto ifconfig
if %errorlevel% == 2 goto e

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto v

:ifconfig
::所有IP信息查询
cls
ipconfig /all
pause

goto e

:DownloadAuth
color %colorWarning%
title Authentication Download-SakuraMaple_MCSL-vX-Preview
if "%waitTime%" neq "" set "waitTime="
if "%DefaultChoice%" neq "" set "DefaultChoice="
if "%DefaultAuthURLChoice%" neq "" set "DefaultAuthURLChoice="
if "%AuthWaitTime%" neq "" set "AuthWaitTime="
echo.
echo 本功能为实验性功能,不一定能正常工作!
echo.
echo 默认情况下,文件会被下载在当前批处理所在的目录下
echo **您所使用的安全软件可能拦截此行为,请点击允许!**
echo 根据网络环境不同,可能会下载失败,若没能完成下载,或下载文件大小为0字节
echo 请使用浏览器或下载器手动下载
echo 下载完成后将文件放到与该批处理同一个目录下
echo.
echo BMCLAPI:
echo https://bmclapi2.bangbang93.com/mirrors/authlib-injector/artifact/53/authlib-injector-1.2.5.jar
echo 官方:
echo https://authlib-injector.yushi.moe/artifact/53/authlib-injector-1.2.5.jar
echo.
echo 请选择下载源:
echo 键入"b"使用BMCLAPI下载源下载
echo 键入"o"使用官方下载源下载
echo 键入"u"返回上一级菜单
echo 键入"x"退出批处理
choice /C obux /CS
if %errorlevel% == 1 certutil -urlcache -split -f https://bmclapi2.bangbang93.com/mirrors/authlib-injector/artifact/53/authlib-injector-1.2.5.jar .\authlib-injector-1.2.5.jar && goto bc
if %errorlevel% == 2 certutil -urlcache -split -f https://authlib-injector.yushi.moe/artifact/53/authlib-injector-1.2.5.jar .\authlib-injector-1.2.5.jar && goto bc
if %errorlevel% == 3 goto bc
if %errorlevel% == 4 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto DownloadAuth

:CreateEula
::Eula协议文件创建
title Eula-XE-SakuraMaple_MCSL-vX-Preview
echo 正在创建…
type nul > .\eula.txt
goto WriteEula

:WriteEula
title Eula-XE-SakuraMaple_MCSL-vX-Preview
echo 正在写入…
echo eula=true> .\eula.txt
echo 正在重新运行检查…
goto CheckEula

:FalseEula
echo 撤销同意许可协议菜单
echo 键入"c"清除许可内容
echo 键入"d"删除许可文件
echo 键入"b"返回上一级菜单
echo 键入"i"查看当前许可协议状态(基于变量,可能不准确)
echo 键入"x"退出批处理
choice /C dcbix /CS
if %errorlevel% == 1 goto DeleteEula
if %errorlevel% == 2 goto ClearEula
if %errorlevel% == 3 goto bc
if %errorlevel% == 4 goto EulaInfo
if %errorlevel% == 5 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto FalseEula

:EulaInfo
if "%EulaFile%" == "1" (
    echo 许可协议文件存在!
) else (
    echo 许可协议文件 不 存在!
)
if "%EulaContent%" == "1" (
    echo 协议内容状态正常!
) else (
    echo 协议内容状态异常!
)

timeout /t 5
goto FalseEula

:ClearEula
if exist .\eula.txt (
    echo 这将会清空与本批处理同目录下的"eula.txt"文件的所有内容!
    goto ClearEulaChoice
) else (
    echo 没有找到协议文件!
    set "EulaFile=0"
    timeout /t 3
    goto FalseEula
)

:ClearEulaChoice
echo 是否继续?
echo 键入"y"执行清除命令,键入"n"返回到撤销许可协议菜单,键入"x"退出批处理
choice /C ynx /CS
if %errorlevel% == 1 goto ClearEulaRun
if %errorlevel% == 2 goto FalseEula
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto ClearEulaChoice

:ClearEulaRun
echo 正在清空…
echo echo "" 1>nul 2>eula.txt

findstr "" .\eula.txt >nul
if %errorlevel% == 2 (
    echo 清除成功!
    set "EulaContent=0"
    timeout /t 3
    goto ClearEulaRunChoice
) else (
    echo 清除出现错误!
    echo 可能是权限不足
    timeout /t 3
    goto ClearEulaError
)

:ClearEulaRunChoice
echo.
echo 键入"b"返回到撤销协议菜单
echo 键入"t"跳转到协议配置菜单
echo 键入"d"进一步删除eula协议文件
echo 键入"x"退出批处理
choice /C btdx /CS
if %errorlevel% == 1 goto FalseEula
if %errorlevel% == 2 goto t
if %errorlevel% == 3 goto DeleteEula
if %errorlevel% == 4 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto ClearEulaRunChoice

:ClearEulaError
echo 是否重试?
echo 键入"y"重试,键入"n"返回到撤销许可协议菜单,键入"x"退出批处理
choice /C yn /CS
if %errorlevel% == 1 goto ClearEula
if %errorlevel% == 2 goto FalseEula
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto ClearEulaError

:DeleteEula
if exist .\eula.txt (
    echo 确定要删除协议文件嘛?
    echo 注:这将会删除与批处理同目录下的 eula.txt 文件
    goto DeleteEulaChoice
) else (
    echo 没有找到协议文件!
    set "EulaFile=0"
    timeout /t 3
    goto FalseEula
)

:DeleteEulaChoice
echo 键入"y"执行删除命令,键入"n"返回到撤销许可协议菜单,键入"x"退出批处理
choice /C ynx /CS
if %errorlevel% == 1 goto DeleteEulaRun
if %errorlevel% == 2 goto FalseEula
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto DeleteEulaChoice

:DeleteEulaRun

del /F /Q -hr eula.txt
if exist .\eula.txt (
    echo 删除失败
    echo 请检查是否有权限删除
    goto DeleteEulaError
) else (
    echo 删除成功!
    set "EulaFile=0"
    set "EulaContent=0"
    timeout /t 3
    goto DeleteEulaRunChoice
)

:DeleteEulaRunChoice

echo 键入"b"返回到撤销协议菜单
echo 键入"t"跳转到协议配置菜单
echo 键入"x"退出批处理
choice /C btx /CS
if %errorlevel% == 1 goto FalseEula
if %errorlevel% == 2 goto t
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto DeleteEulaRunChoice

:DeleteEulaError
echo 是否重试?
echo 键入"y"再次执行删除,键入"n"返回到撤销协议菜单,键入"x"退出批处理
choice /C yn /CS
if %errorlevel% == 1 goto FalseEula
if %errorlevel% == 2 goto DeleteEula
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************发生异常************************

pause

goto DeleteEulaError

:SystemInformation
color %colorChoose%
title System-Information-SakuraMaple_MCSL-vX-Preview
systemInfo

pause

goto bc

:x
::批处理安全退出
title Exit-XE-SakuraMaple_MCSL-vX-Preview
color %colorError%
set "uol=Exit"
timeout /t 1

exit
