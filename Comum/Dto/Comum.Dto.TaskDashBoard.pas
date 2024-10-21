unit Comum.Dto.TaskDashBoard;

interface

type
  TTaskDashBoardDto = class
  private
    FTotalTask: Integer;
    FCompletedTask: Integer;
    FAverageLowPriorityPendingTasks: Double;
    FAverageNormalPriorityPendingTasks: Double;
    FAverageHighPriorityPendingTasks: Double;
  public
    property TotalTask: Integer read FTotalTask write FTotalTask;
    property CompletedTask: Integer read FCompletedTask write FCompletedTask;
    property AverageLowPriorityPendingTasks: Double read FAverageLowPriorityPendingTasks write FAverageLowPriorityPendingTasks;
    property AverageNormalPriorityPendingTasks: Double read FAverageNormalPriorityPendingTasks write FAverageNormalPriorityPendingTasks;
    property AverageHighPriorityPendingTasks: Double read FAverageHighPriorityPendingTasks write FAverageHighPriorityPendingTasks;
  end;

implementation

end.
