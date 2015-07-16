; 脚本由 Inno Setup 脚本向导 生成！
; 有关创建 Inno Setup 脚本文件的详细资料请查阅帮助文档！

[Setup]
; 注: AppId的值为单独标识该应用程序。
; 不要为其他安装程序使用相同的AppId值。
; (生成新的GUID，点击 工具|在IDE中生成GUID。)
AppId={{82061F2C-05F4-4ACD-BD9D-498BBE9B9417}
AppName=BADesign
AppVersion=0.95
;AppVerName=我的程序 1.0
AppPublisher=BADesign
DefaultDirName={pf}\BridgeDesign\
DefaultGroupName=BADesign桥梁设计

OutputDir=M:\
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes
DirExistsWarning=no
AppendDefaultDirName=no
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
[code]
 var
  Page: TWizardPage; 
  CheckBox1,CheckBox2: TCheckBox;

  var ACAD2010: Boolean;   //CAD2010是否存在的标记
      ACAD2011: Boolean;


procedure URLLabelOnClick(Sender: TObject);
var
  ErrorCode: Integer;
begin
end;

function InitializeSetup(): Boolean;//安装前事件
begin
  ACAD2010 := RegvalueExists(HKLM64, 'SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804','AcadLocation');
  ACAD2011 := RegvalueExists(HKLM64, 'SOFTWARE\Autodesk\AutoCAD\R18.1\ACAD-9001:804','AcadLocation');
  Result := True
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep=ssPostInstall then
     if  (CheckBox1.Checked) then
        begin
        RegWriteStringValue(HKLM64, 'SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\BADesign', 'LOADER',  ExpandConstant('{app}')+'\TX_START.dll');
        RegWriteStringValue(HKLM64, 'SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\BADesign', 'DESCRIPTION', '使BADesign随CAD启动！');
        RegWriteDWordValue(HKLM64, 'SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\BADesign', 'LOADCTRLS', 2);
        RegWriteDWordValue(HKLM64, 'SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\BADesign', 'MANAGED', 1);
        end;
     if  (CheckBox2.Checked) then
        begin
        RegWriteStringValue(HKLM64, 'SOFTWARE\Autodesk\AutoCAD\R18.1\ACAD-9001:804\Applications\BADesign', 'LOADER',  ExpandConstant('{app}')+'\TX_START.dll');
        RegWriteStringValue(HKLM64, 'SOFTWARE\Autodesk\AutoCAD\R18.1\ACAD-9001:804\Applications\BADesign', 'DESCRIPTION', '使BADesign随CAD启动！');
        RegWriteDWordValue(HKLM64, 'SOFTWARE\Autodesk\AutoCAD\R18.1\ACAD-9001:804\Applications\BADesign', 'LOADCTRLS', 2);
        RegWriteDWordValue(HKLM64, 'SOFTWARE\Autodesk\AutoCAD\R18.1\ACAD-9001:804\Applications\BADesign', 'MANAGED', 1);
        end;
end;
 
procedure CreateAddonPage;
begin
  Page := CreateCustomPage(wpInfoBefore, '选择需要安装的CAD版本', '请根据您的需要选择安装的CAD版本,本程序仅支持AutoCAD2010及以上版本！');     
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
  CheckBox2.Top := CheckBox1.Top + ScaleY(60);
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
  URLLabel.Caption := '欢迎访问公司网站';
  URLLabel.OnClick := @URLLabelOnClick;
  URLLabel.Parent := WizardForm;
  URLLabel.Font.Style := URLLabel.Font.Style + [fsUnderLine];
  URLLabel.Font.Color := clBlue;
  URLLabel.Cursor := crHand;
end;


[Messages]
BeveledLabel=BADesign 0.95
ClickNext=单击“下一步”继续，或单击“取消”退出安装程序。%n%n%n%n%n%n%n%n本程序版权由BADesign所有%n%n未经许可不允许发布，传播，使用该软件：%n%n http://www.DesignLife360.com/

[Languages]
Name: "chinesesimp"; MessagesFile: "compiler:Default.isl"

[Registry]

Root: HKLM; Subkey: "SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\BADesign"; Flags:uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Autodesk\AutoCAD\R18.1\ACAD-9001:804\Applications\BADesign"; Flags:uninsdeletekey
;Root: HKLM; Subkey: "SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\KAKANIMOTools111"; ValueType: string; ValueName: "LOADER"; ValueData: "{src}\KakaNimo.dll"
;Root: HKLM; Subkey: "SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\KAKANIMOTools111"; ValueType: string; ValueName: "DESCRIPTION"; ValueData: "使KAKANIMOTools随CAD启动！"
;Root: HKLM; Subkey: "SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\KAKANIMOTools111"; ValueType: dword; ValueName: "LOADCTRLS"; ValueData: 2
;Root: HKLM; Subkey: "SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\KAKANIMOTools111"; ValueType: dword; ValueName: "MANAGED"; ValueData: 1

[Files]
Source: "M:\ReleaseCodeMeter64\加载程序.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "M:\ReleaseCodeMeter64\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; 注意: 不要在任何共享系统文件上使用“Flags: ignoreversion”
;Source: "H:\MOKACAD插件源码\MoKaCAD插件\KakaNimo.dll"; DestDir: "{app}"; Flags: ignoreversion

[Languages]
Name: "chinesesimp"; MessagesFile: "compiler:Default.isl"

[Icons]
Name: "{group}\加载BADesign"; Filename: "{app}\加载程序.exe"
Name: "{group}\安装说明.doc"; Filename: "{app}\TX_Help\安装说明.doc"
Name: "{group}\使用说明.doc"; Filename: "{app}\TX_Help\使用说明.doc"  
;Name: "{group}\自动升级.exe"; Filename: "{app}\AutoUpdate.exe" 
;Name: "{group}\服务器设置.exe"; Filename: "{app}\TX_WebServer.exe"
Name: "{group}\{cm:UninstallProgram,BADesign}"; Filename: "{uninstallexe}"


[Run]
;Filename: "{app}\TX_Runtime\vcredist_x86"; Description: "安装VC2008运行库"; Flags: postinstall
Filename: "{app}\TX_Runtime\CodeMeterRuntime510"; Description: "安装加密锁运行库"; Flags: postinstall
;RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\WIBU-SYSTEMS\CodeMeter\Server\CurrentVersion\', 'NetworkTimeout',  '100');

