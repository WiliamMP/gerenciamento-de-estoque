unit uConfig;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  uUpdate,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  dxLayoutContainer,
  Vcl.Buttons,
  PngSpeedButton,
  RzButton,
  cxClasses,
  dxLayoutControl,
  Vcl.StdCtrls,
  Vcl.Mask,
  RzEdit,
  IniFiles,
  RzBtnEdt,
  RzShellDialogs,
  DamUnit,
  dxLayoutControlAdapters,
  dxSkinsCore,
  dxSkinBlack,
  dxSkinBlue,
  dxSkinBlueprint,
  dxSkinCaramel,
  dxSkinCoffee,
  dxSkinDarkRoom,
  dxSkinDarkSide,
  dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle,
  dxSkinFoggy,
  dxSkinGlassOceans,
  dxSkinHighContrast,
  dxSkiniMaginary,
  dxSkinLilian,
  dxSkinLiquidSky,
  dxSkinLondonLiquidSky,
  dxSkinMcSkin,
  dxSkinMetropolis,
  dxSkinMetropolisDark,
  dxSkinMoneyTwins,
  dxSkinOffice2007Black,
  dxSkinOffice2007Blue,
  dxSkinOffice2007Green,
  dxSkinOffice2007Pink,
  dxSkinOffice2007Silver,
  dxSkinOffice2010Black,
  dxSkinOffice2010Blue,
  dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray,
  dxSkinOffice2013White,
  dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark,
  dxSkinPumpkin,
  dxSkinSeven,
  dxSkinSevenClassic,
  dxSkinSharp,
  dxSkinSharpPlus,
  dxSkinSilver,
  dxSkinSpringTime,
  dxSkinStardust,
  dxSkinSummer2008,
  dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters,
  dxSkinValentine,
  dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light,
  dxSkinVS2010,
  dxSkinWhiteprint,
  dxSkinXmas2008Blue,
  dxSkinscxPCPainter,
  dxSkinsForm;

type
  TfrmConfig = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutItem2: TdxLayoutItem;
    btnSair: TRzButton;
    BUTTONS: TdxLayoutGroup;
    Options: TdxLayoutGroup;
    btnPath: TRzButton;
    dxLayoutItem3: TdxLayoutItem;
    rzSelectFolder: TRzSelectFolderDialog;
    Dam1: TDam;
    _AvisoDamMsg1: TDamMsg;
    btnSave: TButton;
    dxLayoutItem4: TdxLayoutItem;
    btnExport: TRzButton;
    dxLayoutItem1: TdxLayoutItem;

    procedure btnpOpenDirClick(Sender: TObject);
    procedure btnPathClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure loadIni();
    procedure writeIni();
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    fileName : string;
  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.dfm}

uses uMain;

procedure TfrmConfig.writeIni();
var

  nameFile : string;
  stringDocFile : string;
  docFile : TextFile;
  user : string;

  arqIni : TIniFile;
  text : string;

begin

  nameFile  :=  ExtractFilePath(ParamStr(0)) + 'config.ini';
  user      :=  GetEnvironmentVariable('USERNAME');
  arqIni    :=  TIniFile.Create(nameFile);

  if FileExists(ExtractFilePath(ParamStr(0)) + 'config.ini') then
    begin
      arqini.WriteString('CONFIGS', 'PATH', btnPath.Caption);
      arqIni.Free;

    end
end;

procedure TfrmConfig.loadIni();
var
  nameFile : string;
  stringDocFile : string;
  docFile : TextFile;
  user : string;

  arqIni : TIniFile;
  text : string;

begin
  nameFile :=  ExtractFilePath(ParamStr(0)) + 'config.ini';
  user := GetEnvironmentVariable('USERNAME');
  arqIni := TIniFile.Create(nameFile);

  if FileExists(ExtractFilePath(ParamStr(0)) + 'config.ini') then
    begin
      text := arqIni.ReadString('CONFIGS','PATH','ERROR AO TENTAR ACESSAR ARQUIVO DE CONFIGURAÇÕES');
      btnPath.Caption := text;
      arqIni.Free;

    end
    else
    begin
      arqini.WriteString('CONFIGS', 'PATH', 'C:\Users\' + user + '\Documents\infos.json');
      arqIni.Free;

    end;

end;


procedure TfrmConfig.btnpOpenDirClick(Sender: TObject);
begin
  ShowMessage('W.I.P');
end;

procedure TfrmConfig.btnSairClick(Sender: TObject);
begin
  frmConfig.Close;
end;

procedure TfrmConfig.FormCreate(Sender: TObject);
var

  docFile : TextFile;
  fileString : string;

begin
  loadIni();
  fileString := btnPath.Caption;
  if not FileExists(btnPath.Caption) then
    begin
       AssignFile(docFile, fileString);
    end else
    uMain.frmControleEstoque.loadJSON();
end;

procedure TfrmConfig.btnPathClick(Sender: TObject);
begin
  rzSelectFolder.Execute;
  btnPath.Caption := rzSelectFolder.SelectedPathName + '\' + 'infos.json';
  _AvisoDamMsg1.Run();
  writeIni();

end;

end.
