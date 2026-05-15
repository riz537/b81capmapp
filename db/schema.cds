namespace capmb81.db;

using { cuid,managed } from '@sap/cds/common';



entity Products:cuid,managed{
    name: String(50);
    description: String(100);
    price: Decimal(9,2);
    discount: Integer;
    stock: Integer;
    dummy: Integer;
    image: LargeBinary @Core.MediaType: 'image/jpeg';
}
entity Orders: cuid, managed{
    customerName: String(30);
    customerMobile: String(10);
    storeName: String(20);
    netPrice: Decimal(9,2);
    items: Composition of many OrderItems on items.order = $self;
} 

entity OrderItems:cuid{
    order: Association to Orders;
    product: Association to Products;
    quantity: Integer;
    untiPrice: Decimal(9,2);
    discount: Integer;
    totalPrice: Decimal(9,2);
}

