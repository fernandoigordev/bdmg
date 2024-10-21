unit Controller.TaskDashboard;

interface

uses
  Model.TaskDashboard.Interfaces;

type
  AveragePriorityPendingTasks = record
    LowPriority: Double;
    NormalPriority: Double;
    HighPriority: Double;
  end;

  TTaskDashboardController = class
  private
    FTaskDashboardModel: ITaskDashboardModel;
  public
    constructor Create;
    procedure Refresh;
    function TotalTask: Integer;
    function CompletedTask: Integer;
    function AveragePriorityPendingTasks: AveragePriorityPendingTasks;
  end;

implementation

uses
  Model.TaskDashboard;

{ TTaskDashboardController }

function TTaskDashboardController.AveragePriorityPendingTasks: AveragePriorityPendingTasks;
begin
  Result.LowPriority := FTaskDashboardModel.AverageLowPriorityPendingTasks;
  Result.NormalPriority := FTaskDashboardModel.AverageNormalPriorityPendingTasks;
  Result.HighPriority := FTaskDashboardModel.AverageHighPriorityPendingTasks;
end;

function TTaskDashboardController.CompletedTask: Integer;
begin
  Result := FTaskDashboardModel.CompletedTask;
end;

constructor TTaskDashboardController.Create;
begin
  FTaskDashboardModel := TTaskDashboardModel.Create;
end;


procedure TTaskDashboardController.Refresh;
begin
  FTaskDashboardModel.Refresh;
end;

function TTaskDashboardController.TotalTask: Integer;
begin
  Result := FTaskDashboardModel.TotalTask;
end;

end.
