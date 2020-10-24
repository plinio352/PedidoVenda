unit UProdutoController;

interface

uses
   UDmVenda, UProduto;

type
   IProdutoController = interface
      function lstProduto: OleVariant;
      function BuscaProduto(const Value: Integer): TProduto;
   end;

   TProdutoController = class(TInterfacedObject, IProdutoController)
   public
      function lstProduto: OleVariant;
      function BuscaProduto(const Value: Integer): TProduto;

   end;

implementation

{ TProdutoController }

function TProdutoController.BuscaProduto(const Value: Integer): TProduto;
var
  obj: TProduto;
begin
   obj := TProduto.Create;

   dmVenda.qryLstProduto.Close;
   dmVenda.qryLstProduto.ParamByName('codigo').Value := Value;

   dmVenda.cdsLstProduto.Close;
   dmVenda.cdsLstProduto.Open;
   if dmVenda.cdsLstProduto.RecordCount > 0 then begin
      obj.codigo := dmVenda.cdsLstProduto.FieldByName('codigo').Value;
      obj.descricao := dmVenda.cdsLstProduto.FieldByName('descricao').Value;
      obj.precoVenda := dmVenda.cdsLstProduto.FieldByName('preco_venda').Value;
   end;

   Result := obj;

end;

function TProdutoController.lstProduto: OleVariant;
begin
   dmVenda.qryProduto.Close;
   dmVenda.qryProduto.Open;

   Result := dmVenda.dspProduto.Data;

end;

end.
