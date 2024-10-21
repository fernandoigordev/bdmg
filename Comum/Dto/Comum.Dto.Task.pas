unit Comum.Dto.Task;

interface

type

  TTaskDto = class
  private
    FId: Integer;
    FDescription: String;
    FStatus: Integer;
    FPriority: Integer;
  public
    property Id: Integer read FId write FId;
    property Description: String read FDescription write FDescription;
    property StatusId: Integer read FStatus write FStatus;
    property PriorityId: Integer read FPriority write FPriority;


  end;

implementation

end.
