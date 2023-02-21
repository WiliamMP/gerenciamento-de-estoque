unit uUpdate;

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
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  dxLayoutContainer,
  dxLayoutControlAdapters,
  cxClasses,
  RzButton,
  RzEdit,
  Vcl.StdCtrls,
  RzCmboBx,
  Vcl.Mask,
  dxLayoutControl,
  System.JSON;

type
  TfrmUpdate = class(TForm)
    dxLayoutControl1: TdxLayoutControl;
    edtProductName: TMaskEdit;
    cmbTipoProduto: TRzComboBox;
    edtProductMark: TMaskEdit;
    edtPrecoProduto: TRzNumericEdit;
    btnAdd: TRzButton;
    btnCancProduto: TRzButton;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    grpFields: TdxLayoutGroup;
    nomeProduto: TdxLayoutItem;
    tipoProduto: TdxLayoutItem;
    marcaProduto: TdxLayoutItem;
    precoProduto: TdxLayoutItem;
    grpCreatebtn: TdxLayoutGroup;
    addProduto: TdxLayoutItem;
    cancProduto: TdxLayoutItem;
    procedure updateJSON();
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    grid : integer;
  end;

var
  frmUpdate: TfrmUpdate;

implementation

{$R *.dfm}

uses uConfig, uMain;

procedure TfrmUpdate.btnAddClick(Sender: TObject);
begin
  updateJSON();
end;

procedure TfrmUpdate.updateJSON();
var
  fileLocation    : string;
  docFile         : TextFile;
  jsonString      : string;

  jsonObject      : TJSONObject;
  jsonArray       : TJSONArray;
  subObjJson      : TJSONObject;

  jsonValueNome   : TJSONValue;
  jsonValueTipo   : TJSONValue;
  jsonValueMarca  : TJSONValue;
  jsonValueValor  : TJSONValue;

  I : Integer;
  removeString : string;

  pathString : string;

begin
  pathString    := frmConfig.btnPath.Caption;
  fileLocation  := pathString;
  AssignFile(docFile, fileLocation);

  Reset(docFile);

  while not Eof(docFile) do
  begin
     Readln(docFile, jsonString);
  end;

  jsonArray := TJSONObject.ParseJSONValue(jsonString) as TJSONArray;


  jsonArray.Remove(grid - 1);

  Rewrite(docFile);

  Write(docFile, jsonArray.ToString);

  CloseFile(docFile);

  try
    if FileExists(fileLocation) then
      begin
        AssignFile(docFile, fileLocation);
        Reset(docFile);

        while not Eof(docFile) do
        begin

          Readln(docFile, removeString);

        end;
        CloseFile(docFile);

        jsonString:= '"NOME_DO_PRODUTO":"'  + edtProductName.Text  +  '",' +
                    '"TIPO_DO_PRODUTO":"'  + cmbTipoProduto.Text  +  '",' +
                    '"MARCA_DO_PRODUTO":"' + edtProductMark.Text  +  '",' +
                    '"PRECO_DO_PRODUTO":"' + edtPrecoProduto.Text +  '"}]';

        if removeString = '' then
        begin
          AssignFile(docFile, fileLocation);
          Rewrite(docFile);

          Writeln(docFile, jsonString);
          CloseFile(docFile);
        end
        else
        begin

           removeString := StringReplace(removeString,']',',{',[]);
           AssignFile(docFile, fileLocation);
           Rewrite(docFile);


           Writeln(docFile,removeString + jsonString);
           CloseFile(docFile);
        end;
      end

  finally
    ShowMessage('registro atualizado com sucesso!');
    frmControleEstoque.loadJSON();
  end;

  end;
end.
