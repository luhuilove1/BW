@set dt=%date:~0,10%
@set dt=%dt:/=-%
set drive=M:
@set programfile=C:\Program Files\
rem set drive=~d0

xcopy %~dp0\ReleaseCodeMeter32\*.* %drive%\ReleaseCodeMeter32\ /s /e /y

del %drive%\setup.exe
del %drive%\setupwb.exe
del %drive%\Release32\TX_IRealEntity.dll
del %drive%\Release32\TX_ProxyEntity.dll
del %drive%\Release32\TX_NetEntity.dll

copy %drive%\Release32\*.dll %drive%\ReleaseXencode32\
copy %drive%\Release32\TX_*.exe %drive%\ReleaseXencode32\

del %drive%\ReleaseXencode32\TX_BaseEntity.dll
del %drive%\ReleaseXencode32\TX_BaseKit.dll
del %drive%\ReleaseXencode32\TX_TOOLBOX.dll
del %drive%\ReleaseXencode32\TX_VAEntity.dll
del %drive%\ReleaseXencode32\TX_VBEntity.dll

"%programfile%\Xenocode\Postbuild 2010 for .NET\XBuild.exe" %~dp0\TX_XenoCode_32.postbuild

copy %drive%\ReleaseXencode32\TX_*.dll %drive%\ReleaseCodeMeter32\
copy %drive%\ReleaseXencode32\TX_*.exe %drive%\ReleaseCodeMeter32\

del %drive%\ReleaseCodeMeter32\TX_BaseEntity.dll
"%programfile%\WIBU-SYSTEMS\AxProtector\Devkit\bin\AxProtectorNet.exe" @%~dp0\TX_CodeMeter_32.wbc


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
"%programfile%\Inno Setup 5\compil32" /cc %~dp0\TX_InnoSetup_BridgeWise32_2012.iss
copy %drive%\BridgeWise32For2012.exe %drive%\BridgeWiseFor2012(%dt%)(32Œªº”√‹À¯∞Ê±æ).exe