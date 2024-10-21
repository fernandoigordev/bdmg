program api_bdmg;

uses
  Vcl.Forms,
  Controller.Task in 'src\Controller\Controller.Task.pas',
  Model.Task.Interfaces in 'src\Model\Task\Model.Task.Interfaces.pas',
  Model.Task in 'src\Model\Task\Model.Task.pas',
  Repository.Task.Interfaces in 'src\Repository\Task\Repository.Task.Interfaces.pas',
  Data.Repository.DM in 'src\Repository\Data.Repository.DM.pas' {DM: TDataModule},
  Routes.Task in 'src\Routes\Routes.Task.pas',
  View.Api in 'src\View\View.Api.pas' {ViewApi},
  Comum.Dto.Task in '..\Comum\Dto\Comum.Dto.Task.pas',
  Comum.Dto.TaskDashBoard in '..\Comum\Dto\Comum.Dto.TaskDashBoard.pas',
  Types.Task in '..\Comum\Types\Types.Task.pas',
  Repository.Task.SqlServer in 'src\Repository\Task\Repository.Task.SqlServer.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TViewApi, ViewApi);
  Application.Run;
end.
