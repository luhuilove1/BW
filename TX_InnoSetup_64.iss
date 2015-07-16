; �ű��� Inno Setup �ű��� ���ɣ�
; �йش��� Inno Setup �ű��ļ�����ϸ��������İ����ĵ���

[Setup]
; ע: AppId��ֵΪ������ʶ��Ӧ�ó���
; ��ҪΪ������װ����ʹ����ͬ��AppIdֵ��
; (�����µ�GUID����� ����|��IDE������GUID��)
AppId={{82061F2C-05F4-4ACD-BD9D-498BBE9B9417}
AppName=BADesign
AppVersion=0.95
;AppVerName=�ҵĳ��� 1.0
AppPublisher=BADesign
DefaultDirName={pf}\BridgeDesign\
DefaultGroupName=BADesign�������

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

  var ACAD2010: Boolean;   //CAD2010�Ƿ���ڵı��
      ACAD2011: Boolean;


procedure URLLabelOnClick(Sender: TObject);
var
  ErrorCode: Integer;
begin
end;

function InitializeSetup(): Boolean;//��װǰ�¼�
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
        RegWriteStringValue(HKLM64, 'SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\BADesign', 'DESCRIPTION', 'ʹBADesign��CAD������');
        RegWriteDWordValue(HKLM64, 'SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\BADesign', 'LOADCTRLS', 2);
        RegWriteDWordValue(HKLM64, 'SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\BADesign', 'MANAGED', 1);
        end;
     if  (CheckBox2.Checked) then
        begin
        RegWriteStringValue(HKLM64, 'SOFTWARE\Autodesk\AutoCAD\R18.1\ACAD-9001:804\Applications\BADesign', 'LOADER',  ExpandConstant('{app}')+'\TX_START.dll');
        RegWriteStringValue(HKLM64, 'SOFTWARE\Autodesk\AutoCAD\R18.1\ACAD-9001:804\Applications\BADesign', 'DESCRIPTION', 'ʹBADesign��CAD������');
        RegWriteDWordValue(HKLM64, 'SOFTWARE\Autodesk\AutoCAD\R18.1\ACAD-9001:804\Applications\BADesign', 'LOADCTRLS', 2);
        RegWriteDWordValue(HKLM64, 'SOFTWARE\Autodesk\AutoCAD\R18.1\ACAD-9001:804\Applications\BADesign', 'MANAGED', 1);
        end;
end;
 
procedure CreateAddonPage;
begin
  Page := CreateCustomPage(wpInfoBefore, 'ѡ����Ҫ��װ��CAD�汾', '�����������Ҫѡ��װ��CAD�汾,�������֧��AutoCAD2010�����ϰ汾��');     
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
  URLLabel.Caption := '��ӭ���ʹ�˾��վ';
  URLLabel.OnClick := @URLLabelOnClick;
  URLLabel.Parent := WizardForm;
  URLLabel.Font.Style := URLLabel.Font.Style + [fsUnderLine];
  URLLabel.Font.Color := clBlue;
  URLLabel.Cursor := crHand;
end;


[Messages]
BeveledLabel=BADesign 0.95
ClickNext=��������һ�����������򵥻���ȡ�����˳���װ����%n%n%n%n%n%n%n%n�������Ȩ��BADesign����%n%nδ����ɲ���������������ʹ�ø������%n%n http://www.DesignLife360.com/

[Languages]
Name: "chinesesimp"; MessagesFile: "compiler:Default.isl"

[Registry]

Root: HKLM; Subkey: "SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\BADesign"; Flags:uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Autodesk\AutoCAD\R18.1\ACAD-9001:804\Applications\BADesign"; Flags:uninsdeletekey
;Root: HKLM; Subkey: "SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\KAKANIMOTools111"; ValueType: string; ValueName: "LOADER"; ValueData: "{src}\KakaNimo.dll"
;Root: HKLM; Subkey: "SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\KAKANIMOTools111"; ValueType: string; ValueName: "DESCRIPTION"; ValueData: "ʹKAKANIMOTools��CAD������"
;Root: HKLM; Subkey: "SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\KAKANIMOTools111"; ValueType: dword; ValueName: "LOADCTRLS"; ValueData: 2
;Root: HKLM; Subkey: "SOFTWARE\Autodesk\AutoCAD\R18.0\ACAD-8001:804\Applications\KAKANIMOTools111"; ValueType: dword; ValueName: "MANAGED"; ValueData: 1

[Files]
Source: "M:\ReleaseCodeMeter64\���س���.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "M:\ReleaseCodeMeter64\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; ע��: ��Ҫ���κι���ϵͳ�ļ���ʹ�á�Flags: ignoreversion��
;Source: "H:\MOKACAD���Դ��\MoKaCAD���\KakaNimo.dll"; DestDir: "{app}"; Flags: ignoreversion

[Languages]
Name: "chinesesimp"; MessagesFile: "compiler:Default.isl"

[Icons]
Name: "{group}\����BADesign"; Filename: "{app}\���س���.exe"
Name: "{group}\��װ˵��.doc"; Filename: "{app}\TX_Help\��װ˵��.doc"
Name: "{group}\ʹ��˵��.doc"; Filename: "{app}\TX_Help\ʹ��˵��.doc"  
;Name: "{group}\�Զ�����.exe"; Filename: "{app}\AutoUpdate.exe" 
;Name: "{group}\����������.exe"; Filename: "{app}\TX_WebServer.exe"
Name: "{group}\{cm:UninstallProgram,BADesign}"; Filename: "{uninstallexe}"


[Run]
;Filename: "{app}\TX_Runtime\vcredist_x86"; Description: "��װVC2008���п�"; Flags: postinstall
Filename: "{app}\TX_Runtime\CodeMeterRuntime510"; Description: "��װ���������п�"; Flags: postinstall
;RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\WIBU-SYSTEMS\CodeMeter\Server\CurrentVersion\', 'NetworkTimeout',  '100');

