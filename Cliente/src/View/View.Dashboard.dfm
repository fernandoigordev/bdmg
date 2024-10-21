object DashboardView: TDashboardView
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 540
  ClientWidth = 836
  Color = clWhite
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
  object Label9: TLabel
    Left = 306
    Top = 78
    Width = 42
    Height = 40
    Caption = '12'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -33
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 388
    Top = 91
    Width = 33
    Height = 13
    Caption = 'Normal'
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 836
    Height = 60
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '  Dashboard de tarefas'
    Color = 16750083
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object PanelDashboard: TPanel
    Left = 0
    Top = 60
    Width = 836
    Height = 189
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '  Dashboard de tarefas'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object ShapeCompletedTask: TShape
      Left = 19
      Top = 17
      Width = 250
      Height = 150
      Cursor = crHandPoint
      Brush.Color = 16750083
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object Shape1: TShape
      Left = 289
      Top = 17
      Width = 250
      Height = 150
      Cursor = crHandPoint
      Brush.Color = 5592298
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object Shape2: TShape
      Left = 562
      Top = 17
      Width = 250
      Height = 150
      Cursor = crHandPoint
      Brush.Color = 7325480
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object Label1: TLabel
      Left = 55
      Top = 32
      Width = 110
      Height = 19
      Caption = 'Total de tarefas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelTotalTasks: TLabel
      Left = 55
      Top = 83
      Width = 42
      Height = 40
      Caption = '27'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -33
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 298
      Top = 32
      Width = 219
      Height = 38
      Caption = 'M'#233'dia de prioridade de tarefas pendentes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object LabelLowTask: TLabel
      Left = 298
      Top = 70
      Width = 34
      Height = 33
      Caption = '12'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 584
      Top = 32
      Width = 130
      Height = 19
      Caption = 'Tarefas conclu'#237'das'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelCompletedTasks: TLabel
      Left = 587
      Top = 83
      Width = 42
      Height = 40
      Caption = '12'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -33
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 657
      Top = 97
      Width = 151
      Height = 23
      Caption = 'Nos '#250'ltimos 7 dias'
    end
    object Label7: TLabel
      Left = 381
      Top = 81
      Width = 37
      Height = 19
      Caption = 'Baixa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 117
      Top = 97
      Width = 139
      Height = 23
      Caption = 'Em todo per'#237'odo'
    end
    object LabelNormalTask: TLabel
      Left = 298
      Top = 101
      Width = 34
      Height = 33
      Caption = '07'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 381
      Top = 112
      Width = 52
      Height = 19
      Caption = 'Normal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelHighTask: TLabel
      Left = 298
      Top = 131
      Width = 34
      Height = 33
      Caption = '11'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 381
      Top = 142
      Width = 28
      Height = 19
      Caption = 'Alta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
end
