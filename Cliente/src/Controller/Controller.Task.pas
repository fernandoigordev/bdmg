unit Controller.Task;

interface

uses
  Datasnap.DBClient;

type
  TTaskController = class
  private
    FCds: TClientDataSet;
  public
    constructor Create(AClientDataSet: TClientDataSet);
    procedure CreateTask;
    procedure UpdateTask;
    procedure ReadTasks;
    procedure DeleteTask;
  end;

implementation

uses
  Model.Task,
  Comum.Dto.Task,
  System.Generics.Collections;

{ TTaskController }

constructor TTaskController.Create(AClientDataSet: TClientDataSet);
begin
  FCds := AClientDataSet;
end;

procedure TTaskController.CreateTask;
begin
  TTaskModel.New
    .Id(FCds.FieldByName('Id').AsInteger)
    .Description(FCds.FieldByName('Description').AsString)
    .Status(FCds.FieldByName('Status').AsInteger)
    .Priority(FCds.FieldByName('Priority').AsInteger)
    .CreateTask;
end;

procedure TTaskController.DeleteTask;
begin
  TTaskModel.New
    .Id(FCds.FieldByName('Id').AsInteger)
    .DeleteTask;
end;

procedure TTaskController.ReadTasks;
var
  List: TList<TTaskDto>;
  TaskDto: TTaskDto;
begin
  List := TTaskModel.New.ReadTasks;
  try
    FCds.EmptyDataSet;
    if List.Count > 0 then
    begin
      for TaskDto in List do
      begin
        FCds.Append;
        FCds.FieldByName('Id').AsInteger := TaskDto.Id;
        FCds.FieldByName('Description').AsString := TaskDto.Description;
        FCds.FieldByName('Status').AsInteger := TaskDto.StatusId;
        FCds.FieldByName('Priority').AsInteger := TaskDto.PriorityId;
        FCds.Post;
      end;
    end;
  finally
    for TaskDto in List do
      TaskDto.Free;
    List.Free;
  end;
end;

procedure TTaskController.UpdateTask;
begin
  TTaskModel.New
    .Id(FCds.FieldByName('Id').AsInteger)
    .Description(FCds.FieldByName('Description').AsString)
    .Status(FCds.FieldByName('Status').AsInteger)
    .Priority(FCds.FieldByName('Priority').AsInteger)
    .UpdateTask;
end;

end.
