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
  Fa:word; //поле хранящее ширину
  Fb:word; //поле хранящее длину
  Fc:word; //поле хранящее высоту
  procedure Init (a,b,c: word);
  function Volume: word; //метод-функция
                         //возвращающая объем
  procedure Show;

    end; //конец описания класса

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
  ShowMessage('Объем параллелепипеда равен'
  + IntToStr(Volume)+#10#13 + 'Ширина-Поле Fa='+IntToStr(Fa)+#10#13 + 'Длина-Поле Fb='+IntToStr(Fb)+#10#13 + 'Высота-Поле Fc='+IntToStr(Fc)+#10#13);
end;

function TParallel.Volume: word;
begin
 result:=Fa*Fb*Fc; {возвращаем во внешнюю программу объемы в виде значения типа word}
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
  Memo1.Lines.Add('Адрес в памяти объекта, содержащий в Par1, равен' +IntToStr (integer(Par1)));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if Par1 = nil then
  Form1.Caption:='Объекта в памяти нет'
    else
    Form1.Caption:='Объект существует в памяти';
end;

procedure TForm1.Button3Click(Sender: TObject);
var
    i:integer;
begin
  for  i := 1 to 5 do
    Memo1.Lines.Add(('Адрес объекта с номером ' +IntToStr(i)+ ' равен ' +IntToStr (integer(Par[i])) + ' Поле Fa= ' +IntToStr(Par[i].Fa)));
end;

end.
