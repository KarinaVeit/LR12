unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
TParallel = class;
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    BitBtn1: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

TParallel = class
  public
  Fa:word; //���� �������� ������
  Fb:word; //���� �������� �����
  Fc:word; //���� �������� ������
  procedure Init (a,b,c: word);
  function Volume: word; //�����-�������
                         //������������ �����
  procedure Show;

    end; //����� �������� ������

var
  Form1: TForm1;   Par1:TParallel;    Par:array [1..5] of TParallel;
  x:word=0;
  y:word=0;
  z:word=0;

implementation

{$R *.dfm}

{ TParallel }
procedure TParallel.Init(a, b, c: word);
begin
  Fa:=a;
  Fb:=b;
  Fc:=c;
end;

procedure TParallel.Show;
begin
  ShowMessage('����� ��������������� �����'
  + IntToStr(Volume)+#10#13 + '������-���� Fa='+IntToStr(Fa)+#10#13 + '�����-���� Fb='+IntToStr(Fb)+#10#13 + '������-���� Fc='+IntToStr(Fc)+#10#13);
end;

function TParallel.Volume: word;
begin
 result:=Fa*Fb*Fc;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  x:=x+1; y:=y+1; z:=z+1;
  Par1:=TParallel.Create;
  Par[x]:=Par1;
  Par1.Init(x,y,z);
  Par1.Show;
  Memo1.Lines.Add('����� � ������ �������, ���������� � Par1, �����' +IntToStr (integer(Par1)));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if Par1 = nil then
  Form1.Caption:='������� � ������ ���'
    else
    Form1.Caption:='������ ���������� � ������';
end;

procedure TForm1.Button3Click(Sender: TObject);
var
    i:integer;
begin
  for  i := 1 to 5 do
    Memo1.Lines.Add(('����� ������� � ������� ' +IntToStr(i)+ ' ����� ' +IntToStr (integer(Par[i])) + ' ���� Fa= ' +IntToStr(Par[i].Fa)));
end;

end.
