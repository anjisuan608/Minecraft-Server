::SakuraMaple Studio &copy; 2020-2024
@echo off
::�����ֲ���������ʾ
::If the text cannot be displayed properly
::��ʹ��GB 2312����鿴�ͱ༭�ļ�!
::Please use GB 2312 encoding to view and edit this file!
::���л���"UTF-8"����
::If switching to UTF-8 encoding
::���Ƴ��·�"@REM",��ȷ��������ʾ
::Please remove '@ REM' below to ensure proper display
@REM chcp 65001
title Loading-XE-SakuraMaple_MCSL-vX-Preview
cls
::������ɫ������Ϣ
set "colorError=06"
set "colorRunning=02"
set "colorWarning=03"
set "colorChoose=09"
::����Up One LevelΪ"null"
set "uol=null"
color %colorWarning%
::������Ϣ
::ϵͳʱ��
echo ��ǰϵͳʱ��: && time /t
::ϵͳ����
echo ��ǰϵͳ����: && date /t
::ϵͳ�汾
echo �������е�ϵͳ�汾: && ver
::��ǰ�û�
echo ������������û�: && whoami
::��������
echo ��������: && hostname
::IP������Ϣ
echo IP��ַ������Ϣ: && ipconfig
::����
echo.
::����JVM(Java·��)(֧�ֻ�������)
::·��һֱд��./bin/java.exe
set "JVM=java"
::���÷����������ļ�����,�ڱ����Ⱥź����(һֱ��д��.jar)
::������û��ʵ���jar�ļ�(�粿��Forge��NeoForge����,���������Ĳ���ͬ�����Եĺ���)�뽫�ñ���**����**,�����·�˵����д ServerTXT ����!
set "ServerJar=paper-1.8.8-445.jar"
::�������·������
::��ʹ�õ��ǲ���Forge��NeoForge�Ⱥ���,����Ŀ¼���ҵ�Forge��NeoForge��������װ�����ɵ�"run.bat"�ļ�
::�Ҽ�->�༭
::�ҵ����е�"java @user_jvm_args.txt @libraries/net/xxxforge/xxxforge/x.x.x-xx.xx.xx/win_args.txt %*"���
::���Ƶ��е�"@libraries/net/xxxforge/xxxforge/x.x.x-xx.xx.xx/win_args.txt"�ֶ�
::ճ�����·�ServerTXT�����ĵȺź���
::ע:����ؿ����ļ���չ(��׺)��!���е�run.sh�ļ�������Linuxƽ̨,�����Ƹ��ļ����ֶ�!
::�����ļ���չ����ʾ:�ļ���ѡ��->�鿴,���·���ѡ������ҵ�"������֪�ļ����͵���չ��"ȡ����ѡ,Ӧ�ò�ȷ��
::ע:�� ServerJar ����������ʱ, ServerTXT���� **����Ч**
set "ServerTXT=@libraries/net/minecraftforge/forge/1.20.1-47.2.20/win_args.txt"
::���ķ���(��û������ServerJar���������Ȳ���ServerJar�����е���������)
if "%ServerJar%" neq "" (
    set "ServerFile=-jar "%ServerJar%""
) else (
    set "ServerFile="%ServerTXT%""
)
::���÷������ڴ�,�������С
::����
::�������ڴ�(�ڱ����Ⱥź��������,��λMB)
set "XmxSize=8192"
::��С�ڴ�����(�ڱ����Ⱥź��������,��λMB)
set "XmsSize=4096"
::�߼�
::Xmn/Xss����/����(����Ϊ1ʱ����)
set "XmnTrue=0"
set "XssTrue=0"
::Xmn����
::�����������С(�ڱ����Ⱥź��������,��λMB)
::�����Ѵ�С=�������С + ���ϴ���С + �־ô���С
::�־ô�һ��̶���СΪ64m,���������������,�����С���ϴ���С
::��ֵ��ϵͳ����Ӱ��ϴ�
::Sun�ٷ��Ƽ�����Ϊ�����ѵ�3/8.
set "XmnSize=3072"
::Xss����
::����ÿ���̵߳Ķ�ջ��С(�ڱ����Ⱥź��������,��λMB)
set "XssSize=512"
::ʶ��ģ��
if "%XmnTrue%" == "1" set "XmnStatus=-Xmn%XmnSize%m"
if "%XssTrue%" == "1" set "XssStatus=-Xss%XssSize%m"
::��������
::���÷�����GUI״̬(����Ϊ��ʾGUI,"nogui"Ϊ����ʾGUI)
set "gui="
::�����Զ���ĵ�¼��֤������(�Ǳ�Ҫ,������!)
::ע:��Ԥ��LittleSkin��MUA
::���ʹ����������֤��������д���·������ĵȺź�
set "CustomAuthURL="
::�״������������Զ�������ѡ��ȴ�ʱ����״̬
set "waitTime=/T 22"
set "DefaultChoice=/D y"
::�״������������Զ�������֤�������ȴ�ʱ����״̬
set "AuthWaitTime=/T 8"
set "DefaultAuthURLChoice=/D l"

