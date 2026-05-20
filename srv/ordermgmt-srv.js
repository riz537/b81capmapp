const cds = require('@sap/cds');
const { INSERT } = require('@sap/cds/lib/ql/cds-ql');

module.exports = class OrderMgmtService extends cds.ApplicationService { 
 init() {
const { Orders,OrderItems,Products } = this.entities(OrderMgmtService);

  // caluclate total price of order item based on 
     this.after("PATCH",OrderItems.drafts, async (data,req) => {
        console.log("After Patch event triggered for OrderItems entity");
        console.log("Data patched: ", data);
        //get the draft item
        let draftItem = await SELECT.one.from(OrderItems.drafts).where({ID: data.ID});
        console.log("Draft item: ", draftItem);
        if(draftItem){
            var totalPrice = (draftItem.quantity || 0) * (draftItem.unitPrice || 0);
            console.log("Calculated total price before discount: ", totalPrice);
            if(draftItem.discount>0){
                totalPrice = totalPrice - (totalPrice * draftItem.discount/100);
            }
            console.log("Calculated total price: ", totalPrice);
            await UPDATE(OrderItems.drafts).set({totalPrice:totalPrice}).where({ID: data.ID});
        }
       
     });

  return super.init()
}}