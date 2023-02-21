object frmConfig: TfrmConfig
  Left = 0
  Top = 0
  Caption = 'Configura'#231#245'es'
  ClientHeight = 624
  ClientWidth = 654
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 654
    Height = 624
    Align = alClient
    TabOrder = 0
    object btnSair: TRzButton
      Left = 289
      Top = 563
      Height = 39
      Caption = 'Sair'
      TabOrder = 1
      OnClick = btnSairClick
    end
    object btnPath: TRzButton
      Left = 129
      Top = 28
      Width = 328
      Caption = 'C:\Users\Uusuario\Documents\infos.json'
      TabOrder = 2
      OnClick = btnPathClick
    end
    object btnSave: TButton
      Left = 22
      Top = 520
      Width = 610
      Height = 37
      Caption = 'Salvar'
      TabOrder = 0
    end
    object btnExport: TRzButton
      Left = 116
      Top = 71
      Width = 325
      Caption = '...'
      TabOrder = 3
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object BUTTONS: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avBottom
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = BUTTONS
      AlignHorz = ahCenter
      CaptionOptions.Visible = False
      Control = btnSair
      ControlOptions.OriginalHeight = 39
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object Options: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      CaptionOptions.Text = 'Arquivo de salvamento'
      ButtonOptions.Buttons = <>
      Index = 1
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = Options
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Local de Salvamento:'
      Control = btnPath
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 328
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = BUTTONS
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Button1'
      CaptionOptions.Visible = False
      Control = btnSave
      ControlOptions.OriginalHeight = 37
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Local de Exporta'#231#227'o:'
      Control = btnExport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 325
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  object rzSelectFolder: TRzSelectFolderDialog
    Title = 'Selecione uma pasta'
    ToolBtnVisualStyle = vsClassic
    Left = 488
    Top = 24
  end
  object Dam1: TDam
    Left = 536
    Top = 24
    object _AvisoDamMsg1: TDamMsg
      Icone = diAviso
      Mensagem = 
        '~M~N~T[12]AVISO~t~c~n'#13#10'~MSe alterado o caminho para a pasta, dev' +
        'e-se carregar a tabela novamente!'
      Dam = Dam1
    end
  end
end