:bc
title Jump-XE-SakuraMaple_MCSL-vX-Preview
::��ת������-��ֵ
if "%uol%" == "null" set "BackCode=" && goto br
if "%uol%" == "AuthConfig" set "BackCode=l" && goto br
if "%uol%" == "AutoConfig" set "BackCode=a" && goto br
if "%uol%" == "MainConfig" set "BackCode=e" && goto br
if "%uol%" == "FastConfig" set "BackCode=f" && goto br
if "%uol%" == "EulaConfig" set "BackCode=t" && goto br
if "%uol%" == "running" set "BackCode=rsr" && goto br
::û��ƥ��,�Ʋ�����
set "ErrorCode=TeaPot" && goto br

:br
title Jump-XE-SakuraMaple_MCSL-vX-Preview
::��ת������-ִ��
if "%BackCode%" neq "" goto %BackCode%
::�쳣������ת
if "%ErrorCode%" == "TeaPot" echo "��ת�������������ش���,����ת�����������˵���" && timeout /t 3 && goto e

:CheckServerCoreConfig

if "%ServerJar%" neq "" (
    goto CheckServerCoreConfigJarFile
) else (
    goto CheckServerCoreConfigTXTFile
)

:CheckServerCoreConfigJarFile

if "%ServerJar%" neq "" (
    echo ��⵽�����ú���Jar�ļ�
    goto CheckServerCoreStatus
) else (
    goto ErrorServerCore
)

:CheckServerCoreConfigTXTFile

if "%ServerFile%" neq "" (
    echo ��⵽������txt�����ļ�
    goto FirstLaunch
) else (
    goto ErrorServerCore
)

:CheckServerCoreStatus

if exist .\%ServerJar% (
    echo ��⵽���õķ���������
    goto FirstLaunch
) else (
    echo δ�������õķ���������
    goto ErrorServerCore
)

:ErrorServerCore
set "colorError=04"
color %colorError%
echo ���õķ����������ļ�·������򲻴���,����ServerJar��ServerTXT�����Ƿ�������ȷ!
timeout /t 6
goto x

:FirstLaunch

echo ************************�����Լ�,����ֹͣ,�밴Ctrl+Cֹͣ����,�����������ֱ������************************
timeout /t 8



:CheckEula
echo ���ڼ�����Э��״̬��
::EulaЭ���ļ����
title Eula-XE-SakuraMaple_MCSL-vX-Preview
if exist .\eula.txt (
    echo ��⵽���Э���ļ�!
    set "EulaFile=1"
    goto ReadEula
) else (
    echo ��ⲻ�����Э���ļ�!
    set "EulaFile=0"
    echo.
    echo �Ƿ񴴽���д������?
    goto CheckEulaChoice
)

:CheckEulaChoice
::Э����ѡ��
echo ����"y"ȷ��,����"n"ȡ��,����"x"�ر�������
choice /C ynx /CS
if %errorlevel% == 1 goto CreateEula
if %errorlevel% == 2 goto t
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto CheckEulaChoice

