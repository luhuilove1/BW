; 脚本由 Inno Setup 脚本向导 生成！
; 有关创建 Inno Setup 脚本文件的详细资料请查阅帮助文档！

[Setup]
; 注: AppId的值为单独标识该应用程序。
; 不要为其他安装程序使用相同的AppId值。
; (生成新的GUID，点击 工具|在IDE中生成GUID。)
AppId={{A3ADDACC-54F1-42B3-B791-707A5C2DB52A}
AppName=BridgeWiseFor2012桥梁智绘
AppVersion=1.6
;AppVerName=我的程序 1.0
AppPublisher=BridgeWise桥梁智绘
DefaultDirName={pf}\BridgeWise2014\
DefaultGroupName=桥梁智绘V1.6(ForCAD2012)
InfoBeforeFile=M:\ReleaseCodeMeter32\TX_Help\Authorize.txt
;InfoAfterFile=M:\ReleaseCodeMeter32\TX_Help\ReadMe.txt
OutputDir=M:\
OutputBaseFilename=BridgeWise32For2012
Compression=lzma
SolidCompression=yes
DirExistsWarning=no
AppendDefaultDirName=yes
[code]
 var
  Page: TWizardPage; 
  CheckBox1,CheckBox2,CheckBox3,CheckBox4: TCheckBox;

  var ACAD2010: Boolean;   //CAD2010是否存在的标记
      ACAD2011: Boolean;
      ACAD2012: Boolean;
      ACAD2013: Boolean;


procedure URLLabelOnClick(Sender: TObject);
var
  ErrorCode: Integer;
begin
end;

function InitializeSetup(): Boolean;//安装前事件
begin
  ACAD2010 := RegvalueExists(HKLM, 'SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804','AcadLocation');
  ACAD2011 := RegvalueExists(HKLM, 'SOFTWARE\Autodesk\AutoCAD\R18.1\ACAD-9001:804','AcadLocation');
  ACAD2012 := RegvalueExists(HKLM, 'SOFTWARE\Autodesk\AutoCAD\R18.2\ACAD-A001:804','AcadLocation');
  ACAD2013 := RegvalueExists(HKLM, 'SOFTWARE\Autodesk\AutoCAD\R19.0\ACAD-B001:804','AcadLocation');
  ACAD2010 := False
  ACAD2011 := False
  Result := True
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep=ssPostInstall then
     if  (CheckBox1.Checked) then
        begin
        RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\BridgeWise', 'LOADER',  ExpandConstant('{app}')+'\TX_START.dll');
        RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\BridgeWise', 'DESCRIPTION', '使BridgeWise随CAD启动！');
        RegWriteDWordValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\BridgeWise', 'LOADCTRLS', 2);
        RegWriteDWordValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\BridgeWise', 'MANAGED', 1);
        end;
     if  (CheckBox2.Checked) then
        begin
        RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Autodesk\AutoCAD\R18.1\ACAD-9001:804\Applications\BridgeWise', 'LOADER',  ExpandConstant('{app}')+'\TX_START.dll');
        RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Autodesk\AutoCAD\R18.1\ACAD-9001:804\Applications\BridgeWise', 'DESCRIPTION', '使BridgeWise随CAD启动！');
        RegWriteDWordValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Autodesk\AutoCAD\R18.1\ACAD-9001:804\Applications\BridgeWise', 'LOADCTRLS', 2);
        RegWriteDWordValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Autodesk\AutoCAD\R18.1\ACAD-9001:804\Applications\BridgeWise', 'MANAGED', 1);
        end;
     if  (CheckBox3.Checked) then
        begin
        RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Autodesk\AutoCAD\R18.2\ACAD-A001:804\Applications\BridgeWise', 'LOADER',  ExpandConstant('{app}')+'\TX_START.dll');
        RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Autodesk\AutoCAD\R18.2\ACAD-A001:804\Applications\BridgeWise', 'DESCRIPTION', '使BridgeWise随CAD启动！');
        RegWriteDWordValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Autodesk\AutoCAD\R18.2\ACAD-A001:804\Applications\BridgeWise', 'LOADCTRLS', 2);
        RegWriteDWordValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Autodesk\AutoCAD\R18.2\ACAD-A001:804\Applications\BridgeWise', 'MANAGED', 1);
        end;
     if  (CheckBox4.Checked) then
        begin
        RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Autodesk\AutoCAD\R19.0\ACAD-B001:804\Applications\BridgeWise', 'LOADER',  ExpandConstant('{app}')+'\TX_START.dll');
        RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Autodesk\AutoCAD\R19.0\ACAD-B001:804\Applications\BridgeWise', 'DESCRIPTION', '使BridgeWise随CAD启动！');
        RegWriteDWordValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Autodesk\AutoCAD\R19.0\ACAD-B001:804\Applications\BridgeWise', 'LOADCTRLS', 2);
        RegWriteDWordValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Autodesk\AutoCAD\R19.0\ACAD-B001:804\Applications\BridgeWise', 'MANAGED', 1);
        end;
end;
 
procedure CreateAddonPage;
begin
  Page := CreateCustomPage(wpInfoBefore, '选择需要安装的CAD版本', '请根据您的需要选择安装的CAD版本,本程序支持AutoCAD2010版本！');     
  CheckBox1 := TCheckBox.Create(Page);
  CheckBox1.Left := ScaleX(80);
  CheckBox1.Top := ScaleY(40);
  CheckBox1.Width := Page.SurfaceWidth;
  CheckBox1.Height := ScaleY(17);
  CheckBox1.Caption := 'AutoCAD2010';
  CheckBox1.Parent := Page.Surface;
  CheckBox1.Enabled:= ACAD2010 ;
  if  (CheckBox1.Enabled) then
    begin
       CheckBox1.Checked := true;
  end else
    begin
        CheckBox1.Checked := false;
    end;

  CheckBox2 :=TCheckBox.Create(Page);
  CheckBox2.Left := ScaleX(80);
  CheckBox2.Top := CheckBox1.Top + ScaleY(30);
  CheckBox2.Width := Page.SurfaceWidth;
  CheckBox2.Height := ScaleY(17);
  CheckBox2.Caption := 'AutoCAD2011';
  CheckBox2.Parent := Page.Surface;
  CheckBox2.Enabled:= ACAD2011 ;
  if  (CheckBox2.Enabled) then
    begin
       CheckBox2.Checked := true;
  end else
    begin
        CheckBox2.Checked := false;
    end;

  CheckBox3 :=TCheckBox.Create(Page);
  CheckBox3.Left := ScaleX(80);
  CheckBox3.Top := CheckBox2.Top + ScaleY(30);
  CheckBox3.Width := Page.SurfaceWidth;
  CheckBox3.Height := ScaleY(17);
  CheckBox3.Caption := 'AutoCAD2012';
  CheckBox3.Parent := Page.Surface;
  CheckBox3.Enabled:= ACAD2012 ;
  if  (CheckBox3.Enabled) then
    begin
       CheckBox3.Checked := true;
  end else
    begin
        CheckBox3.Checked := false;
    end;

  CheckBox4 :=TCheckBox.Create(Page);
  CheckBox4.Left := ScaleX(80);
  CheckBox4.Top := CheckBox3.Top + ScaleY(30);
  CheckBox4.Width := Page.SurfaceWidth;
  CheckBox4.Height := ScaleY(17);
  CheckBox4.Caption := 'AutoCAD2013';
  CheckBox4.Parent := Page.Surface;
  CheckBox4.Enabled:= ACAD2013 ;
  if  (CheckBox4.Enabled) then
    begin
       CheckBox4.Checked := true;
  end else
    begin
        CheckBox4.Checked := false;
    end;
end;
 
procedure InitializeWizard();

var
URLLabel: TNewStaticText;CancelButton: TButton;

begin
  CreateAddonPage;
  WizardForm.BeveledLabel.Enabled := true;
  WizardForm.BeveledLabel.Font.Color := clGray;
  WizardForm.BeveledLabel.Font.Style := WizardForm.BeveledLabel.Font.Style + [fsBold];
  WizardForm.BeveledLabel.Left := 5;
  WizardForm.BORDERICONS := [biHelp, biSystemMenu, biMinimize];
  
  CancelButton := WizardForm.CancelButton;
  URLLabel := TNewStaticText.Create(WizardForm);
  URLLabel.Top := CancelButton.Top;
  URLLabel.Left :=  WizardForm.ClientWidth - CancelButton.Left - CancelButton.Width;
  URLLabel.Caption := '欢迎访问官网 www.bridgewise.net';
  URLLabel.OnClick := @URLLabelOnClick;
  URLLabel.Parent := WizardForm;
  URLLabel.Font.Style := URLLabel.Font.Style + [fsUnderLine];
  URLLabel.Font.Color := clBlue;
  URLLabel.Cursor := crHand;
end;


[Messages]
BeveledLabel=BridgeWise 1.6
ClickNext=单击“下一步”继续，或单击“取消”退出安装程序。%n%n%n%n%n%n%n%n桥梁智绘辅助设计软件祝您工作愉快%n%n未经许可不允许发布，传播，使用该软件：%n%n http://www.BridgeWise.net/

[Languages]
Name: "chinesesimp"; MessagesFile: "compiler:Default.isl"

[Registry]

;Root: HKLM; Subkey: "SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\BridgeWise"; Flags:uninsdeletekey
;Root: HKLM; Subkey: "SOFTWARE\Autodesk\AutoCAD\R18.1\ACAD-9001:804\Applications\BridgeWise"; Flags:uninsdeletekey
;Root: HKLM; Subkey: "SOFTWARE\Autodesk\AutoCAD\R18.2\ACAD-A001:804\Applications\BridgeWise"; Flags:uninsdeletekey
;Root: HKLM; Subkey: "SOFTWARE\Autodesk\AutoCAD\R19.0\ACAD-B001:804\Applications\BridgeWise"; Flags:uninsdeletekey
;Root: HKLM; Subkey: "SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\KAKANIMOTools111"; ValueType: string; ValueName: "LOADER"; ValueData: "{src}\KakaNimo.dll"
;Root: HKLM; Subkey: "SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\KAKANIMOTools111"; ValueType: string; ValueName: "DESCRIPTION"; ValueData: "使KAKANIMOTools随CAD启动！"
;Root: HKLM; Subkey: "SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\KAKANIMOTools111"; ValueType: dword; ValueName: "LOADCTRLS"; ValueData: 2
;Root: HKLM; Subkey: "SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\KAKANIMOTools111"; ValueType: dword; ValueName: "MANAGED"; ValueData: 1

[Files]
Source: "M:\ReleaseCodeMeter32\TX_BridgeWiseApp.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "M:\ReleaseCodeMeter32\*"; Excludes: "TX_Runtime\CodeMeterRuntime32.exe"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; 注意: 不要在任何共享系统文件上使用“Flags: ignoreversion”
;Source: "H:\MOKACAD插件源码\MoKaCAD插件\KakaNimo.dll"; DestDir: "{app}"; Flags: ignoreversion

;Source: D:\安装制作\RAR\$INSTDIR\*; Excludes: "RarExt.dll,RarExt64.dll"; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs
 



[Languages]
Name: "chinesesimp"; MessagesFile: "compiler:Default.isl"

[Icons]
Name: "{group}\桥梁智绘BridgeWise"; Filename: "{app}\TX_BridgeWiseApp.exe"
Name: "{group}\使用说明.doc"; Filename: "{app}\TX_Help\使用说明.doc"  
Name: "{group}\常见问题.doc"; Filename: "{app}\TX_Help\常见问题解答.doc"  
;Name: "{group}\自动升级.exe"; Filename: "{app}\AutoUpdate.exe" 
;Name: "{group}\服务器设置.exe"; Filename: "{app}\TX_WebServer.exe"
Name: "{group}\{cm:UninstallProgram,BridgeWise}"; Filename: "{uninstallexe}"


[Run]
;Filename: "{app}\TX_Runtime\vcredist_x86"; Description: "安装VC2008运行库(XP第一次安装时打钩)"; Flags: postinstall
Filename: "{app}\TX_Runtime\CodeMeterRuntime510"; Description: "安装加密锁运行库"; Flags: postinstall
;RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\WIBU-SYSTEMS\CodeMeter\Server\CurrentVersion\', 'NetworkTimeout',  '100');

