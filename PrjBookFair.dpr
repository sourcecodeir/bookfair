program PrjBookFair;

uses
  Vcl.Forms,
  BookFair in 'BookFair.pas' {RegisterBookShelfForm},
  mainUnit in 'mainUnit.pas' {mainForm},
  GroupBookUnit in 'GroupBookUnit.pas' {showGroupBookForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TmainForm, mainForm);
  Application.CreateForm(TRegisterBookShelfForm, RegisterBookShelfForm);
  Application.CreateForm(TshowGroupBookForm, showGroupBookForm);
  Application.Run;
end.
