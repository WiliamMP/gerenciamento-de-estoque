object frmUpdate: TfrmUpdate
  Left = 0
  Top = 0
  Caption = 'Atualizar Dados'
  ClientHeight = 224
  ClientWidth = 614
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
    Width = 614
    Height = 224
    Align = alClient
    TabOrder = 0
    object edtProductName: TMaskEdit
      Left = 116
      Top = 30
      Width = 474
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
      Width = 478
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
      Width = 474
      Height = 17
      BevelInner = bvNone
      BevelOuter = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      TabOrder = 2
      Text = ''
    end
    object edtPrecoProduto: TRzNumericEdit
      Left = 114
      Top = 109
      Width = 478
      Height = 21
      MaxLength = 10
      TabOrder = 3
      DisplayFormat = ',0;(,0)'
    end
    object btnAdd: TRzButton
      Left = 79
      Top = 177
      Width = 207
      Caption = 'Atualizar'
      TabOrder = 4
      OnClick = btnAddClick
    end
    object btnCancProduto: TRzButton
      Left = 292
      Top = 177
      Width = 242
      Caption = 'Cancelar'
      TabOrder = 5
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
    object precoProduto: TdxLayoutItem
      Parent = grpFields
      CaptionOptions.Text = 'Pre'#231'o:'
      Control = edtPrecoProduto
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 65
      ControlOptions.ShowBorder = False
      Index = 3
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
  end
end
