@echo off


      SET HOUR=%time:~0,2%
      SET dtStamp9=%date:~-2%%date:~4,2%%date:~7,2%-0%time:~1,1%%time:~3,2%
      SET dtStamp24=%date:~-2%%date:~4,2%%date:~7,2%-%time:~0,2%%time:~3,2%

      if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)


title [220X.%dtStamp%.prerelease] [Build preparation] [Packing Binaries]
REM rmdir /Q /S ..\..\LGE-SM8150-Drivers-Release
REM mkdir ..\..\LGE-SM8150-Drivers-Release

rmdir /Q /S LGE-SM8150-Drivers-Full

mkdir LGE-SM8150-Drivers-Full
mkdir LGE-SM8150-Drivers-Full\components
mkdir LGE-SM8150-Drivers-Full\definitions
xcopy /cheriky ..\components\ANYSOC LGE-SM8150-Drivers-Full\components\ANYSOC
xcopy /cheriky ..\components\QC8150 LGE-SM8150-Drivers-Full\components\QC8150
xcopy /cheriky ..\definitions\Desktop LGE-SM8150-Drivers-Full\definitions\Desktop
copy ..\DriverUpdater.exe LGE-SM8150-Drivers-Full\DriverUpdater.exe

rmdir /Q /S LGE-SM8150-Drivers-Full\components\QC8150\Device\DEVICE.SOC_QC8150.EPSILON
rmdir /Q /S LGE-SM8150-Drivers-Full\components\QC8150\Device\DEVICE.SOC_QC8150.EPSILON_MINIMAL
rmdir /Q /S LGE-SM8150-Drivers-Full\components\QC8150\Graphics\GRAPHICS.SOC_QC8150.EPSILON_DESKTOP
rmdir /Q /S LGE-SM8150-Drivers-Full\components\QC8150\Graphics\GRAPHICS.SOC_QC8150.EPSILON_DESKTOP_WDDM25
rmdir /Q /S LGE-SM8150-Drivers-Full\components\QC8150\Graphics\GRAPHICS.SOC_QC8150.EPSILON_DESKTOP_WDDM26
rmdir /Q /S LGE-SM8150-Drivers-Full\components\QC8150\Graphics\GRAPHICS.SOC_QC8150.EPSILON_WCOS
rmdir /Q /S LGE-SM8150-Drivers-Full\components\QC8150\Graphics\GRAPHICS.SOC_QC8150.EPSILON_WCOS_WDDM25
rmdir /Q /S LGE-SM8150-Drivers-Full\components\QC8150\Graphics\GRAPHICS.SOC_QC8150.EPSILON_WCOS_WDDM26

"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\LGE-SM8150-Drivers-Release\LGE-SM8150-Drivers-Full.zip LGE-SM8150-Drivers-Full\*

REM move LGE-SM8150-Drivers-Full\components\ANYSOC ..\components\ANYSOC
REM move LGE-SM8150-Drivers-Full\components\QC8150 ..\components\QC8150
REM move LGE-SM8150-Drivers-Full\definitions\Desktop ..\definitions\Desktop

rmdir /Q /S LGE-SM8150-Drivers-Full