:ReadEula
::EulaЭ���ļ���ȡ
title Eula-XE-SakuraMaple_MCSL-vX-Preview
::�ַ����
echo ���ڼ���ļ������ԡ�
::�˴�"eula"�ַ���Сд����
::�ض���"nul"��������
echo ע:�����ܼ��Сд�ַ�,��"true"Ϊ��д���ߴ�Сд�����Ի�ʶ��Ϊ������
findstr "eula=true" .\eula.txt >nul
if %errorlevel% == 0 (
    echo Э��ͬ����Ϣ����!
    ::����һ������EulaЭ�������ı���,���ﲻ��eula.txt����д����Ϣ,�����ں�������ʶ������
    set "EulaContent=1"
    timeout /t 3
    goto ReadEulaJump
) else (
    echo Э��ͬ����Ϣ������
    set "EulaContent=0"
    echo.
    echo �Ƿ�д^(ͬ��Э��^)^?
    goto ReadEulaChoice
)

:ReadEulaJump
::��תλ���ж�
if "%uol%" == "null" (
    goto f
) else (
    goto bc
)

:ReadEulaChoice
::Э���ȡѡ��
echo ����"y"ȷ��,����"n"ȡ��,����"x"�ر�������
choice /C ynx /CS
if %errorlevel% == 1 goto WriteEula
if %errorlevel% == 2 goto t
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto ReadEulaChoice

:f
color %colorChoose%
title Fest Boot-SakuraMaple_MCSL-vX-Preview
::FastConfig�������ò˵�
::����Up One LevelΪ"FastConfig"
set "uol=FastConfig"
if "%DefaultChoice%" == "/D y" (
    set "echoDefault=(Ĭ��)"
) else (
    set "echoDefault="
)
echo ******��������******
echo ����"y"������������������֤%echoDefault%
echo ����"n"��رշ�������������֤
echo ����"x"��������������
echo ����"m"���ø���ѡ��
echo ����"s"�л�������GUI��ʾ״̬(��֧�ֲ��ַ���������)
echo ����"4"�л���������ֹ��ɫ(��/��[Ĭ��])
choice %waitTime% /C ynx4ms /CS %DefaultChoice%
if %errorlevel% == 1 set "FirstStart=goto r" && goto AuthLibCheck
if %errorlevel% == 2 set "FirstStart=goto r" && goto ClearAuth
if %errorlevel% == 3 goto x
if %errorlevel% == 4 goto Colorful
if %errorlevel% == 5 goto e
if %errorlevel% == 6 goto nogui

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto f

:l
::��������֤�������ò˵�
color %colorChoose%
title Authentication Server-SakuraMaple_MCSL-vX-Preview
::���Ĭ��ѡ����ȴ�ʱ��
if "%waitTime%" neq "" set "waitTime="
if "%DefaultChoice%" neq "" set "DefaultChoice="
if "%DefaultAuthURLChoice%" neq "" set "DefaultAuthURLChoice="
if "%AuthWaitTime%" neq "" set "AuthWaitTime="
::��������֤����ѡ��
echo ��ѡ���Ƿ����õ�������֤(LittleSkin/MUA):
echo.
echo ����"y"������������������֤
echo ����"n"��رշ�������������֤
echo ����"x"��������������
echo ����"c"��������������
echo ����"i"��ѯ��ǰ��֤״̬
echo ����"s"�л�������GUI��ʾ״̬(��֧�ֲ��ַ���������)
echo ����"4"�л���������ֹ��ɫ(��/��[Ĭ��])
echo ����"0"����authlib-injector(ʵ����:�����޷���������)
::����Up One LevelΪ"AuthConfig"
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

echo ************************�����쳣************************

pause

goto l

:Colorful
::��ֹ��ɫ�ж����л�
if "%colorError%" == "06" (
    echo.
    set "colorError=04"
    echo �ѽ���ֹ��ɫ�л�Ϊ��ɫ
    echo.
    goto Preview
) else (
    echo.
    set "colorError=06"
    echo �ѽ���ֹ��ɫ�л�Ϊ��ɫ
    echo.
    goto Preview
)

:Preview
color %colorError%
pause

goto bc

