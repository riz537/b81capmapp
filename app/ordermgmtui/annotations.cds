using OrderMgmtService as service from '../../srv/ordermgmt-srv';

annotate service.Orders with @(UI.SelectionFields: [
    ID,
    storeName,
    customerName,
],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : customerName,
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : storeName,
        },
        {
            $Type : 'UI.DataField',
            Value : netPrice,
        },
    ],
    UI.HeaderInfo : {
        TypeNamePlural : 'Orders',
        TypeName : 'Order',
        Title : {
            $Type : 'UI.DataField',
            Value : ID,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : customerName,
        },
    },
    UI.DataPoint #netPrice : {
        $Type : 'UI.DataPointType',
        Value : netPrice,
        Title : 'netPrice',
    },
    UI.DataPoint #storeName : {
        $Type : 'UI.DataPointType',
        Value : storeName,
        Title : 'storeName',
    },
    UI.DataPoint #createdBy : {
        $Type : 'UI.DataPointType',
        Value : createdBy,
        Title : 'createdBy',
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'netPrice',
            Target : '@UI.DataPoint#netPrice',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'storeName',
            Target : '@UI.DataPoint#storeName',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'createdBy',
            Target : '@UI.DataPoint#createdBy',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Order Information',
            ID : 'OrderInformation',
            Target : '@UI.FieldGroup#OrderInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Item Details',
            ID : 'ItemDetails',
            Target : 'items/@UI.LineItem#ItemDetails',
        },
    ],
    UI.FieldGroup #OrderInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : customerName,
            },
            {
                $Type : 'UI.DataField',
                Value : customerMobile,
                Label : 'customerMobile',
            },
            {
                $Type : 'UI.DataField',
                Value : storeName,
            },
            {
                $Type : 'UI.DataField',
                Value : netPrice,
            },
        ],
    },);

annotate service.Orders with {
    ID           @(
        Common.Label: 'Order ID',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Orders',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ID,
                    ValueListProperty : 'ID',
                },
            ],
            Label : 'Select Order ID',
        },
        Common.ValueListWithFixedValues : false,
    );
    storeName    @Common.Label: 'Store Name';
    customerName @Common.Label: 'Customer Name';
    customerMobile @Common.Label: 'Customer Mobile';
    netPrice @Common.Label: 'Net Price'
};
annotate service.OrderItems with @(
    UI.LineItem #ItemDetails : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'Item ID',
        },
        {
            $Type : 'UI.DataField',
            Value : order_ID,
            Label : 'Order ID',
        },
        {
            $Type : 'UI.DataField',
            Value : product_ID,
            Label : 'Product ID',
        },
        {
            $Type : 'UI.DataField',
            Value : quantity,
            Label : 'Quantity',
        },
        {
            $Type : 'UI.DataField',
            Value : unitPrice,
            Label : 'Unit Price',
        },
        {
            $Type : 'UI.DataField',
            Value : discount,
            Label : 'Discount',
        },
        {
            $Type : 'UI.DataField',
            Value : totalPrice,
            Label : 'Total Price',
        },
    ]
);

annotate service.OrderItems with {
    product @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Products',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'price',
                    LocalDataProperty : unitPrice,
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'discount',
                    LocalDataProperty : discount,
                },
            ],
            Label : 'Select Product',
        },
        Common.ValueListWithFixedValues : false,
)};

