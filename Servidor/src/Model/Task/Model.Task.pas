unit Model.Task;

interface

uses
  Model.Task.Interfaces,
  Repository.Task.Interfaces,
  System.Generics.Collections,
  Comum.Dto.TaskDashBoard;

type
  TTaskModel = class(TInterfacedObject, ITaskModel)
  private
    FTaskRepository: ITaskRepository;
    FId: Integer;
    FDescription: String;
    FStatusId: Integer;
    FPriorityId: Integer;
    FCreatedAt: TDateTime;
    FCompletedAt: TDateTime;
  public
    constructor Create(ATaskRepository: ITaskRepository);
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

{ TaskModel }

function TTaskModel.CompletedAt: TDateTime;
begin
  Result := FCompletedAt;
end;

function TTaskModel.CompletedAt(ACompletedAt: TDateTime): ITaskModel;
begin
  Result := Self;
  FCompletedAt := ACompletedAt;
end;

constructor TTaskModel.Create(ATaskRepository: ITaskRepository);
begin
  FTaskRepository := ATaskRepository;
end;

function TTaskModel.CreatedAt: TDateTime;
begin
  Result := FCreatedAt;
end;

function TTaskModel.CreatedAt(ACreatedAt: TDateTime): ITaskModel;
begin
  Result := Self;
  FCreatedAt := ACreatedAt;
end;

procedure TTaskModel.Delete(AId: Integer);
begin
  FTaskRepository.Delete(AId);
end;

function TTaskModel.Description(ADescription: String): ITaskModel;
begin
  Result := Self;
  FDescription := ADescription;
end;

function TTaskModel.Description: String;
begin
  Result := FDescription;
end;

function TTaskModel.Id(AId: Integer): ITaskModel;
begin
  Result := Self;
  FId := AId;
end;

function TTaskModel.Id: Integer;
begin
  Result := FId;
end;

procedure TTaskModel.Insert;
begin
  FTaskRepository.Insert(Self);
end;

function TTaskModel.PriorityId: Integer;
begin
  Result := FPriorityId;
end;

function TTaskModel.PriorityId(APriorityId: Integer): ITaskModel;
begin
  Result := Self;
  FPriorityId := APriorityId;
end;

function TTaskModel.Read: TList<ITaskModel>;
begin
  Result := FTaskRepository.Read;
end;

function TTaskModel.ReadDashboard: TTaskDashBoardDto;
begin
  Result := FTaskRepository.ReadDashboard;
end;

function TTaskModel.StatusId(AStatusId: Integer): ITaskModel;
begin
  Result := Self;
  FStatusId := AStatusId;
end;

function TTaskModel.StatusId: Integer;
begin
  Result := FStatusId;
end;

procedure TTaskModel.Update;
begin
  FTaskRepository.Update(Self);
end;

end.