:AuthLibCheck
echo ���ڼ��authlib-injector-1.2.5.jar�Ƿ���ڡ�
if exist .\authlib-injector-1.2.5.jar (
    echo �ɹ���⵽"authlib-injector-1.2.5.jar"!
    timeout /t 3
    goto ChoiceAuth
) else (
    echo û���ҵ�"authlib-injector-1.2.5.jar"!
    echo �Ƿ�ǰ������?
    goto AuthLibCheckChoice
)

:AuthLibCheckChoice
echo ����"y"ǰ������,����"n"ȡ�����ز�������֤����������,����"x"�ر�������
choice /C ynx /CS
if %errorlevel% == 1 goto DownloadAuth
if %errorlevel% == 2 goto l
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto AuthLibCheckChoice

:AuthInfo
::��������֤״̬��Ϣ
color %colorChoose%

title Authentication Information-SakuraMaple_MCSL-vX-Preview

echo.

if "%Auth%" == "" (
    echo ��ǰ��������֤�����ڹر�״̬!
) else (
    echo ��ǰ��������֤�����ڿ���״̬!
    echo ������Ϣ:%Auth%
)
goto l

:ChoiceAuth
::ѡ����֤������
if "%CustomAuthURL%" neq "" (
    echo ��⵽�������Զ������֤������!
    echo ��ǰ�Զ������֤������:%CustomAuthURL%
    echo �Ƿ�ֱ�����õ�ǰ�Զ������֤������?
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
    set "DefaultAuthURLEcho=(Ĭ��)"
) else (
    set "DefaultAuthURLEcho="
)

echo �Ƿ�Ҫ����ʹ��LittleSkin��Ϊ��֤������:
echo ���� y ����ʹ��LittleSkin��Ϊ��֤������%DefaultAuthURLEcho%
echo ���� n �� a ǰ����֤������ѡ���б�
echo ���� l ǰ����֤����������ѡ��
echo ���� x ��������������
choice %AuthWaitTime% /C ynalx /CS %DefaultAuthURLChoice%
if %errorlevel% == 1 set "AuthURL=https://littleskin.cn/api/yggdrasil" && goto SetAuth
if %errorlevel% == 2 goto ChoiceDefaultAuthServer
if %errorlevel% == 3 goto ChoiceDefaultAuthServer
if %errorlevel% == 4 goto l
if %errorlevel% == 5 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto FastChoiceDefaultAuthServer

:ChoiceDefaultAuthServer
::Ĭ����֤�������б�

echo ��ѡ��Ҫʹ�õĵ�������֤������:
echo ���� l ʹ��LittleSkin��Ϊ��֤������
echo ���� m ʹ��MUA(Minecraft��У����)��Ϊ��֤������
echo ���� c ʹ���Զ������֤������
echo ���� b ������һ���˵�
echo ���� x ��������������
choice /C lmcbx /CS 
if %errorlevel% == 1 set "AuthURL=https://littleskin.cn/api/yggdrasil" && goto SetAuth
if %errorlevel% == 2 set "AuthURL=https://skin.mualliance.ltd/api/union/yggdrasil" && goto SetAuth
if %errorlevel% == 3 goto CheckCustomAuthServer
if %errorlevel% == 4 goto bc
if %errorlevel% == 5 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto ChoiceDefaultAuthServer

:FastChoiceCustomAuthServer

echo ���� y ����%echoDefault%
echo ���� n ��Ĭ�ϵ���֤�������б���ѡ��
echo ���� a ��Ԥ�����֤�������б���ѡ��
echo ���� x ��������������
choice %AuthWaitTime% /C ynx /CS %DefaultChoice%
if %errorlevel% == 1 set "AuthURL=%CustomAuthURL%" && goto SetAuth
if %errorlevel% == 2 goto FastChoiceDefaultAuthServer
if %errorlevel% == 3 goto ChoiceDefaultAuthServer
if %errorlevel% == 4 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto FastChoiceCustomAuthServer

:ChoiceCustomAuthServer
echo ���� y ����
echo ���� n ��Ĭ�ϵ���֤�������б���ѡ��
echo ���� x ��������������
choice /C ynx /CS
if %errorlevel% == 1 set "AuthURL=%CustomAuthURL%" && goto SetAuth
if %errorlevel% == 2 goto ChoiceDefaultAuthServer
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto ChoiceCustomAuthServer

