unit Routes.Task;

interface

  procedure RegisterRoutes;

implementation

uses
  Horse,
  System.SysUtils,
  Controller.Task;

procedure CreateTask(AReq: THorseRequest; ARes: THorseResponse; ANext: TProc);
begin
  try
    TTaskController.Instance.Insert(AReq.Body);
    ARes.Status(201).Send('');
  except
    ARes.Status(500).Send('');
  end;
end;

procedure ReadTask(AReq: THorseRequest; ARes: THorseResponse; ANext: TProc);
var
  TaskList: String;
begin
  try
    TaskList := TTaskController.Instance.Read;
    ARes.Status(200).Send(TaskList);
  except
    ARes.Status(500).Send('');
  end;
end;

procedure TaskDashboard(AReq: THorseRequest; ARes: THorseResponse; ANext: TProc);
var
  Dashboard: String;
begin
  try
    Dashboard := TTaskController.Instance.ReadDashboard;
    ARes.Status(200).Send(Dashboard);
  except
    ARes.Status(500).Send('');
  end;
end;

procedure UpdateTask(AReq: THorseRequest; ARes: THorseResponse; ANext: TProc);
begin
  try
    TTaskController.Instance.Update(AReq.Body);
    ARes.Status(200).Send('');
  except
    ARes.Status(500).Send('');
  end;
end;

procedure DeleteTask(AReq: THorseRequest; ARes: THorseResponse; ANext: TProc);
begin
  try
    TTaskController.Instance.Delete(AReq.Params.Items['id'].ToInt64);
    ARes.Status(200).Send('');
  except
    ARes.Status(500).Send('');
  end;
end;

procedure RegisterRoutes;
begin
  THorse.Post('/task', CreateTask);
  THorse.Get('/task', ReadTask);
  THorse.Put('/task', UpdateTask);
  THorse.Delete('/task/:id', DeleteTask);
  THorse.Get('/taskdashboard', TaskDashboard)
end;

end.
