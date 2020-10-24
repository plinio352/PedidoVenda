unit UClienteController;

interface

uses
   UDmVenda;

type
   ITClienteController = interface
      ['{D267F25F-E1D0-45F5-9D88-68CB5AC80A5F}']
      function lstCliente: OleVariant;

   end;

   TClienteController = class(TInterfacedObject, ITClienteController)
   public
      function lstCliente: OleVariant;
   end;

implementation

{ TClienteController }


function TClienteController.lstCliente: OleVariant;
begin
   dmVenda.qryCliente.Close;
   dmVenda.qryCliente.Open;

   Result := dmVenda.dspCliente.Data;

end;

end.
