program client_dbmg;

uses
  Vcl.Forms,
  View.Task in 'src\View\View.Task.pas' {TaskView},
  Controller.Task in 'src\Controller\Controller.Task.pas',
  Model.Task in 'src\Model\Model.Task.pas',
  Model.Task.Interfaces in 'src\Model\Model.Task.Interfaces.pas',
  Comum.Dto.Task in '..\Comum\Dto\Comum.Dto.Task.pas',
  View.Menu in 'src\View\View.Menu.pas' {MenuView},
  View.Dashboard in 'src\View\View.Dashboard.pas' {DashboardView},
  Controller.TaskDashboard in 'src\Controller\Controller.TaskDashboard.pas',
  Model.TaskDashboard.Interfaces in 'src\Model\Model.TaskDashboard.Interfaces.pas',
  Model.TaskDashboard in 'src\Model\Model.TaskDashboard.pas',
  Comum.Dto.TaskDashBoard in '..\Comum\Dto\Comum.Dto.TaskDashBoard.pas',
  Consts in 'src\Consts.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMenuView, MenuView);
  Application.Run;
end.
