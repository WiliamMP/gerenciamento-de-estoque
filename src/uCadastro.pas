unit uCadastro;

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
  RzButton,
  RzEdit,
  Vcl.StdCtrls,
  RzCmboBx,
  Vcl.Mask,
  uConfig,
  cxClasses,
  dxLayoutControl, DamUnit, Vcl.ExtCtrls;

type
  TfrmCadastro = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    edtProductName: TMaskEdit;
    nomeProduto: TdxLayoutItem;
    cmbTipoProduto: TRzComboBox;
    tipoProduto: TdxLayoutItem;
    edtProductMark: TMaskEdit;
    marcaProduto: TdxLayoutItem;
    btnAdd: TRzButton;
    addProduto: TdxLayoutItem;
    btnCancProduto: TRzButton;
    cancProduto: TdxLayoutItem;
    grpFields: TdxLayoutGroup;
    grpCreatebtn: TdxLayoutGroup;
    Dam1: TDam;
    _DamMsg1: TDamMsg;
    edtPrecoProduto: TMaskEdit;
    dxLayoutItem1: TdxLayoutItem;
    procedure btnAddClick(Sender: TObject);
    procedure btnCancProdutoClick(Sender: TObject);
    procedure edtPrecoProdutoClick(Sender: TObject);
    procedure edtPrecoProdutoEnter(Sender: TObject);
    procedure MaskEdit1Enter(Sender: TObject);
    procedure edtPrecoProdutoChange(Sender: TObject);
  private
    { Private declarations }
  public
    fechado : boolean;
  end;

var
  frmCadastro: TfrmCadastro;

implementation

{$R *.dfm}

uses uMain;



procedure TfrmCadastro.btnAddClick(Sender: TObject);
var
   fileName : string;
   jsonString : string;
   fileManipuling : TextFile;
   removeString : string;
   pathString : string;

begin
  if (trim(edtProductName.Text) = '') or
     (cmbTipoProduto.ItemIndex = -1) or
     (trim(edtProductMark.Text) = '') or
     (trim(edtPrecoProduto.Text) = '') then
     begin
        ShowMessage('preencha os dados por gentileza');
        exit();
     end;


  pathString := frmConfig.btnPath.Caption;
  jsonString := '[{'+
                    '"NOME_DO_PRODUTO":"'  + edtProductName.Text  +  '",' +
                    '"TIPO_DO_PRODUTO":"'  + cmbTipoProduto.Text  +  '",' +
                    '"MARCA_DO_PRODUTO":"' + edtProductMark.Text  +  '",' +
                    '"PRECO_DO_PRODUTO":"' + edtPrecoProduto.Text +  '"}]';

  try
    if FileExists(pathString) then
      begin
        AssignFile(fileManipuling, pathString);
        Reset(fileManipuling);

        while not Eof(fileManipuling) do
        begin

          Readln(fileManipuling, removeString);

        end;
        CloseFile(fileManipuling);

        if removeString = '' then
        begin
          AssignFile(fileManipuling, pathString);
          Rewrite(fileManipuling);

          Writeln(fileManipuling, jsonString);
          CloseFile(fileManipuling);
        end
        else
        begin
        jsonString :=
                    '"NOME_DO_PRODUTO":"'  + edtProductName.Text  +  '",' +
                    '"TIPO_DO_PRODUTO":"'  + cmbTipoProduto.Text  +  '",' +
                    '"MARCA_DO_PRODUTO":"' + edtProductMark.Text  +  '",' +
                    '"PRECO_DO_PRODUTO":"' + edtPrecoProduto.Text +  '"}]';


           removeString := StringReplace(removeString,']',',{',[]);
           AssignFile(fileManipuling, pathString);
           Rewrite(fileManipuling);


           Writeln(fileManipuling,removeString + jsonString);
           CloseFile(fileManipuling);
        end;

      end
      else
      begin

        AssignFile(fileManipuling, pathString);
        Rewrite(fileManipuling);

        Writeln(fileManipuling, jsonString);
        CloseFile(fileManipuling);
      end;

      _DamMsg1.Run();
      frmControleEstoque.loadJSON();

//    AssignFile(fileManipuling, 'C:\Users\progr\OneDrive\Documentos\infos.json');
//    Rewrite(fileManipuling);
//    Writeln(fileManipuling, jsonString);
//    CloseFile(fileManipuling);
  finally


  end;

  edtProductName.Text := '';
  edtProductMark.Text := '';
  edtPrecoProduto.Text := '';
  cmbTipoProduto.Text := 'SELECIONE UM PRODUTO';
end;

procedure TfrmCadastro.btnCancProdutoClick(Sender: TObject);
begin
  frmCadastro.Close;
end;

procedure TfrmCadastro.edtPrecoProdutoChange(Sender: TObject);
begin
  edtPrecoProduto.Text := 'R$';
  edtPrecoProduto.SelStart := 3;
end;

procedure TfrmCadastro.edtPrecoProdutoClick(Sender: TObject);
begin
  edtPrecoProduto.Text := 'R$';
  edtPrecoProduto.SelStart := 3;

end;

procedure TfrmCadastro.edtPrecoProdutoEnter(Sender: TObject);
begin
    if edtPrecoProduto.Focused then
    begin
      edtPrecoProduto.Text := 'R$';
      edtPrecoProduto.SelStart := 3;
    end;
end;

procedure TfrmCadastro.MaskEdit1Enter(Sender: TObject);
begin
if edtPrecoProduto.Focused then
    begin
      edtPrecoProduto.Text := 'R$';
      edtPrecoProduto.SelStart := 3;
    end;
end;

end.
