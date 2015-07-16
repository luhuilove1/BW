@set dt=%date:~0,10%
@set dt=%dt:/=-%
@set drive=M:
@set programfile=C:\Program Files (x86)\


xcopy %~dp0\ReleaseCodeMeter32\*.* %drive%\ReleaseCodeMeter64\ /s /e /y

del %drive%\setup.exe
del %drive%\setupwb.exe
del %drive%\Release64\TX_IRealEntity.dll
del %drive%\Release64\TX_ProxyEntity.dll
del %drive%\Release64\TX_NetEntity.dll

copy %drive%\Release64\*.dll %drive%\ReleaseXencode64\
copy %drive%\Release64\TX_*.exe %drive%\ReleaseXencode64\

del %drive%\ReleaseXencode32\TX_BaseEntity.dll
del %drive%\ReleaseXencode32\TX_BaseKit.dll
del %drive%\ReleaseXencode32\TX_TOOLBOX.dll
del %drive%\ReleaseXencode32\TX_VAEntity.dll
del %drive%\ReleaseXencode32\TX_VBEntity.dll

"%programfile%\Eziriz\.NET Reactor\dotNET_Reactor.Console.exe" -file "M:\Release64\TX_BaseEntity.dll" -targetfile "M:\ReleaseXencode64\<AssemblyFileName>"
"%programfile%\Eziriz\.NET Reactor\dotNET_Reactor.Console.exe" -file "M:\Release64\TX_BaseKit.dll" -targetfile "M:\ReleaseXencode64\<AssemblyFileName>"
"%programfile%\Eziriz\.NET Reactor\dotNET_Reactor.Console.exe" -file "M:\Release64\TX_ToolBox.dll" -targetfile "M:\ReleaseXencode64\<AssemblyFileName>"
"%programfile%\Eziriz\.NET Reactor\dotNET_Reactor.Console.exe" -file "M:\Release64\TX_VAEntity.dll" -targetfile "M:\ReleaseXencode64\<AssemblyFileName>"
"%programfile%\Eziriz\.NET Reactor\dotNET_Reactor.Console.exe" -file "M:\Release64\TX_VBEntity.dll" -targetfile "M:\ReleaseXencode64\<AssemblyFileName>"

copy %drive%\ReleaseXencode64\TX_*.dll %drive%\ReleaseCodeMeter64\
copy %drive%\ReleaseXencode64\TX_*.exe %drive%\ReleaseCodeMeter64\


del %drive%\ReleaseCodeMeter64\TX_BaseEntity.dll
rem del %drive%\ReleaseCodeMeter64\TX_BaseKit.dll
rem del %drive%\ReleaseCodeMeter64\TX_TOOLBOX.dll
rem del %drive%\ReleaseCodeMeter64\TX_VAEntity.dll
rem del %drive%\ReleaseCodeMeter64\TX_VBEntity.dll

"%programfile%\WIBU-SYSTEMS\AxProtector\Devkit\bin\AxProtectorNet.exe" @%~dp0\TX_64_Ix_BaseEntity.xml
PAUSE


del %drive%\ReleaseCodeMeter64\Debug.log
del %drive%\ReleaseCodeMeter64\acad.err
del %drive%\ReleaseCodeMeter64\acaddoc.lsp
del %drive%\ReleaseCodeMeter64\UserMessage.ini
del %drive%\ReleaseCodeMeter64\UserMessageDe.ini
del %drive%\ReleaseCodeMeter64\UserMessageEs.ini
del %drive%\ReleaseCodeMeter64\UserMessageJa.ini
del %drive%\ReleaseCodeMeter64\UserMessageRu.ini
del %drive%\ReleaseCodeMeter64\TX_illPic\acaddoc.lsp
del %drive%\ReleaseCodeMeter64\TX_illPic\acad.err
del %drive%\ReleaseCodeMeter64\TX_illPic\plot.log
del %drive%\ReleaseCodeMeter64\TX_FrameFile\acaddoc.lsp
del %drive%\ReleaseCodeMeter64\*.vshost.exe

del %drive%\ReleaseCodeMeter64\TX_Option.xml
copy %drive%\ReleaseCodeMeter64\TX_Option\TX_Option_TJAD.xml %drive%\ReleaseCodeMeter64\TX_Option.xml
"%programfile%\Inno Setup 5\compil32" /cc %~dp0\TX_InnoSetup_64.iss
copy %drive%\setup.exe %drive%\setupwb64(%dt%).exe


del %drive%\ReleaseCodeMeter64\TX_Option.xml
copy %drive%\ReleaseCodeMeter64\TX_Option\TX_Option_FangSong.xml %drive%\ReleaseCodeMeter64\TX_Option.xml
"%programfile%\Inno Setup 5\compil32" /cc %~dp0\TX_InnoSetup_BridgeWise64.iss
copy %drive%\BridgeWiseSetup.exe %drive%\BridgeWise(%dt%)(64Œªº”√‹À¯∞Ê).exe