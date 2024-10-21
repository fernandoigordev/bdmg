unit Model.Task.Interfaces;

interface

uses
  System.Generics.Collections,
  Comum.Dto.TaskDashBoard;

type
  ITaskModel = interface
     ['{5921DD5E-0016-4FF7-A529-380E5517C6E6}']

     function Id(AId: Integer): ITaskModel;overload;
     function Description(ADescription: String): ITaskModel;overload;
     function StatusId(AStatusId: Integer): ITaskModel;overload;
     function PriorityId(APriorityId: Integer): ITaskModel;overload;
     function CreatedAt(ACreatedAt: TDateTime): ITaskModel;overload;
     function CompletedAt(ACompletedAt: TDateTime): ITaskModel;overload;

     function Id: Integer;overload;
     function Description: String;overload;
     function StatusId: Integer;overload;
     function PriorityId: Integer;overload;
     function CreatedAt: TDateTime;overload;
     function CompletedAt: TDateTime;overload;

     procedure Insert;
     function Read: TList<ITaskModel>;
     procedure Update;
     procedure Delete(AId: Integer);
     function ReadDashboard: TTaskDashBoardDto;
  end;

implementation

end.
