unit Model.TaskDashboard.Interfaces;

interface

type
  ITaskDashboardModel = interface
    ['{7B7E5BC3-5130-4F0F-AD86-94BBA9A56EB1}']
    procedure Refresh;
    function TotalTask: Integer;
    function CompletedTask: Integer;
    function AverageLowPriorityPendingTasks: Double;
    function AverageNormalPriorityPendingTasks: Double;
    function AverageHighPriorityPendingTasks: Double;
  end;

implementation

end.
