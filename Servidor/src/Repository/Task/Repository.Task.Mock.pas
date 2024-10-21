unit Repository.Task.Mock;

interface
uses
  Repository.Task.Interfaces,
  Model.Task.Interfaces,
  System.Generics.Collections,
  Comum.Dto.TaskDashBoard;

type
  TTaskRepositortMock = class(TInterfacedObject, ITaskRepository)
  private
    FTaskModelList: TList<ITaskModel>;
  public
    procedure Insert(ATaskModel: ITaskModel);
    function Read: TList<ITaskModel>;
    procedure Update(ATaskModel: ITaskModel);
    procedure Delete(AId: Integer);
    function ReadDashboard: TTaskDashBoardDto;

    constructor Create;
    destructor Destroy;override;
  end;

implementation

{ TTaskRepositortMock }

constructor TTaskRepositortMock.Create;
begin
  FTaskModelList := TList<ITaskModel>.Create;
end;

procedure TTaskRepositortMock.Delete(AId: Integer);
var
  Index: Integer;
begin
  for Index := 0 to Pred(FTaskModelList.Count) do
  begin
    if FTaskModelList.Items[Index].Id = AId then
      FTaskModelList.Delete(Index);
  end;
end;

destructor TTaskRepositortMock.Destroy;
begin
  FTaskModelList.Free;
  inherited;
end;

procedure TTaskRepositortMock.Insert(ATaskModel: ITaskModel);
begin
  FTaskModelList.Add(ATaskModel);
end;

function TTaskRepositortMock.Read: TList<ITaskModel>;
var
  TaskModel: ITaskModel;
begin
  Result := TList<ITaskModel>.Create;
  try
    for TaskModel in FTaskModelList do
      Result.Add(TaskModel);
  except
    Result.Free;
    raise;
  end;
end;

function TTaskRepositortMock.ReadDashboard: TTaskDashBoardDto;
begin
  Result := TTaskDashBoardDto.Create;
  Result.TotalTask := 50;
  Result.CompletedTask := 38;
  Result.AverageLowPriorityPendingTasks := 10;
  Result.AverageNormalPriorityPendingTasks := 20;
  Result.AverageHighPriorityPendingTasks := 30;
end;

procedure TTaskRepositortMock.Update(ATaskModel: ITaskModel);
var
  TaskModel: ITaskModel;
begin
  for TaskModel in FTaskModelList do
  begin
    if TaskModel.Id = ATaskModel.Id then
    begin
      TaskModel
        .Id(ATaskModel.Id)
        .Description(ATaskModel.Description)
        .StatusId(ATaskModel.StatusId)
        .PriorityId(ATaskModel.PriorityId)
        .CreatedAt(ATaskModel.CreatedAt)
        .CompletedAt(ATaskModel.CompletedAt);
    end;
  end;
end;

end.
