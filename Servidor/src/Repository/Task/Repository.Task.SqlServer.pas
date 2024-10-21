unit Repository.Task.SqlServer;

interface
  uses
    Repository.Task.Interfaces,
    Model.Task.Interfaces,
    System.Generics.Collections,
    Comum.Dto.TaskDashBoard,
    FireDAC.Comp.Client,
    FireDAC.Stan.Param;

type
  TTaskRepositorySqlServer = class(TInterfacedObject, ITaskRepository)
  private
    FQuery: TFDQuery;
    procedure SetInsertSql(ATaskModel: ITaskModel);
    procedure SetReadSql;
    procedure SetUpdateSql(ATaskModel: ITaskModel);
    procedure SetDeleteSql(AId: Integer);

    procedure SetTotalTasksSql;
    procedure SetTotalAvgPendingTask;
    procedure SetTotalTasksCompletedPerDay(ANumberDays: Integer);
  public
    constructor create;
    destructor Destroy;override;
    procedure Insert(ATaskModel: ITaskModel);
    function Read: TList<ITaskModel>;
    procedure Update(ATaskModel: ITaskModel);
    procedure Delete(AId: Integer);
    function ReadDashboard: TTaskDashBoardDto;
  end;

implementation

uses
  System.SysUtils,
  Data.Repository.DM,
  Model.Task,
  System.DateUtils,
  Types.Task;

{ TTaskRepositorySqlServer }

constructor TTaskRepositorySqlServer.create;
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := DM.FDConnection1;
end;

procedure TTaskRepositorySqlServer.Delete(AId: Integer);
begin
  FQuery.Connection.StartTransaction;
  try
    SetDeleteSql(AId);
    FQuery.ExecSQL;
    FQuery.Connection.Commit;
  except
    FQuery.Connection.Rollback;
    raise;
  end;
end;

destructor TTaskRepositorySqlServer.Destroy;
begin
  FQuery.Free;
  inherited;
end;

procedure TTaskRepositorySqlServer.Insert(ATaskModel: ITaskModel);
begin
  FQuery.Connection.StartTransaction;
  try
    SetInsertSql(ATaskModel);
    FQuery.ExecSQL;
    FQuery.Connection.Commit;
  except
    FQuery.Connection.Rollback;
    raise;
  end;
end;

function TTaskRepositorySqlServer.Read: TList<ITaskModel>;
begin
  Result := TList<ITaskModel>.Create;
  try
    SetReadSql;
    FQuery.Open;
    FQuery.First;
    while not FQuery.Eof do
    begin
      Result.Add(TTaskModel.Create(Self));
      Result.Last
              .Id(FQuery.FieldByName('Id').AsInteger)
              .Description(FQuery.FieldByName('Description').AsString)
              .PriorityId(FQuery.FieldByName('IdTaskPriority').AsInteger)
              .StatusId(FQuery.FieldByName('IdTaskStatus').AsInteger)
              .CreatedAt(FQuery.FieldByName('CreatedAt').AsDateTime)
              .CompletedAt(FQuery.FieldByName('CompletedAt').AsDateTime);
      FQuery.Next;
    end;
  except
    Result.Free;
    raise;
  end;
end;

function TTaskRepositorySqlServer.ReadDashboard: TTaskDashBoardDto;
begin
  Result := TTaskDashBoardDto.Create;
  try
    SetTotalTasksSql;
    FQuery.Open;
    Result.TotalTask := FQuery.FieldByName('QUANTITY_TASK').AsInteger;

    SetTotalTasksCompletedPerDay(7);
    FQuery.Open;
    Result.CompletedTask := FQuery.FieldByName('QUANTITY_TASK').AsInteger;
  except
    Result.Free;
  end;

end;

procedure TTaskRepositorySqlServer.SetDeleteSql(AId: Integer);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Text := Concat('DELETE FROM TASK WHERE ID = :ID');
  FQuery.ParamByName('ID').AsInteger := AId;
end;

procedure TTaskRepositorySqlServer.SetInsertSql(ATaskModel: ITaskModel);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Concat('INSERT TASK(DESCRIPTION, IDTASKPRIORITY, IDTASKSTATUS, CREATEDAT, COMPLETEDAT) ',
                        'VALUES(:DESCRIPTION, :IDTASKPRIORITY, :IDTASKSTATUS, :CREATEDAT, :COMPLETEDAT)'));

  FQuery.ParamByName('DESCRIPTION').AsString := ATaskModel.Description;
  FQuery.ParamByName('IDTASKPRIORITY').AsInteger := ATaskModel.PriorityId;
  FQuery.ParamByName('IDTASKSTATUS').AsInteger := ATaskModel.StatusId;
  FQuery.ParamByName('CREATEDAT').AsDate := Now;
  FQuery.ParamByName('COMPLETEDAT').AsDate := 0;

  if (ATaskModel.CompletedAt > 0) or (ATaskModel.StatusId = Integer(tsCompleted)) then
    FQuery.ParamByName('COMPLETEDAT').AsDate := Now;
end;

procedure TTaskRepositorySqlServer.SetReadSql;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Text := 'SELECT * FROM TASK';
end;

procedure TTaskRepositorySqlServer.SetTotalAvgPendingTask;
begin
//  FQuery.SQL.Clear;
//  FQuery.SQL.Text := 'SELECT * FROM TASK';
end;

procedure TTaskRepositorySqlServer.SetTotalTasksCompletedPerDay(ANumberDays: Integer);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Concat('SELECT COUNT(ID) QUANTITY_TASK ',
                        '  FROM TASK ',
                        ' WHERE IDTASKSTATUS = ', Integer(tsCompleted).ToString,
                        '   AND COMPLETEDAT > :STARTDATE'
                        ));
  FQuery.ParamByName('STARTDATE').AsDate := IncDay(Now, -ANumberDays);
end;

procedure TTaskRepositorySqlServer.SetTotalTasksSql;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT COUNT(ID) QUANTITY_TASK FROM TASK');
end;

procedure TTaskRepositorySqlServer.SetUpdateSql(ATaskModel: ITaskModel);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Concat('UPDATE TASK SET DESCRIPTION = :DESCRIPTION, IDTASKPRIORITY = :IDTASKPRIORITY, ',
                        '                IDTASKSTATUS = :IDTASKSTATUS, COMPLETEDAT = :COMPLETEDAT ',
                        ' WHERE ID = :ID'));

  FQuery.ParamByName('ID').AsInteger := ATaskModel.Id;
  FQuery.ParamByName('DESCRIPTION').AsString := ATaskModel.Description;
  FQuery.ParamByName('IDTASKPRIORITY').AsInteger := ATaskModel.PriorityId;
  FQuery.ParamByName('IDTASKSTATUS').AsInteger := ATaskModel.StatusId;

  if (ATaskModel.CompletedAt > 0) or (ATaskModel.StatusId = Integer(tsCompleted)) then
    FQuery.ParamByName('COMPLETEDAT').AsDateTime := Now;
end;

procedure TTaskRepositorySqlServer.Update(ATaskModel: ITaskModel);
begin
  FQuery.Connection.StartTransaction;
  try
    SetUpdateSql(ATaskModel);
    FQuery.ExecSQL;
    FQuery.Connection.Commit;
  except
    FQuery.Connection.Rollback;
    raise;
  end;
end;

end.
