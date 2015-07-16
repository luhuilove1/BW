@set dt=%date:~0,10%
@set dt=%dt:/=-%
set drive=M:
@set programfile=C:\Program Files (x86)\
rem set drive=~d0

xcopy %~dp0\ReleaseCodeMeter32\*.* %drive%\ReleaseCodeMeter64\ /s /e /y

del %drive%\setup.exe
del %drive%\setupwb.exe
del %drive%\ReleaseXencode64\*.dll
del %drive%\ReleaseCodeMeter64\*.dll

copy %~dp0\Release64\*.* %drive%\Release64\

copy %drive%\Release64\*.dll %drive%\ReleaseXencode64\
copy %drive%\Release64\TX_*.exe %drive%\ReleaseXencode64\
copy %drive%\Release64\wupi.net.dll %drive%\ReleaseXencode64\
copy %drive%\Release64\WupiEngineNet.dll %drive%\ReleaseXencode64\

copy %drive%\ReleaseXencode64\TX_*.dll %drive%\ReleaseCodeMeter64\
copy %drive%\ReleaseXencode64\TX_*.exe %drive%\ReleaseCodeMeter64\
copy %drive%\ReleaseXencode64\wupi.net.dll %drive%\ReleaseCodeMeter64\
copy %drive%\ReleaseXencode64\WupiEngineNet.dll %drive%\ReleaseCodeMeter64\


rem del %drive%\ReleaseXencode64\TX_VAEntity.dll
rem del %drive%\ReleaseXencode64\TX_VBEntity.dll
del %drive%\ReleaseXencode64\TX_VCEntity.dll
rem "%programfile%\Xenocode\Postbuild 2010 for .NET\XBuild.exe" %~dp0\TX_XenoCode_64.postbuild


del %drive%\ReleaseCodeMeter64\TX_BaseKit.dll
del %drive%\ReleaseCodeMeter64\TX_BaseEntity.dll
del %drive%\ReleaseCodeMeter64\TX_IllustratorNet.dll
del %drive%\ReleaseCodeMeter64\TX_VAEntity.dll
del %drive%\ReleaseCodeMeter64\TX_VBEntity.dll
del %drive%\ReleaseCodeMeter64\TX_VBEntityPlugIn.dll
"%programfile%\WIBU-SYSTEMS\AxProtector\Devkit\bin\AxProtectorNet.exe" @%~dp0\TX_64_Ix_BaseKit.xml
"%programfile%\WIBU-SYSTEMS\AxProtector\Devkit\bin\AxProtectorNet.exe" @%~dp0\TX_64_Ix_BaseEntity.xml
"%programfile%\WIBU-SYSTEMS\AxProtector\Devkit\bin\AxProtectorNet.exe" @%~dp0\TX_64_Ix_IllustratorNet.xml
"%programfile%\WIBU-SYSTEMS\AxProtector\Devkit\bin\AxProtectorNet.exe" @%~dp0\TX_64_Ix_VAEntity.xml
"%programfile%\WIBU-SYSTEMS\AxProtector\Devkit\bin\AxProtectorNet.exe" @%~dp0\TX_64_Ix_VBEntity.xml


del %drive%\ReleaseCodeMeter64\Debug.log
del %drive%\ReleaseCodeMeter64\acad.err
del %drive%\ReleaseCodeMeter64\*.ini
del %drive%\ReleaseCodeMeter64\UserMsg.bmp
del %drive%\ReleaseCodeMeter64\TX_illPic\acaddoc.lsp
del %drive%\ReleaseCodeMeter64\TX_illPic\acad.err
del %drive%\ReleaseCodeMeter64\TX_illPic\plot.log
del %drive%\ReleaseCodeMeter64\TX_Help\acaddoc.lsp
del %drive%\ReleaseCodeMeter64\TX_FrameFile\acaddoc.lsp
del %drive%\ReleaseCodeMeter32\*.vshost.exe

del %drive%\ReleaseCodeMeter64\TX_Option.xml
copy %drive%\ReleaseCodeMeter64\TX_Option\TX_Option_TJAD.xml %drive%\ReleaseCodeMeter64\TX_Option.xml
"%programfile%\Inno Setup 5\compil32" /cc %~dp0\TX_InnoSetup_64.iss
copy %drive%\setup.exe %drive%\setupwb64(%dt%).exe


del %drive%\ReleaseCodeMeter64\TX_Option.xml
copy %drive%\ReleaseCodeMeter64\TX_Option\TX_Option_FangSong.xml %drive%\ReleaseCodeMeter64\TX_Option.xml
"%programfile%\Inno Setup 5\compil32" /cc %~dp0\TX_InnoSetup_BridgeWise64_2010.iss
copy %drive%\BridgeWise64For2010.exe %drive%\BridgeWiseFor2010(%dt%)(64λ��������).exe

del %~dp0\ReleaseCodeMeter64\*.dll