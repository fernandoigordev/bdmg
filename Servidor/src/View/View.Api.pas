unit View.Api;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TViewApi = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    procedure InitializeServer;
  public
    { Public declarations }
  end;

var
  ViewApi: TViewApi;

implementation

uses
  Horse,
  Routes.Task,
  Horse.BasicAuthentication;
{$R *.dfm}

procedure TViewApi.FormCreate(Sender: TObject);
begin
  InitializeServer;
end;

procedure TViewApi.InitializeServer;
const
  API_USERNAME = 'dbmg';
  API_PASSWORD = '123456';
begin
  Routes.Task.RegisterRoutes;

  THorse.Use(HorseBasicAuthentication(
  function(const AUsername, APassword: string): Boolean
  begin
    Result := AUsername.Equals(API_USERNAME) and APassword.Equals(API_PASSWORD);
  end));

  THorse.Listen(9000);
end;

end.
