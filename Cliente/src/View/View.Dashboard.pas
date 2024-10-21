unit View.Dashboard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Controller.TaskDashboard;

type
  TDashboardView = class(TForm)
    PanelTop: TPanel;
    PanelDashboard: TPanel;
    ShapeCompletedTask: TShape;
    Shape1: TShape;
    Shape2: TShape;
    Label1: TLabel;
    LabelTotalTasks: TLabel;
    Label2: TLabel;
    LabelLowTask: TLabel;
    Label4: TLabel;
    LabelCompletedTasks: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    LabelNormalTask: TLabel;
    Label12: TLabel;
    LabelHighTask: TLabel;
    Label14: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    class var FInstance: TDashboardView;
    FTaskDashboardController: TTaskDashboardController;
    procedure UpdateDashboard;
  public
    class function Instance(AParent: TWinControl): TDashboardView;
  end;

implementation


{$R *.dfm}

{ TDashboardView }

procedure TDashboardView.FormCreate(Sender: TObject);
begin
  FTaskDashboardController := TTaskDashboardController.Create;
end;

procedure TDashboardView.FormDestroy(Sender: TObject);
begin
  FTaskDashboardController.Free;
end;

procedure TDashboardView.FormShow(Sender: TObject);
begin
  UpdateDashboard;
end;

class function TDashboardView.Instance(AParent: TWinControl): TDashboardView;
begin
  if not Assigned(FInstance) then
  begin
    FInstance := TDashboardView.Create(nil);
    FInstance.Parent := AParent;
  end;

  FInstance.UpdateDashboard;
  Result := FInstance;
end;

procedure TDashboardView.UpdateDashboard;
begin
  FTaskDashboardController.Refresh;
  LabelTotalTasks.Caption := FTaskDashboardController.TotalTask.ToString;
  LabelCompletedTasks.Caption := FTaskDashboardController.CompletedTask.ToString;
  LabelLowTask.Caption := FTaskDashboardController.AveragePriorityPendingTasks
                            .LowPriority.ToString;
  LabelNormalTask.Caption := FTaskDashboardController.AveragePriorityPendingTasks
                               .NormalPriority.ToString;
  LabelHighTask.Caption := FTaskDashboardController.AveragePriorityPendingTasks
                             .HighPriority.ToString;
end;


end.
