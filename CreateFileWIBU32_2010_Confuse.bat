@set dt=%date:~0,10%
@set dt=%dt:/=-%
set drive=M:
@set programfile=C:\Program Files\
rem set drive=~d0

xcopy %~dp0\ReleaseCodeMeter32\*.* %drive%\ReleaseCodeMeter32\ /s /e /y

del %drive%\setup.exe
del %drive%\setupwb.exe
del %drive%\ReleaseXencode32\*.dll
del %drive%\ReleaseCodeMeter32\*.dll

copy %~dp0\Release32\*.* %drive%\Release32\

copy %drive%\Release32\*.dll %drive%\ReleaseXencode32\
copy %drive%\Release32\TX_*.exe %drive%\ReleaseXencode32\
copy %drive%\Release32\wupi.net.dll %drive%\ReleaseXencode32\
copy %drive%\Release32\WupiEngineNet.dll %drive%\ReleaseXencode32\

copy %drive%\ReleaseXencode32\TX_*.dll %drive%\ReleaseCodeMeter32\
copy %drive%\ReleaseXencode32\TX_*.exe %drive%\ReleaseCodeMeter32\
copy %drive%\ReleaseXencode32\wupi.net.dll %drive%\ReleaseCodeMeter32\
copy %drive%\ReleaseXencode32\WupiEngineNet.dll %drive%\ReleaseCodeMeter32\


del %drive%\ReleaseXencode32\TX_VAEntity.dll
del %drive%\ReleaseXencode32\TX_VBEntity.dll
del %drive%\ReleaseXencode32\TX_VCEntity.dll
"%programfile%\Xenocode\Postbuild 2010 for .NET\XBuild.exe" %~dp0\TX_XenoCode_32.postbuild


del %drive%\ReleaseCodeMeter32\TX_BaseKit.dll
del %drive%\ReleaseCodeMeter32\TX_BaseEntity.dll
del %drive%\ReleaseCodeMeter32\TX_IllustratorNet.dll
del %drive%\ReleaseCodeMeter32\TX_VAEntity.dll
del %drive%\ReleaseCodeMeter32\TX_VBEntity.dll
del %drive%\ReleaseCodeMeter32\TX_VBEntityPlugIn.dll
"%programfile%\WIBU-SYSTEMS\AxProtector\Devkit\bin\AxProtectorNet.exe" @%~dp0\TX_32_Ix_BaseKit.xml
"%programfile%\WIBU-SYSTEMS\AxProtector\Devkit\bin\AxProtectorNet.exe" @%~dp0\TX_32_Ix_BaseEntity.xml
"%programfile%\WIBU-SYSTEMS\AxProtector\Devkit\bin\AxProtectorNet.exe" @%~dp0\TX_32_Ix_IllustratorNet.xml
"%programfile%\WIBU-SYSTEMS\AxProtector\Devkit\bin\AxProtectorNet.exe" @%~dp0\TX_32_Ix_VAEntity.xml
"%programfile%\WIBU-SYSTEMS\AxProtector\Devkit\bin\AxProtectorNet.exe" @%~dp0\TX_32_Ix_VBEntity.xml


del %drive%\ReleaseCodeMeter32\Debug.log
del %drive%\ReleaseCodeMeter32\acad.err
del %drive%\ReleaseCodeMeter32\*.ini
del %drive%\ReleaseCodeMeter32\UserMsg.bmp
del %drive%\ReleaseCodeMeter32\TX_illPic\acaddoc.lsp
del %drive%\ReleaseCodeMeter32\TX_illPic\acad.err
del %drive%\ReleaseCodeMeter32\TX_illPic\plot.log
del %drive%\ReleaseCodeMeter32\TX_Help\acaddoc.lsp
del %drive%\ReleaseCodeMeter32\TX_FrameFile\acaddoc.lsp
del %drive%\ReleaseCodeMeter32\*.vshost.exe

del %drive%\ReleaseCodeMeter32\TX_Option.xml
copy %drive%\ReleaseCodeMeter32\TX_Option\TX_Option_TJAD.xml %drive%\ReleaseCodeMeter32\TX_Option.xml
"%programfile%\Inno Setup 5\compil32" /cc %~dp0\TX_InnoSetup_32.iss
copy %drive%\setup.exe %drive%\setupwb32(%dt%).exe


del %drive%\ReleaseCodeMeter32\TX_Option.xml
copy %drive%\ReleaseCodeMeter32\TX_Option\TX_Option_FangSong.xml %drive%\ReleaseCodeMeter32\TX_Option.xml
"%programfile%\Inno Setup 5\compil32" /cc %~dp0\TX_InnoSetup_BridgeWise32_2010.iss
copy %drive%\BridgeWise32For2010.exe %drive%\BridgeWiseFor2010(%dt%)(32位加密锁版).exe


"%programfile%\WinRAR\winrar.exe" a -as -r -ag(YYYY年MM月DD日HH时MM分) "E:\0.代码备份\TX_ToolBox2010_CS_32" "*.cs"

del %~dp0\ReleaseCodeMeter32\*.dll
rem copy %drive%\ReleaseCodeMeter32\TX_BaseEntity.dll %~dp0\ReleaseCodeMeter32\TX_BaseEntity.dll
rem copy %drive%\ReleaseCodeMeter32\TX_BaseKit.dll %~dp0\ReleaseCodeMeter32\TX_BaseKit.dll
rem copy %drive%\ReleaseCodeMeter32\TX_VAEntity.dll %~dp0\ReleaseCodeMeter32\TX_VAEntity.dll
rem copy %drive%\ReleaseCodeMeter32\TX_VBEntity.dll %~dp0\ReleaseCodeMeter32\TX_VBEntity.dll
