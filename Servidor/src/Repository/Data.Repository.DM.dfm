object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 232
  Width = 408
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Repositories\wk_pdv\dataBase.sqlite'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 56
    Top = 40
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 232
    Top = 24
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 232
    Top = 88
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 232
    Top = 152
  end
end
