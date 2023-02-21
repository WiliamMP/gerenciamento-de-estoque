unit uMain;

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
  SynEdit,
  SynMemo,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.DBCtrls,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxClasses,
  dxLayoutContainer,
  dxLayoutControl,
  Vcl.Buttons,
  PngBitBtn,
  System.ImageList,
  Vcl.ImgList,
  Vcl.ComCtrls,
  Vcl.ToolWin,
  Vcl.Mask,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  RzButton,
  uCadastro,
  uUpdate,
  System.JSON,
  Vcl.Clipbrd,
  ShellApi,
  uConfig,
  IniFiles,
  DamUnit,
  dxSkinsCore,
  dxSkinOffice2016Dark,
  dxSkinscxPCPainter,
  dxSkinsForm,
  System.Win.ComObj,
  dxLayoutLookAndFeels,
  frxClass;


type
  TfrmControleEstoque = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    cxImageList1: TcxImageList;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    grpPrimario: TdxLayoutGroup;
    strGrid: TStringGrid;
    dxLayoutItem2: TdxLayoutItem;
    Dam1: TDam;
    _ConfirmaDamMsg1: TDamMsg;
    ToolButton8: TToolButton;
    _DamMsg1: TDamMsg;
    lblCredits: TLabel;
    dxLayoutItem3: TdxLayoutItem;
    credits: TdxLayoutGroup;
    _ErroDamMsg1: TDamMsg;
    ToolButton9: TToolButton;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure loadJSON();
    procedure btnPesquisaClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure deleteIndexJSON();
    procedure limparGrid();
    procedure btnSalvarClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
  private
    { Private declarations }
  public
      grd : integer;
  end;

var
  frmControleEstoque: TfrmControleEstoque;


implementation

{$R *.dfm}


procedure TfrmControleEstoque.limparGrid();
var

  row, col : integer;

begin
  for row := 1 to strGrid.RowCount -1 do
    for col := 0 to strGrid.ColCount -1 do
      strGrid.Cells[col, row] := '';



end;

procedure TfrmControleEstoque.deleteIndexJSON();
var
  fileLocation  : string;
  docFile       : TextFile;
  jsonString    : string;
  jsonValue     : TJSONValue;

  jsonObject    : TJSONObject;
  jsonArray     : TJSONArray;
  subObjJson    : TJSONObject;
  substring     : string;

begin
  fileLocation := frmConfig.btnPath.Caption;
  AssignFile(docFile, fileLocation);

  Reset(docFile);

  while not Eof(docFile) do
  begin
     Readln(docFile, jsonString);
  end;

  jsonArray := TJSONObject.ParseJSONValue(jsonString) as TJSONArray;


  jsonArray.Remove(strGrid.Row - 1);

  Rewrite(docFile);

  Write(docFile, jsonArray.ToString);

  CloseFile(docFile);
  strGrid.RowCount := strGrid.RowCount - 1;
end;

procedure TfrmControleEstoque.loadJSON();
var
  fileLocation    : string;
  docFile         : TextFile;
  jsonString      : string;

  jsonObject      : TJSONObject;
  jsonArray       : TJSONArray;
  I               : Integer;
  subObjJson      : TJSONObject;

  jsonValueNome   : TJSONValue;
  jsonValueTipo   : TJSONValue;
  jsonValueMarca  : TJSONValue;
  jsonValueValor  : TJSONValue;
begin

  try
    fileLocation := frmConfig.btnPath.Caption;
    AssignFile(docFile, fileLocation);

    Reset(docFile);

    while not Eof(docFile) do
    begin
       Readln(docFile, jsonString);
    end;;
    jsonArray := TJSONObject.ParseJSONValue(jsonString) as TJSONArray;

    for I := 0 to jsonArray.Size - 1 do
    begin
      subObjJson := (jsonArray.Get(I) as TJSONObject);

      jsonValueNome   := subObjJson.GetValue<TJSONValue>('NOME_DO_PRODUTO') as TJSONValue;
      jsonValueTipo   := subObjJson.GetValue<TJSONValue>('TIPO_DO_PRODUTO') as TJSONValue;
      jsonValueMarca  := subObjJson.GetValue<TJSONValue>('MARCA_DO_PRODUTO') as TJSONValue;
      jsonValueValor  := subObjJson.GetValue<TJSONValue>('PRECO_DO_PRODUTO') as TJSONValue;

      strGrid.RowCount      := I + 2;
      strGrid.Cells[0,I+1]  := (strGrid.RowCount -1 ).ToString;
      strGrid.Cells[1,I+1]  := jsonValueNome.Value;
      strGrid.Cells[2,I+1]  := jsonValueTipo.Value;
      strGrid.Cells[3,I+1]  := jsonValueMarca.Value;
      strGrid.Cells[4,I+1]  := jsonValueValor.Value;

    end;
    subObjJson.Free;
   CloseFile(docFile);
  except on e: EAccessViolation do
    begin
    CloseFile(docFile);
    Exit
    end;
    on e : EInOutError do
    begin
    CloseFile(docFile);
    Exit
    end;  //  exceptions desnecessárias, pois as falhas geradas são
          //  por conta de algo que o usuario fez