:CheckCustomAuthServer

if %CustomAuthURL% neq "" (
    set "AuthURL=%CustomAuthURL%"
    goto SetAuth
) else (
    echo û�м�⵽�Զ�����֤������������Ϣ!
    goto ChoiceDefaultAuthServer
)

:SetAuth
::������֤������Ϣ����
echo ����д����֤�����������
set "Auth=-javaagent:authlib-injector-1.2.5.jar=%AuthURL%"
timeout /t 1
::��һ��������Ϊ
%FirstStart%
::�Ƿ���������������
echo.
echo ����"y"��������/����������
echo ����"n"������һ���˵�
echo ����"x"�˳�������
choice /C ynx /CS
if %errorlevel% == 1 goto r
if %errorlevel% == 2 goto bc
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto SetAuth

:ClearAuth
::�����֤������Ϣ����
echo ���������֤�����������
set "AuthURL="
::��һ��������Ϊ
%FirstStart%
::�Ƿ���������������
echo.
echo ����"y"��������������
echo ����"n"������һ���˵�
echo ����"x"�˳�������
choice /C ynx /CS
if %errorlevel% == 1 goto r
if %errorlevel% == 2 goto bc
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto ClearAuth

:r

title Minecraft Server-SakuraMaple_MCSL-vX-Preview
color %colorRunning%
::����״�����������Ϣ
if "%FirstStart%" neq "" set "FirstStart="
cls
::��������������
echo ����:
echo �����ڷ���������������ǿ�йر�!
echo ǿ�йرտ��ܵ��´浵��Ϣ��ʧ����!
echo ����Ҫ�رշ�����,���ڷ������ն˼��� stop �����"Enter(�س�/����)"���رշ�����!
echo ����������������Ӧ,�ٿ��ǲ�ȡǿ�йرյĴ�ʩ!
echo ��ʹ��"������ʾ��"��"Windows Terminal",����ʹ�ù�������"������ʾ��"��"Windows Terminal"ѡ������!
echo ����Ҫ�����뾡�����ѡ��ʹ��"Enter(�س�/����)"������!
echo ������ѡ��,�밴���ⷽ���(��/��/��/��)����ѡ��ģʽ!
echo ѡ��ģʽ�»ᵹ�Ƿ��������̱�����,��ʱ�������ܵ��±���!
timeout /t 11

:rsr
cls
echo **��ǰ��֤������URL:%AuthURL%
echo **���������֤������,�������server.properties�ļ���
echo **����online-mode=true,���������������**����ģʽ**,��֤����������Ч
echo ************************��������ʼ����!************************
::��������������
"%JVM%" -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=16M -XX:-UseAdaptiveSizePolicy -XX:-OmitStackTraceInFastThrow -Xmx%XmxSize%m -Xms%XmsSize%m %XmnStatus% %XssStatus% %Auth% %ServerFile% %gui%
::������ֹͣ��Ϣ
color %colorError%

echo ************************������ֹͣ����!************************

title Stop-XE-SakuraMaple_MCSL-vX-Preview
::�Զ���������(��δ�����Զ�����,��ú���Ϊ��ֵ)
%Auto%

timeout /t 8

:e
::�������ܲ˵�
color %colorChoose%
::�����֤���������õȴ�ʱ����Ĭ��ѡ��
if "%waitTime%" neq "" set "waitTime="
if "%DefaultChoice%" neq "" set "DefaultChoice="
if "%AuthWaitTime%" neq "" set "AuthWaitTime="
if "%DefaultAuthURLChoice%" neq "" set "DefaultAuthURLChoice="
::���������ò˵�
echo ������Ӧ��ĸ������Ӧ����:
echo.
echo ����"r"��������
echo ����"l"������֤ѡ��(������֤������)
echo ����"x"�ر�������
echo ����"c"����ն���Ϣ
echo ����"v"��ѯIP��ַ�뵱ǰʹ�õ�Java�汾
echo ����"a"�����Զ�����״̬
echo ����"t"�������Э�����ò˵�
echo ����"s"�л�������GUI��ʾ״̬(��֧�ֲ��ַ���������)
echo ����"4"�л���������ֹ��ɫ(��/��[Ĭ��])
echo ����"0"����authlib-injector(ʵ����:�����޷���������)
echo ����"i"��ѯϵͳ��Ϣ
::����Up One LevelΪ"MainConfig"
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

