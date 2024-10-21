unit Model.TaskDashboard;

interface

uses
  Model.TaskDashboard.Interfaces;

type
  TTaskDashboardModel = class(TInterfacedObject, ITaskDashboardModel)
  private
    FAverageLowPriorityPendingTasks: Double;
    FAverageNormalPriorityPendingTasks: Double;
    FAverageHighPriorityPendingTasks: Double;
    FTotalTask: Integer;
    FCompletedTask: Integer;
  public
    procedure Refresh;
    function TotalTask: Integer;
    function CompletedTask: Integer;
    function AverageLowPriorityPendingTasks: Double;
    function AverageNormalPriorityPendingTasks: Double;
    function AverageHighPriorityPendingTasks: Double;
  end;

implementation

uses
  RESTRequest4D,
  Comum.Dto.TaskDashBoard,
  REST.Json,
  Consts;

{ TTaskDashboardModel }

function TTaskDashboardModel.AverageHighPriorityPendingTasks: Double;
begin
  Result := FAverageHighPriorityPendingTasks;
end;

function TTaskDashboardModel.AverageLowPriorityPendingTasks: Double;
begin
  Result := FAverageLowPriorityPendingTasks;
end;

function TTaskDashboardModel.AverageNormalPriorityPendingTasks: Double;
begin
  Result := FAverageNormalPriorityPendingTasks;
end;

function TTaskDashboardModel.CompletedTask: Integer;
begin
  Result := FCompletedTask;
end;

procedure TTaskDashboardModel.Refresh;
var
  Response: IResponse;
  TaskDashBoardDto: TTaskDashBoardDto;
begin
  FTotalTask := 0;
  FCompletedTask := 0;
  FAverageLowPriorityPendingTasks := 0;
  FAverageNormalPriorityPendingTasks := 0;
  FAverageHighPriorityPendingTasks := 0;

  Response := TRequest.New.BaseURL(Concat(BASE_URL, '/taskdashboard'))
                .Accept('application/json')
                .BasicAuthentication(API_USERNAME, API_USER_PASSWORD)
                .Get;

  if Response.StatusCode = 200 then
  begin
    TaskDashBoardDto := TJson.JsonToObject<TTaskDashBoardDto>(Response.Content);
    try
      FTotalTask := TaskDashBoardDto.TotalTask;
      FCompletedTask := TaskDashBoardDto.CompletedTask;
      FAverageLowPriorityPendingTasks := TaskDashBoardDto.AverageLowPriorityPendingTasks;
      FAverageNormalPriorityPendingTasks := TaskDashBoardDto.AverageNormalPriorityPendingTasks;
      FAverageHighPriorityPendingTasks := TaskDashBoardDto.AverageHighPriorityPendingTasks;
    finally
      TaskDashBoardDto.Free;
    end;
  end;
end;

function TTaskDashboardModel.TotalTask: Integer;
begin
  Result := FTotalTask;
end;

end.
