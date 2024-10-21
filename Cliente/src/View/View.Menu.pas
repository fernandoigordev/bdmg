unit View.Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TMenuView = class(TForm)
    PanelLeft: TPanel;
    ImageLogo: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButtonDashboard: TSpeedButton;
    SpeedButtonTask: TSpeedButton;
    PanelView: TPanel;
    procedure SpeedButtonTaskClick(Sender: TObject);
    procedure SpeedButtonDashboardClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure FinalizationApp;
  public
    { Public declarations }
  end;

var
  MenuView: TMenuView;

implementation

uses
  View.Task,
  View.Dashboard,
  System.UITypes;

{$R *.dfm}

procedure TMenuView.FinalizationApp;
begin
  if MessageDlg('Deseja realmente sair da aplicação?', mtConfirmation, mbYesNo, 0) = mrYes then
    Application.Terminate;
end;

procedure TMenuView.SpeedButton1Click(Sender: TObject);
begin
  FinalizationApp;
end;

procedure TMenuView.SpeedButtonDashboardClick(Sender: TObject);
begin
  if not TDashboardView.Instance(PanelView).Showing then
    TDashboardView.Instance(PanelView).Show;

  TDashboardView.Instance(PanelView).BringToFront;
end;

procedure TMenuView.SpeedButtonTaskClick(Sender: TObject);
begin
  if not TTaskView.Instance(PanelView).Showing then
    TTaskView.Instance(PanelView).Show;

  TTaskView.Instance(PanelView).BringToFront;
end;

end.