echo ************************�����쳣************************

pause

goto e

:nogui

if "%gui%" == "" (
    echo.
    echo �ѹر�GUI��ʾ!
    set "gui=nogui"
    echo.
) else (
    echo.
    echo �ѿ���GUI��ʾ!
    set "gui="
    echo.
)
goto bc

:a
::�Զ��������ò˵�
color %colorChoose%

title Auto Restart-SakuraMaple_MCSL-vX-Preview

echo �Ƿ�Ҫ���÷�����ֹͣ���Զ�����(����ֵ��)?
echo.
echo ����"y"�����Զ�����
echo ����"n"�ر��Զ�����
echo ����"m"�����������ò˵�
echo ����"x"��������������
echo ����"i"��ѯ��ǰ״̬
::����Up One LevelΪ"AutoConfig"
set "uol=AuthConfig"

choice /C ynmxi /CS
if %errorlevel% == 1 goto SetAuto
if %errorlevel% == 2 goto ShutAuto
if %errorlevel% == 3 goto e
if %errorlevel% == 4 goto x
if %errorlevel% == 5 goto AutoInfo

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto a

:AutoInfo
::�Զ�����״̬��Ϣ
color %colorChoose%

title Auto Reboot Information-SakuraMaple_MCSL-vX-Preview

if "%Auto%" == "" (
    echo ��ǰ�������Զ����������ڹر�״̬
) else (
    echo ��ǰ�������Զ��������ܴ��ڿ���״̬
    echo ������Ϣ:%Auto%
)
pause
goto a

:SetAuto
::�Զ���������д����д���ѡ��˵�
color %colorChoose%
::д�뺯����Ϣ
echo ���������Զ�������������
set "Auto=goto AR"
::�Զ�����д���ѡ��˵�
echo.
echo �Ƿ�Ҫ��������?
echo ���� y ��������
echo ���� n �Ժ�����(���ز˵������ r ����)
echo ���� x �˳�������
echo ���� i ��ѯ״̬��Ϣ�����ص��˵�
choice /C ynxi /CS
if %errorlevel% == 1 goto rsr
if %errorlevel% == 2 goto e
if %errorlevel% == 3 goto x
if %errorlevel% == 4 goto AutoInfo

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto SetAuto

:ShutAuto
::�Զ������������
title Auto Reboot Configuration Clear-SakuraMaple_MCSL-vX-Preview

color %colorChoose%

echo ��������Զ�������������
set "Auto="

goto e

:AR
::�Զ�����ģ��
color %colorChoose%
title Auto Reboot Menu-SakuraMaple_MCSL-vX-Preview
::�Զ�����ѡ��˵�
::5s�ȴ�����ʱ��,���޲���,�Զ�ִ������
echo �������Զ�����ѡ��
echo.
echo ����"c"��������(Ĭ��ֵ)
echo ����"e"�������������ò˵�(���ı��Զ�����״̬)
echo ����"s"�ر��Զ�����,���������������ò˵�
echo ����"x"�˳�������
echo �ȴ���ʱ���Զ�ִ������!

choice /T 5 /C cesx /CS /D c
if %errorlevel% == 1 goto rsr
if %errorlevel% == 2 goto e
if %errorlevel% == 3 goto shut
if %errorlevel% == 4 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto AR

:t
::Eula���"����"�˵�
title Eula-XE-SakuraMaple_MCSL-vX-Preview
echo ��ѡ��Ҫִ�еĲ���
if "%uol%" == "null" (
    echo ����"r"��������Э�������^(��������Э���ļ���д��ͬ����Ϣ^)
    echo ����"s"����Э���鿪ʼ����
) else (
    echo ����"r"����Э�������
    echo ����"s"����Э���鲢����
)
echo ����"b"��������������
echo ����"a"�����Զ���������
echo ����"c"����ͬ�����Э��
echo ����"x"�ر�������
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