end;


end;

procedure TfrmControleEstoque.btnDeletarClick(Sender: TObject);
begin
   deleteIndexJSON();
   limparGrid();
   loadJSON();
   _DamMsg1.Run();
end;

procedure TfrmControleEstoque.btnPesquisaClick(Sender: TObject);
begin
  ShowMessage('não sei oque fazer aqui');
end;

procedure TfrmControleEstoque.btnSalvarClick(Sender: TObject);
begin
  frmUpdate.ShowModal;
  frmUpdate.Free;
end;

procedure TfrmControleEstoque.FormCreate(Sender: TObject);
begin
  strGrid.Cells[0,0] := 'ID';
  strGrid.Cells[1,0] := 'NOME';
  strGrid.Cells[2,0] := 'TIPO';
  strGrid.Cells[3,0] := 'MARCA';
  strGrid.Cells[4,0] := 'VALOR';

//  loadJSON();
end;

procedure TfrmControleEstoque.ToolButton1Click(Sender: TObject);
begin
  frmCadastro.ShowModal;
  frmCadastro.Free;
end;

procedure TfrmControleEstoque.ToolButton2Click(Sender: TObject);
begin
   limparGrid();
   loadJSON();
end;

procedure TfrmControleEstoque.ToolButton3Click(Sender: TObject);
begin
   if _ConfirmaDamMsg1.RunAsBool then
   begin
   deleteIndexJSON();
   limparGrid();
   loadJSON();
   _DamMsg1.Run();
   end
end;

procedure TfrmControleEstoque.ToolButton4Click(Sender: TObject);
var
  fileLocation    :   string;
  docFile         :   TextFile;
  jsonString      :   string;

  jsonObject      :   TJSONObject;
  jsonArray       :   TJSONArray;
  I               :   Integer;
  subObjJson      :   TJSONObject;

  jsonValueNome   :   TJSONValue;
  jsonValueTipo   :   TJSONValue;
  jsonValueMarca  :   TJSONValue;
  jsonValueValor  :   TJSONValue;

begin
try
  fileLocation := frmConfig.btnPath.Caption;
  AssignFile(docFile, fileLocation);

  Reset(docFile);

  while not Eof(docFile) do
  begin
     Readln(docFile, jsonString);
  end;

    jsonArray   := TJSONObject.ParseJSONValue(jsonString) as TJSONArray;
    subObjJson  := (jsonArray.Get(strGrid.Row - 1)        as TJSONObject);

    jsonValueNome   := subObjJson.GetValue<TJSONValue>('NOME_DO_PRODUTO') as TJSONValue;
    jsonValueTipo   := subObjJson.GetValue<TJSONValue>('TIPO_DO_PRODUTO') as TJSONValue;
    jsonValueMarca  := subObjJson.GetValue<TJSONValue>('MARCA_DO_PRODUTO') as TJSONValue;
    jsonValueValor  := subObjJson.GetValue<TJSONValue>('PRECO_DO_PRODUTO') as TJSONValue;



    frmUpdate.grid                 := strGrid.Row;
    frmUpdate.edtProductName.Text  := jsonValueNome.Value;
    frmUpdate.cmbTipoProduto.Text  := jsonValueTipo.Value;
    frmUpdate.edtProductMark.Text  := jsonValueMarca.Value;
    frmUpdate.edtPrecoProduto.Text := jsonValueValor.Value;
finally
   CloseFile(docFile);

    frmUpdate.ShowModal;
	  frmUpdate.Free;
    end;
  end;
procedure TfrmControleEstoque.ToolButton5Click(Sender: TObject);
var

  i             : integer;
  strGridText   : string;

begin
  i                 := strGrid.Row;
  strGridText       := strGrid.Rows[i].GetText;
  Clipboard.AsText  := strGridText;



end;

procedure TfrmControleEstoque.ToolButton6Click(Sender: TObject);
var
     fileLocation : string;
begin
  fileLocation := frmConfig.btnPath.Caption;
  ShellExecute(Handle, 'open', PChar(fileLocation),nil,nil,SW_NORMAL);
end;


procedure TfrmControleEstoque.ToolButton8Click(Sender: TObject);

begin

   frmConfig.ShowModal;
   frmConfig.Free;

end;

procedure TfrmControleEstoque.ToolButton9Click(Sender: TObject);
begin
  ShowMessage('exportar para arquivo excel, porém tem que achar um biblioteca');
end;

end.
