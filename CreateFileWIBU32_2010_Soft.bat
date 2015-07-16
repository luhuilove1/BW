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


del %drive%\ReleaseCodeMeter32\TX_BaseEntity.dll
rem del %drive%\ReleaseCodeMeter32\TX_BaseKit.dll
del %drive%\ReleaseCodeMeter32\TX_IllustratorNet.dll
del %drive%\ReleaseCodeMeter32\TX_VAEntity.dll
del %drive%\ReleaseCodeMeter32\TX_VBEntity.dll
del %drive%\ReleaseCodeMeter32\TX_VCEntity.dll
del %drive%\ReleaseCodeMeter32\TX_VBEntityPlugIn.dll

"%programfile%\WIBU-SYSTEMS\AxProtector\Devkit\bin\AxProtectorNet.exe" @%~dp0\TX_32_IxSoft_BaseEntity.xml
"%programfile%\WIBU-SYSTEMS\AxProtector\Devkit\bin\AxProtectorNet.exe" @%~dp0\TX_32_IxSoft_BaseKit.xml
"%programfile%\WIBU-SYSTEMS\AxProtector\Devkit\bin\AxProtectorNet.exe" @%~dp0\TX_32_IxSoft_IllustratorNet.xml
"%programfile%\WIBU-SYSTEMS\AxProtector\Devkit\bin\AxProtectorNet.exe" @%~dp0\TX_32_IxSoft_VAEntity.xml
"%programfile%\WIBU-SYSTEMS\AxProtector\Devkit\bin\AxProtectorNet.exe" @%~dp0\TX_32_IxSoft_VBEntity.xml


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
copy %drive%\ReleaseCodeMeter32\TX_Option\TX_Option_FangSong.xml %drive%\ReleaseCodeMeter32\TX_Option.xml
"%programfile%\Inno Setup 5\compil32" /cc %~dp0\TX_InnoSetup_BridgeWise32_2010.iss
copy %drive%\BridgeWise32For2010.exe %drive%\BridgeWiseFor2010(%dt%)(32Î»Soft°æ).exe