echo ************************�����쳣************************

pause

goto t

:c
::��������
color %colorError%

title Clear-XE-SakuraMaple_MCSL-vX-Preview

cls

echo ************************�����************************

timeout /t 3

goto e

:v
::�����
color %colorChoose%
title Configuration Information-SakuraMaple_MCSL-vX-Preview
cls
::JVM��Ϣ��ѯ
echo ��ǰʹ�õ�Java��Ϣ:
"%JVM%" -version
echo.
pause
::IP��ַ��Ϣ��ѯ
echo IP��ַ������Ϣ:
ipconfig
pause
::IP��Ϣ�߼���ѯѡ��
::8s�޲���ִ�з���������˵�
echo.
echo ���� i �鿴IP��ַ��ϸ��Ϣ
echo ���� b ���ص�������˵�
choice /T 8 /C ib /CS /D b
if %errorlevel% == 1 goto ifconfig
if %errorlevel% == 2 goto e

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto v

:ifconfig
::����IP��Ϣ��ѯ
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
echo ������Ϊʵ���Թ���,��һ������������!
echo.
echo Ĭ�������,�ļ��ᱻ�����ڵ�ǰ���������ڵ�Ŀ¼��
echo **����ʹ�õİ�ȫ����������ش���Ϊ,��������!**
echo �������绷����ͬ,���ܻ�����ʧ��,��û���������,�������ļ���СΪ0�ֽ�
echo ��ʹ����������������ֶ�����
echo ������ɺ��ļ��ŵ����������ͬһ��Ŀ¼��
echo.
echo BMCLAPI:
echo https://bmclapi2.bangbang93.com/mirrors/authlib-injector/artifact/53/authlib-injector-1.2.5.jar
echo �ٷ�:
echo https://authlib-injector.yushi.moe/artifact/53/authlib-injector-1.2.5.jar
echo.
echo ��ѡ������Դ:
echo ����"b"ʹ��BMCLAPI����Դ����
echo ����"o"ʹ�ùٷ�����Դ����
echo ����"u"������һ���˵�
echo ����"x"�˳�������
choice /C obux /CS
if %errorlevel% == 1 certutil -urlcache -split -f https://bmclapi2.bangbang93.com/mirrors/authlib-injector/artifact/53/authlib-injector-1.2.5.jar .\authlib-injector-1.2.5.jar && goto bc
if %errorlevel% == 2 certutil -urlcache -split -f https://authlib-injector.yushi.moe/artifact/53/authlib-injector-1.2.5.jar .\authlib-injector-1.2.5.jar && goto bc
if %errorlevel% == 3 goto bc
if %errorlevel% == 4 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto DownloadAuth

:CreateEula
::EulaЭ���ļ�����
title Eula-XE-SakuraMaple_MCSL-vX-Preview
echo ���ڴ�����
type nul > .\eula.txt
goto WriteEula

:WriteEula
title Eula-XE-SakuraMaple_MCSL-vX-Preview
echo ����д�롭
echo eula=true> .\eula.txt
echo �����������м�顭
goto CheckEula

:FalseEula
echo ����ͬ�����Э��˵�
echo ����"c"����������
echo ����"d"ɾ������ļ�
echo ����"b"������һ���˵�
echo ����"i"�鿴��ǰ���Э��״̬(���ڱ���,���ܲ�׼ȷ)
echo ����"x"�˳�������
choice /C dcbix /CS
if %errorlevel% == 1 goto DeleteEula
if %errorlevel% == 2 goto ClearEula
if %errorlevel% == 3 goto bc
if %errorlevel% == 4 goto EulaInfo
if %errorlevel% == 5 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto FalseEula

:EulaInfo
if "%EulaFile%" == "1" (
    echo ���Э���ļ�����!
) else (
    echo ���Э���ļ� �� ����!
)
if "%EulaContent%" == "1" (
    echo Э������״̬����!
) else (
    echo Э������״̬�쳣!
)

