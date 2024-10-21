unit Model.Task.Interfaces;

interface

uses
  System.Generics.Collections,
  Comum.Dto.Task;

type
  ITaskModel = interface
    ['{A0DCFD27-5D53-4BF6-A06B-B2A5795859DA}']
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

end.
