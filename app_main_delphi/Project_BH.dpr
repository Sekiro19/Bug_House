program Project_BH;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit_main in 'Unit_main.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