timeout /t 5
goto FalseEula

:ClearEula
if exist .\eula.txt (
    echo �⽫������뱾������ͬĿ¼�µ�"eula.txt"�ļ�����������!
    goto ClearEulaChoice
) else (
    echo û���ҵ�Э���ļ�!
    set "EulaFile=0"
    timeout /t 3
    goto FalseEula
)

:ClearEulaChoice
echo �Ƿ����?
echo ����"y"ִ���������,����"n"���ص��������Э��˵�,����"x"�˳�������
choice /C ynx /CS
if %errorlevel% == 1 goto ClearEulaRun
if %errorlevel% == 2 goto FalseEula
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto ClearEulaChoice

:ClearEulaRun
echo ������ա�
echo echo "" 1>nul 2>eula.txt

findstr "" .\eula.txt >nul
if %errorlevel% == 2 (
    echo ����ɹ�!
    set "EulaContent=0"
    timeout /t 3
    goto ClearEulaRunChoice
) else (
    echo ������ִ���!
    echo ������Ȩ�޲���
    timeout /t 3
    goto ClearEulaError
)

:ClearEulaRunChoice
echo.
echo ����"b"���ص�����Э��˵�
echo ����"t"��ת��Э�����ò˵�
echo ����"d"��һ��ɾ��eulaЭ���ļ�
echo ����"x"�˳�������
choice /C btdx /CS
if %errorlevel% == 1 goto FalseEula
if %errorlevel% == 2 goto t
if %errorlevel% == 3 goto DeleteEula
if %errorlevel% == 4 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto ClearEulaRunChoice

:ClearEulaError
echo �Ƿ�����?
echo ����"y"����,����"n"���ص��������Э��˵�,����"x"�˳�������
choice /C yn /CS
if %errorlevel% == 1 goto ClearEula
if %errorlevel% == 2 goto FalseEula
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto ClearEulaError

:DeleteEula
if exist .\eula.txt (
    echo ȷ��Ҫɾ��Э���ļ���?
    echo ע:�⽫��ɾ����������ͬĿ¼�µ� eula.txt �ļ�
    goto DeleteEulaChoice
) else (
    echo û���ҵ�Э���ļ�!
    set "EulaFile=0"
    timeout /t 3
    goto FalseEula
)

:DeleteEulaChoice
echo ����"y"ִ��ɾ������,����"n"���ص��������Э��˵�,����"x"�˳�������
choice /C ynx /CS
if %errorlevel% == 1 goto DeleteEulaRun
if %errorlevel% == 2 goto FalseEula
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto DeleteEulaChoice

:DeleteEulaRun

del /F /Q -hr eula.txt
if exist .\eula.txt (
    echo ɾ��ʧ��
    echo �����Ƿ���Ȩ��ɾ��
    goto DeleteEulaError
) else (
    echo ɾ���ɹ�!
    set "EulaFile=0"
    set "EulaContent=0"
    timeout /t 3
    goto DeleteEulaRunChoice
)

:DeleteEulaRunChoice

echo ����"b"���ص�����Э��˵�
echo ����"t"��ת��Э�����ò˵�
echo ����"x"�˳�������
choice /C btx /CS
if %errorlevel% == 1 goto FalseEula
if %errorlevel% == 2 goto t
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto DeleteEulaRunChoice

:DeleteEulaError
echo �Ƿ�����?
echo ����"y"�ٴ�ִ��ɾ��,����"n"���ص�����Э��˵�,����"x"�˳�������
choice /C yn /CS
if %errorlevel% == 1 goto FalseEula
if %errorlevel% == 2 goto DeleteEula
if %errorlevel% == 3 goto x

color %colorError%

title Error-XE-SakuraMaple_MCSL-vX-Preview

echo ************************�����쳣************************

pause

goto DeleteEulaError

:SystemInformation
color %colorChoose%
title System-Information-SakuraMaple_MCSL-vX-Preview
systemInfo

pause

goto bc

:x
::������ȫ�˳�
title Exit-XE-SakuraMaple_MCSL-vX-Preview
color %colorError%
set "uol=Exit"
timeout /t 1

exit
