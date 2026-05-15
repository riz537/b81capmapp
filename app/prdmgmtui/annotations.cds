using ProductsMgmtService as service from '../../srv/prdmgmt-srv';

annotate service.Products with @(UI.SelectionFields: [
    ID,
    name,
    price,
],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Value : discount,
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Criticality : statusCriticality,
            CriticalityRepresentation : #WithIcon,
           
        },
      
    ],
    UI.HeaderInfo : {
        TypeNamePlural : 'Products',
        TypeName : 'Product',
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : description,
        },
        ImageUrl : image,
    },
    UI.DataPoint #ID : {
        $Type : 'UI.DataPointType',
        Value : ID,
        Title : 'ID',
    },
    UI.DataPoint #price : {
        $Type : 'UI.DataPointType',
        Value : price,
        Title : 'Price',
    },
    UI.DataPoint #stock : {
        $Type : 'UI.DataPointType',
        Value : stock,
        Title : 'Stock',
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ID',
            Target : '@UI.DataPoint#ID',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Price',
            Target : '@UI.DataPoint#price',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Stock',
            Target : '@UI.DataPoint#stock',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Product Information',
            ID : 'ProductInformation',
            Target : '@UI.FieldGroup#ProductInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Upload Product Image',
            ID : 'UploadProductImage',
            Target : '@UI.FieldGroup#UploadProductImage',
        },
    ],
    UI.FieldGroup #ProductInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Value : discount,
            },
            {
                $Type : 'UI.DataField',
                Value : stock,
            },
        ],
    },
    UI.FieldGroup #UploadProductImage : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : image,
                Label : 'Select the Image',
            },
        ],
    },);

annotate service.Products with {
    ID          @Common.Label: 'Product ID';
    name        @Common.Label: 'Name';
    price       @Common.Label: 'Price';
    description @Common.Label: 'Description';
    discount    @Common.Label: 'Discount';
    stock       @Common.Label: 'Stock';
    status      @Common.Label: 'Status';
};
