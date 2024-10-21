unit Repository.Task.Interfaces;

interface
uses
  Model.Task.Interfaces,
  System.Generics.Collections,
  Comum.Dto.TaskDashBoard;

type
  ITaskRepository = interface
    ['{5AFF0DFB-1DC4-4410-A688-AE7A61E6F74D}']
    procedure Insert(ATaskModel: ITaskModel);
    function Read: TList<ITaskModel>;
    procedure Update(ATaskModel: ITaskModel);
    procedure Delete(AId: Integer);
    function ReadDashboard: TTaskDashBoardDto;
  end;

implementation

end.
