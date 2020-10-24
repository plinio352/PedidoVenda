unit UCliente;

interface

uses
   Data.DB,  Data.Win.ADODB;

type
   TCliente = class
  private
    Fuf: string;
    Fcodigo: Integer;
    Fnome: string;
    Fcidade: string;
    procedure Setcidade(const Value: string);
    procedure Setcodigo(const Value: Integer);
    procedure Setnome(const Value: string);
    procedure Setuf(const Value: string);

   public
      property codigo: Integer read Fcodigo write Setcodigo;
      property nome: string read Fnome write Setnome;
      property cidade: string read Fcidade write Setcidade;
      property uf:string read Fuf write Setuf;

   end;


implementation

{ TCliente }

procedure TCliente.Setcidade(const Value: string);
begin
  Fcidade := Value;
end;

procedure TCliente.Setcodigo(const Value: Integer);
begin
  Fcodigo := Value;
end;

procedure TCliente.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure TCliente.Setuf(const Value: string);
begin
  Fuf := Value;
end;

end.
