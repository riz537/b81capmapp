namespace capmb81.db;

entity Products{
    key ID: String(6);
    name: String(50);
    description: String(100);
    price: Decimal(9,2);
    discount: Integer;
    stock: Integer;
}
