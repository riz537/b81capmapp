namespace capmb81.db;

using { cuid,managed } from '@sap/cds/common';



entity Products:cuid,managed{
    name: String(50) @mandatory;
    description: String(100) ;
    price: Decimal(9,2) @mandatory;
    discount: Integer ;
    stock: Integer @mandatory;
    image: LargeBinary @Core.MediaType: 'image/jpeg';
}
entity Orders: cuid, managed{
    customerName: String(30) @mandatory;
    customerMobile: String(10);
    storeName: String(20);
    netPrice: Decimal(9,2);
    items: Composition of many OrderItems on items.order = $self;
} 

entity OrderItems:cuid{
    order: Association to Orders;
    product: Association to Products;
    quantity: Integer;
    unitPrice: Decimal(9,2);
    discount: Integer;
    totalPrice: Decimal(9,2);
}

