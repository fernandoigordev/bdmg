unit Data.Repository.DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.MySQL, FireDAC.Phys.MSSQLDef, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL;

type
  TDM = class(TDataModule)
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure ConfigConnection;
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses
  IniFiles, Vcl.Forms;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.ConfigConnection;
var
  Config: TIniFile;
  PathFile: String;
begin
  PathFile := Concat(ExtractFilePath(Application.ExeName), 'config.ini');
  if FileExists(PathFile) then
  begin
    Config := TIniFile.Create(PathFile);
    try
      FDConnection1.Connected := False;
      FDConnection1.LoginPrompt := False;
      FDConnection1.Params.DriverID := Config.ReadString('Database', 'DriverID', '');

      if SameText(FDConnection1.Params.DriverID, 'SQLite') then
        FDConnection1.Params.Database := Config.ReadString('Database', 'Database', '')
      else
      begin
        FDConnection1.Params.Database := Config.ReadString('Database', 'Database', '');
        FDConnection1.Params.UserName := Config.ReadString('Database', 'User_Name', '');
        FDConnection1.Params.Password := Config.ReadString('Database', 'Password', '');
        FDConnection1.Params.Add(Concat('Server=',Config.ReadString('Database', 'Server', '')));
        FDConnection1.Params.Add(Concat('OSAuthent=',Config.ReadString('Database', 'OSAuthent', '')))
      end;

      try
        FDConnection1.Connected := True;
      Except
        on E: Exception do
        begin
          Exception.Create(Concat(E.Message, 'Erro ao conectar com o banco de dados revise as configurações no arquivo de configuração e execute novamente o sistema!'));
          Application.Terminate;
        end;
      end;
    finally
      Config.Free;
    end;
  end
  else
  begin
    Exception.Create(Concat('Arquivo de configuração não encontrado no caminho: ', PathFile));
    Application.Terminate;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  ConfigConnection;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  FDConnection1.Connected := False;
end;

end.
