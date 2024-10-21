unit View.Task;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList,
  Datasnap.DBClient, Controller.Task, Vcl.Mask, Vcl.DBCtrls;

type
  TTaskView = class(TForm)
    PageControlTask: TPageControl;
    TabSheetSearch: TTabSheet;
    TabSheetRegister: TTabSheet;
    PanelHeader: TPanel;
    EditSearchTask: TEdit;
    DBGrid1: TDBGrid;
    ShapeNewTask: TShape;
    SpeedButtonNewTask: TSpeedButton;
    ClientDataSetTask: TClientDataSet;
    DataSourceTask: TDataSource;
    ImageListTask: TImageList;
    ClientDataSetTaskId: TIntegerField;
    ClientDataSetTaskDescription: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    PanelBottonRegister: TPanel;
    ShapeSave: TShape;
    ShapeCancel: TShape;
    SpeedButtonSave: TSpeedButton;
    SpeedButtonCancel: TSpeedButton;
    PanelTop: TPanel;
    DBComboBoxStatus: TDBComboBox;
    DBComboBoxPriority: TDBComboBox;
    ClientDataSetTaskStatus: TStringField;
    ClientDataSetTaskPriority: TStringField;
    EditStatus: TEdit;
    EditPriority: TEdit;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButtonNewTaskClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButtonCancelClick(Sender: TObject);
    procedure SpeedButtonSaveClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EditSearchTaskChange(Sender: TObject);
    procedure DBComboBoxStatusChange(Sender: TObject);
    procedure DBComboBoxPriorityChange(Sender: TObject);
  private
    class var FInstance: TTaskView;
    FTaskController: TTaskController;
    Procedure EditTask;
    procedure DeleteTask;
    procedure NewTask;
    procedure FilterTask;
    procedure DoSave;
    procedure DoCancel;
    procedure DoNewTask;
    procedure DoEditTask;
    procedure ChangeTabSheet(ATabSheet: TTabSheet);
    procedure SetDescriptionStatus;
    procedure SetDescriptionPriority;
  public
    class function Instance(AParent: TWinControl): TTaskView;
  end;

implementation

uses
  Types.Task;

{$R *.dfm}

procedure TTaskView.ChangeTabSheet(ATabSheet: TTabSheet);
begin
  PageControlTask.ActivePage := ATabSheet;
  if ATabSheet = TabSheetRegister then
  begin
    SetDescriptionStatus;
    SetDescriptionPriority;
  end;
end;

procedure TTaskView.DBComboBoxPriorityChange(Sender: TObject);
begin
  SetDescriptionPriority;
end;

procedure TTaskView.DBComboBoxStatusChange(Sender: TObject);
begin
  SetDescriptionStatus;
end;

procedure TTaskView.DBGrid1CellClick(Column: TColumn);
begin
  if Column.Index = 4 then
    DoEditTask
  else if Column.Index = 5 then
    DeleteTask;
end;

procedure TTaskView.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Column.Index in [4, 5] then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);
    if Column.Index = 4 then
      ImageListTask.Draw(TDBGrid(Sender).Canvas, Rect.Left +1,Rect.Top + 1, 0)
    else
      ImageListTask.Draw(TDBGrid(Sender).Canvas, Rect.Left +1,Rect.Top + 1, 1);
  end;
end;

procedure TTaskView.DeleteTask;
begin
  FTaskController.DeleteTask;
  FTaskController.ReadTasks;
end;

procedure TTaskView.DoCancel;
begin
  ClientDataSetTask.Cancel;
  ChangeTabSheet(TabSheetSearch);
end;

procedure TTaskView.DoEditTask;
begin
  if ClientDataSetTask.RecordCount > 0 then
  begin
    ClientDataSetTask.Edit;
    ChangeTabSheet(TabSheetRegister);
  end;
end;

procedure TTaskView.DoNewTask;
begin
  ClientDataSetTask.Append;
  ChangeTabSheet(TabSheetRegister);
end;

procedure TTaskView.DoSave;
var
  Editing: Boolean;
begin
  Editing := ClientDataSetTask.State = dsEdit;
  ClientDataSetTask.Post;

  if Editing then
    EditTask
  else
    NewTask;
  ChangeTabSheet(TabSheetSearch);
end;

procedure TTaskView.EditSearchTaskChange(Sender: TObject);
begin
  FilterTask;
end;

procedure TTaskView.EditTask;
begin
  FTaskController.UpdateTask;
  FTaskController.ReadTasks;
end;

procedure TTaskView.FilterTask;
begin
  ClientDataSetTask.Filtered := False;
  ClientDataSetTask.Filter := Concat('UPPER(Description) LIKE ''%', UpperCase(EditSearchTask.Text), '%''');
  ClientDataSetTask.Filtered := True;
end;

procedure TTaskView.FormCreate(Sender: TObject);
begin
  FTaskController := TTaskController.Create(ClientDataSetTask);
end;

procedure TTaskView.FormDestroy(Sender: TObject);
begin
  FTaskController.Free;
end;

procedure TTaskView.FormShow(Sender: TObject);
begin
  FTaskController.ReadTasks;
  ChangeTabSheet(TabSheetSearch);
end;

class function TTaskView.Instance(AParent: TWinControl): TTaskView;
begin
  if not Assigned(FInstance) then
  begin
    FInstance := TTaskView.Create(nil);
    FInstance.Parent := AParent;
  end;

  Result := FInstance;
end;

procedure TTaskView.NewTask;
begin
  FTaskController.CreateTask;
  FTaskController.ReadTasks;
end;

procedure TTaskView.SetDescriptionPriority;
var
  Priority: TTaskPriority;
begin
  Priority := TTaskPriority(StrToIntDef(DBComboBoxPriority.Text, 0));
  EditPriority.Text := TTaskPriorityDescription[Priority];
end;

procedure TTaskView.SetDescriptionStatus;
var
  Status: TTaskStatus;
begin
  Status := TTaskStatus(StrToIntDef(DBComboBoxStatus.Text, 0));
  EditStatus.Text := TTaskStatusDescription[Status];
end;

procedure TTaskView.SpeedButtonCancelClick(Sender: TObject);
begin
  DoCancel;
end;

procedure TTaskView.SpeedButtonNewTaskClick(Sender: TObject);
begin
  DoNewTask;
end;

procedure TTaskView.SpeedButtonSaveClick(Sender: TObject);
begin
  DoSave;
end;

end.
