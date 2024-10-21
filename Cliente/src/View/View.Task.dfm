object TaskView: TTaskView
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'Tarefas'
  ClientHeight = 540
  ClientWidth = 820
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlTask: TPageControl
    Left = 0
    Top = 60
    Width = 820
    Height = 480
    ActivePage = TabSheetRegister
    Align = alClient
    TabOrder = 0
    object TabSheetSearch: TTabSheet
      Caption = 'TabSheetSearch'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object PanelHeader: TPanel
        Left = 0
        Top = 0
        Width = 812
        Height = 145
        Align = alTop
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object ShapeNewTask: TShape
          Left = 659
          Top = 106
          Width = 129
          Height = 37
          Cursor = crHandPoint
          Brush.Color = 16750083
          Pen.Style = psClear
          Shape = stRoundRect
        end
        object SpeedButtonNewTask: TSpeedButton
          Left = 659
          Top = 106
          Width = 129
          Height = 37
          Cursor = crHandPoint
          Caption = '+ Novo'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButtonNewTaskClick
        end
        object EditSearchTask: TEdit
          Left = 16
          Top = 49
          Width = 625
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TextHint = 'Nome da tarefa'
          OnChange = EditSearchTaskChange
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 145
        Width = 812
        Height = 325
        Align = alClient
        BorderStyle = bsNone
        Color = clWhite
        DataSource = DataSourceTask
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clGray
        TitleFont.Height = -15
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Id'
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clGray
            Title.Font.Height = -15
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 107
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Description'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clGray
            Title.Font.Height = -15
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 341
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Priority'
            Title.Caption = 'Cod. Prioridade'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clGray
            Title.Font.Height = -15
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 136
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Status'
            Title.Caption = 'Cod. Status'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clGray
            Title.Font.Height = -15
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 136
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clGray
            Title.Font.Height = -15
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            Width = 32
            Visible = True
          end>
      end
    end
    object TabSheetRegister: TTabSheet
      Caption = 'TabSheetRegister'
      ImageIndex = 1
      TabVisible = False
      object Label1: TLabel
        Left = 3
        Top = 8
        Width = 50
        Height = 19
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 3
        Top = 70
        Width = 67
        Height = 19
        Caption = 'Descri'#231#227'o'
        FocusControl = DBEdit2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 3
        Top = 134
        Width = 43
        Height = 19
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 3
        Top = 198
        Width = 72
        Height = 19
        Caption = 'Prioridade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 31
        Width = 134
        Height = 27
        DataField = 'Id'
        DataSource = DataSourceTask
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 3
        Top = 92
        Width = 633
        Height = 27
        DataField = 'Description'
        DataSource = DataSourceTask
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object PanelBottonRegister: TPanel
        Left = 0
        Top = 410
        Width = 812
        Height = 60
        Align = alBottom
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        object ShapeSave: TShape
          Left = 659
          Top = 14
          Width = 129
          Height = 37
          Cursor = crHandPoint
          Brush.Color = 7325480
          Pen.Style = psClear
          Shape = stRoundRect
        end
        object ShapeCancel: TShape
          Left = 507
          Top = 14
          Width = 129
          Height = 37
          Cursor = crHandPoint
          Brush.Color = 5592298
          Pen.Style = psClear
          Shape = stRoundRect
        end
        object SpeedButtonSave: TSpeedButton
          Left = 659
          Top = 14
          Width = 129
          Height = 37
          Cursor = crHandPoint
          Caption = 'Salvar'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButtonSaveClick
        end
        object SpeedButtonCancel: TSpeedButton
          Left = 507
          Top = 14
          Width = 129
          Height = 37
          Cursor = crHandPoint
          Caption = 'Cancelar'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButtonCancelClick
        end
      end
      object DBComboBoxStatus: TDBComboBox
        Left = 3
        Top = 159
        Width = 50
        Height = 27
        DataField = 'Status'
        DataSource = DataSourceTask
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Items.Strings = (
          '1'
          '2'
          '3')
        ParentFont = False
        TabOrder = 3
        OnChange = DBComboBoxStatusChange
      end
      object DBComboBoxPriority: TDBComboBox
        Left = 3
        Top = 223
        Width = 50
        Height = 27
        DataField = 'Priority'
        DataSource = DataSourceTask
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Items.Strings = (
          '1'
          '2'
          '3')
        ParentFont = False
        TabOrder = 4
        OnChange = DBComboBoxPriorityChange
      end
      object EditStatus: TEdit
        Left = 62
        Top = 159
        Width = 243
        Height = 27
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object EditPriority: TEdit
        Left = 62
        Top = 223
        Width = 243
        Height = 27
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
    end
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 820
    Height = 60
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '  Cadastro de tarefas'
    Color = 16750083
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object ClientDataSetTask: TClientDataSet
    PersistDataPacket.Data = {
      7D0000009619E0BD0100000018000000040000000000030000007D0002496404
      000100000000000B4465736372697074696F6E01004900000001000557494454
      4802000200C80006537461747573010049000000010005574944544802000200
      3200085072696F72697479010049000000010005574944544802000200320000
      00}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 256
    object ClientDataSetTaskId: TIntegerField
      FieldName = 'Id'
    end
    object ClientDataSetTaskDescription: TStringField
      FieldName = 'Description'
      Size = 200
    end
    object ClientDataSetTaskStatus: TStringField
      FieldName = 'Status'
      Size = 50
    end
    object ClientDataSetTaskPriority: TStringField
      FieldName = 'Priority'
      Size = 50
    end
  end
  object DataSourceTask: TDataSource
    DataSet = ClientDataSetTask
    Left = 272
    Top = 256
  end
  object ImageListTask: TImageList
    Left = 472
    Top = 256
    Bitmap = {
      494C010102000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      00000000000000000000000000000000000000000000FDD39700FDA83000FF96
      0300FF960300FF960300FF960300FF960300FF960300FF960300FF960300FD97
      0800FDA932000000000000000000000000000000000000000000000000000000
      0000D3D3F800D0D0F700D0D0F700D0D0F700D0D0F700D0D0F700D0D0F700D3D3
      F800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDD59D00FD970900FDCF8E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDCE8B00FF960300FDD7A300000000000000000000000000000000005554
      EA005554EA005554EA005554EA005554EA005554EA005554EA005554EA005554
      EA005554EA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDAB3A00FDCC8800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF960300FDAE4000000000000000000000000000000000005554
      EA005554EA005554EA005554EA005554EA005554EA005554EA005554EA005554
      EA005554EA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FD990E0000000000000000000000
      000000000000FDC47500FDEEDA00000000000000000000000000000000000000
      000000000000FF960300FD9B1200000000000000000000000000000000005554
      EA005554EA005554EA005554EA005554EA005554EA005554EA005554EA005554
      EA005554EA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FD990E0000000000000000000000
      0000FDD09000FF960300FD950300FDE1BC000000000000000000000000000000
      000000000000FF960300FD9B1200000000000000000000000000000000005554
      EA005554EA00DEDEF9005554EA00B6B6F400B6B6F4005554EA00DFDFF9005554
      EA005554EA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FD990E0000000000000000000000
      000000000000FF960300FDDDB100FD960700FF96030000000000000000000000
      000000000000FF960300FD9B1200000000000000000000000000D5D5F8005554
      EA005554EA00000000005554EA00D3D3F800D3D3F8005554EA00000000005554
      EA005554EA00D6D5F80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FD990E0000000000000000000000
      000000000000FF960300FDC88000FF960300FF960300FDC77C00000000000000
      000000000000FF960300FD9B1200000000000000000000000000C4C4F6005554
      EA005554EA00000000005554EA00D3D3F800D3D3F8005554EA00000000005554
      EA005554EA00C5C5F60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FD990E0000000000000000000000
      000000000000FDAC3C00FF960300FDCC880000000000FF960300FD9503000000
      000000000000FF960300FD9B1200000000000000000000000000A4A4F2005554
      EA005554EA00DFDFF9005554EA00B7B7F400B6B6F4005554EA00E0DFF9005554
      EA005554EA00A4A4F20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FD990E0000000000000000000000
      00000000000000000000FDA72F00FDA62B0000000000FDC57700FF960300FDDF
      B50000000000FF960300FD9B12000000000000000000000000009494F0005554
      EA005554EA005554EA005554EA005554EA005554EA005554EA005554EA005554
      EA005554EA009594F00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FD990E0000000000000000000000
      0000000000000000000000000000FD9D1800FF9603000000000000000000FF96
      0300FD9C1400FDDAAA00FDE4C2000000000000000000000000007473EC005554
      EA005554EA005554EA005554EA005554EA005554EA005554EA005554EA005554
      EA005554EA007575EC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FD990E0000000000000000000000
      0000000000000000000000000000FDE8CB00FD990E00FDB95A0000000000FDAE
      3F00FF96030000000000000000000000000000000000000000006967EA005554
      EA005554EA005554EA005554EA005554EA005554EA005554EA005554EA005554
      EA005554EA006968EA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FD9D1800FDE8CB00000000000000
      00000000000000000000000000000000000000000000FD950400FF9603000000
      000000000000FF960300FDAA3700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDB24900FDC06A00000000000000
      00000000000000000000000000000000000000000000FDD19400FF960300FDD4
      9C0000000000FD9D1800FF96030000000000000000005756E8005554EA005554
      EA005554EA005554EA005554EA005554EA005554EA005554EA005554EA005554
      EA005554EA005554EA005756E800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FD950300FF960300FF96
      0300FF960300FF960300FF960300FF960300FF960300FDB0460000000000FF96
      0300FD97090000000000FDD9A800FDA42800000000005756E8005554EA005554
      EA005554EA005554EA005554EA005554EA005554EA005554EA005554EA005554
      EA005554EA005554EA005756E800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDE8CB00FDBE6700FDA9
      3400FDA93400FDA93400FDA93400FDA93400FDA93400FDD2960000000000FDB7
      5600FF960300FDE3C000FDD09000FDA429000000000000000000000000000000
      0000000000005554EA005554EA005554EA005554EA005554EA005554EA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FD9D1800FD9F1C00000000000000000000000000000000000000
      000000000000D0D0F700D0D0F700D0D0F700D0D0F700D0D0F700D0D0F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF008007F00F000000001FF1E00700000000
      3FF9E0070000000079F9E0070000000070F9E007000000007879C42300000000
      7839C423000000007899C003000000007C89C003000000007E61C00300000000
      7E27C003000000003F99FFFF000000003F898001000000008024800100000000
      8020F81F00000000FFF9F81F0000000000000000000000000000000000000000
      000000000000}
  end
end
