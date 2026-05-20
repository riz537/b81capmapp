const cds = require('@sap/cds');
const { INSERT } = require('@sap/cds/lib/ql/cds-ql');

module.exports = class ProductsMgmtService extends cds.ApplicationService { 
 init() {
const { Products } = this.entities(ProductsMgmtService);

// on handlder for create event of Products entity
//   this.on("CREATE",Products, async (req) => {
//      console.log("Create event triggered for Products entity");
//      console.log("Request data: ", req.data);
//       let result =  await  INSERT.into(Products).entries(req.data);
//       console.log("Insert result: ", result);
//   });
// before hadnler for create event of Products entity
//  this.before("CREATE",Products, async (req) => {
//     console.log("Before Create event triggered for Products entity");
//     console.log("Request data: ", req.data);
//     if(req.data.discount === null || req.data.discount === undefined){
//         req.data.discount = 0;
//     }
//  });

//  // after hadnler for read event of Products entity
//  this.after("READ",Products, async (data) => {
//     console.log("After Read event triggered for Products entity");
//     console.log("Data read: ", data);
//  });
  return super.init()
}}