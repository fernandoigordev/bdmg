unit Controller.Task;

interface

uses
  Model.Task.Interfaces;

type
  TTaskController = class
  private
    class var FInstance: TTaskController;
    FTaskModel: ITaskModel;
    constructor Create;
    procedure Fill(AJson: String);
  public
    class function Instance: TTaskController;
    procedure Insert(AJson: String);
    function Read: String;
    procedure Update(AJson: String);
    procedure Delete(AId: Integer);
    function ReadDashboard: String;
  end;

implementation

uses
  System.SysUtils,
  REST.Json,
  System.Generics.Collections,
  Comum.Dto.Task,
  Model.Task,
  System.JSON,
  Comum.Dto.TaskDashBoard,
  Repository.Task.SqlServer;

procedure TTaskController.Fill(AJson: String);
var
  TaskDto: TTaskDto;
begin
  TaskDto := TJson.JsonToObject<TTaskDto>(AJson);
  try
    FTaskModel
      .Id(TaskDto.Id)
      .Description(TaskDto.Description)
      .StatusId(TaskDto.StatusId)
      .PriorityId(TaskDto.PriorityId);
  finally
    TaskDto.Free;
  end;
end;

procedure TTaskController.Insert(AJson: String);
begin
  Fill(AJson);
  FTaskModel.Insert;
end;

class function TTaskController.Instance: TTaskController;
begin
  if not Assigned(FInstance) then
    FInstance := TTaskController.Create;

  Result := FInstance;
end;

function TTaskController.Read: String;
var
  TaskDtoList: TJSONArray;
  TaskModelList: TList<ITaskModel>;
  TaskDto: TTaskDto;
  TaskModel: ITaskModel;
begin
  TaskModelList := FTaskModel.Read;
  try
    TaskDtoList := TJSONArray.Create;
    try
      for TaskModel in TaskModelList do
      begin
        TaskDto := TTaskDto.Create;
        try
          TaskDto.Id := TaskModel.Id;
          TaskDto.Description := TaskModel.Description;
          TaskDto.StatusId := TaskModel.StatusId;
          TaskDto.PriorityId := TaskModel.PriorityId;
          TaskDtoList.AddElement(TJson.ObjectToJsonObject(TaskDto));
        finally
          TaskDto.Free;
        end;
      end;
      Result := TaskDtoList.ToJSON;
    finally
      TaskDtoList.Free;
    end;
  finally
    TaskModelList.Free;
  end;
end;

function TTaskController.ReadDashboard: String;
var
  TaskDashBoardDto: TTaskDashBoardDto;
begin
  Result := EmptyStr;
  TaskDashBoardDto := FTaskModel.ReadDashboard;
  try
    Result := TJson.ObjectToJsonString(TaskDashBoardDto);
  finally
    TaskDashBoardDto.Free;
  end;
end;

procedure TTaskController.Update(AJson: String);
begin
  Fill(AJson);
  FTaskModel.Update;
end;

constructor TTaskController.Create;
begin
  FTaskModel := TTaskModel.Create(TTaskRepositorySqlServer.Create);
end;

procedure TTaskController.Delete(AId: Integer);
begin
  FTaskModel.Delete(AId);
end;

initialization

finalization
  FreeAndNil(TTaskController.FInstance);

end.
