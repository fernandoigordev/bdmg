unit Model.Task;

interface

uses
  Model.Task.Interfaces,
  System.Generics.Collections,
  Comum.Dto.Task;

type
  TTaskModel = class(TInterfacedObject, ITaskModel)
  private
    FId: Integer;
    FDescription: String;
    FStatus: Integer;
    FPriority: Integer;
  public
    class function New: ITaskModel;
    function Id(AId: Integer): ITaskModel;overload;
    function Description(ADescription: String): ITaskModel;overload;
    function Status(AStatus: Integer): ITaskModel;overload;
    function Priority(APriority: Integer): ITaskModel;overload;

    function Id: Integer;overload;
    function Description: String;overload;
    function Status: Integer;overload;
    function Priority: Integer;overload;

    procedure CreateTask;
    function ReadTasks: TList<TTaskDto>;
    procedure UpdateTask;
    procedure DeleteTask;
  end;

implementation

uses
  RESTRequest4D,
  REST.Json,
  System.Classes,
  System.SysUtils,
  System.JSON,
  Consts;

{ TTaskModel }

procedure TTaskModel.CreateTask;
var
  TaskDto: TTaskDto;
  JsonTask: String;
begin
  TaskDto := TTaskDto.Create;
  try
    TaskDto.Id := FId;
    TaskDto.Description := FDescription;
    TaskDto.StatusId := FStatus;
    TaskDto.PriorityId := FPriority;
    JsonTask := TJson.ObjectToJsonString(TaskDto);

    TRequest.New.BaseURL(Concat(BASE_URL, '/task'))
      .Accept('application/json')
      .BasicAuthentication(API_USERNAME, API_USER_PASSWORD)
      .AddBody(JsonTask)
      .Post;
  finally
    TaskDto.Free;
  end;
end;

procedure TTaskModel.DeleteTask;
begin
  TRequest.New.BaseURL(Concat(BASE_URL, '/task/', IntToStr(FId)))
    .Accept('application/json')
    .BasicAuthentication(API_USERNAME, API_USER_PASSWORD)
    .Delete;
end;

function TTaskModel.Description(ADescription: String): ITaskModel;
begin
  Result := Self;
  FDescription := ADescription;
end;

function TTaskModel.Description: String;
begin
  Result := FDescription;
end;

function TTaskModel.Id: Integer;
begin
  Result := FId;
end;

class function TTaskModel.New: ITaskModel;
begin
  Result := TTaskModel.Create;
end;

function TTaskModel.Id(AId: Integer): ITaskModel;
begin
  Result := Self;
  FId := AId;
end;

function TTaskModel.Priority(APriority: Integer): ITaskModel;
begin
  Result := Self;
  FPriority := APriority;
end;

function TTaskModel.Priority: Integer;
begin
  Result := FPriority;
end;

function TTaskModel.ReadTasks: TList<TTaskDto>;
var
  JsonTask: String;
  TaskListJson: TJSONArray;
  Index: Integer;
  LResponse: IResponse;
begin
  Result := TList<TTaskDto>.Create;
  try
    LResponse := TRequest.New.BaseURL(Concat(BASE_URL, '/task'))
                  .Accept('application/json')
                  .BasicAuthentication(API_USERNAME, API_USER_PASSWORD)
                  .Get;
    JsonTask := LResponse.Content;

    if JsonTask <> EmptyStr then
    begin
      TaskListJson := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(JsonTask), 0) as TJSONArray;
      try
        for Index := 0 to Pred(TaskListJson.Count) do
        begin
          Result.Add(TTaskDto.Create);
          Result.Last.Id := TaskListJson.Items[Index].GetValue<Integer>('id');
          Result.Last.Description := TaskListJson.Items[Index].GetValue<String>('description');
          Result.Last.StatusId := TaskListJson.Items[Index].GetValue<Integer>('status');
          Result.Last.PriorityId := TaskListJson.Items[Index].GetValue<Integer>('priority');
        end;
      finally
        TaskListJson.Free;
      end;
    end;
  except
    Result.Free;
    raise;
  end;
end;

function TTaskModel.Status: Integer;
begin
  Result := FStatus;
end;

function TTaskModel.Status(AStatus: Integer): ITaskModel;
begin
  Result := Self;
  FStatus := AStatus;
end;

procedure TTaskModel.UpdateTask;
var
  TaskDto: TTaskDto;
  JsonTask: String;
begin
  TaskDto := TTaskDto.Create;
  try
    TaskDto.Id := FId;
    TaskDto.Description := FDescription;
    TaskDto.StatusId := FStatus;
    TaskDto.PriorityId := FPriority;
    JsonTask := TJson.ObjectToJsonString(TaskDto);

    TRequest.New.BaseURL(Concat(BASE_URL, '/task'))
      .Accept('application/json')
      .BasicAuthentication(API_USERNAME, API_USER_PASSWORD)
      .AddBody(JsonTask)
      .Put;
  finally
    TaskDto.Free;
  end;
end;

end.
