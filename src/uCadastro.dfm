object frmCadastro: TfrmCadastro
  Left = 0
  Top = 0
  Caption = 'Cadastrar Produto'
  ClientHeight = 231
  ClientWidth = 646
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 646
    Height = 231
    Align = alClient
    TabOrder = 0
    object edtProductName: TMaskEdit
      Left = 116
      Top = 30
      Width = 506
      Height = 17
      BevelInner = bvNone
      BevelOuter = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      TabOrder = 0
      Text = ''
    end
    object cmbTipoProduto: TRzComboBox
      Left = 114
      Top = 55
      Width = 510
      Height = 21
      TabOrder = 1
      Text = 'SELECIONE UM PRODUTO'
      Items.Strings = (
        'SERVI'#199'OS'
        'MODA'
        'AUTOMOBIL'#205'STICO'
        'BELEZA'
        'COMIDA'
        'MIDIA F'#205'SICA (DVD'#39'S,CD'#39'S,ETC)'
        'PRODUTO ELETRONICO'
        ''
        '')
    end
    object edtProductMark: TMaskEdit
      Left = 116
      Top = 84
      Width = 506
      Height = 17
      BevelInner = bvNone
      BevelOuter = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      TabOrder = 2
      Text = ''
    end
    object btnAdd: TRzButton
      Left = 95
      Top = 184
      Width = 207
      Caption = 'Cadastrar'
      TabOrder = 4
      OnClick = btnAddClick
    end
    object btnCancProduto: TRzButton
      Left = 308
      Top = 184
      Width = 242
      Caption = 'Cancelar'
      TabOrder = 5
      OnClick = btnCancProdutoClick
    end
    object edtPrecoProduto: TMaskEdit
      Left = 116
      Top = 111
      Width = 506
      Height = 17
      BevelInner = bvNone
      BevelOuter = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      TabOrder = 3
      Text = ''
      OnChange = edtPrecoProdutoChange
      OnEnter = MaskEdit1Enter
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.AlignHorz = taCenter
      CaptionOptions.AlignVert = tavCenter
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object grpFields: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'Campos'
      ButtonOptions.Buttons = <>
      Index = 0
    end
    object nomeProduto: TdxLayoutItem
      Parent = grpFields
      CaptionOptions.Text = 'Nome do Produto:'
      Control = edtProductName
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 121
      Index = 0
    end
    object tipoProduto: TdxLayoutItem
      Parent = grpFields
      CaptionOptions.Text = 'Tipo do Produto:'
      Control = cmbTipoProduto
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 145
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object marcaProduto: TdxLayoutItem
      Parent = grpFields
      CaptionOptions.Text = 'Marca:'
      Control = edtProductMark
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 121
      Index = 2
    end
    object grpCreatebtn: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahCenter
      AlignVert = avBottom
      CaptionOptions.AlignHorz = taCenter
      CaptionOptions.AlignVert = tavCenter
      CaptionOptions.Text = 'Fun'#231#245'es'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object addProduto: TdxLayoutItem
      Parent = grpCreatebtn
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = '5'
      CaptionOptions.Visible = False
      CaptionOptions.Width = 2
      Control = btnAdd
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 207
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object cancProduto: TdxLayoutItem
      Parent = grpCreatebtn
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'RzButton1'
      CaptionOptions.Visible = False
      Control = btnCancProduto
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 242
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = grpFields
      CaptionOptions.Text = 'Pre'#231'o:'
      Control = edtPrecoProduto
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 121
      Index = 3
    end
  end
  object Dam1: TDam
    Left = 40
    Top = 176
    object _DamMsg1: TDamMsg
      Mensagem = 
        '~M~C[3366FF]~N~T[12]CADASTRO~t~n~n~n~c'#13#10#13#10'~MCadastro realizado c' +
        'om sucesso!'
      Dam = Dam1
    end
  end
end
