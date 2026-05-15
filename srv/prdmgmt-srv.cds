using {capmb81.db as db} from '../db/schema';

service ProductsMgmtService {
    @odata.draft.enabled
    entity Products as
        projection on db.Products {
            *,
            case
                when stock = 0
                     then 'Out of stock'
                when stock < 10
                     then 'Low Stock'
                else 'In Stock'
            end as status : String(30),
             case
                when stock = 0
                     then '1'
                when stock < 10
                     then '2'
                else 3
            end as statusCriticality : Integer
        }
}
