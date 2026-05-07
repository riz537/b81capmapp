using { capmb81.db as db } from '../db/schema';

service ProductsMgmtService{
    entity Products as projection on db.Products;
}


