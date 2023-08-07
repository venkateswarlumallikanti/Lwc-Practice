import { api, LightningElement, track } from 'lwc';
import getProducts from '@salesforce/apex/ProductController.getProducts';
import getPriceBookEntry from '@salesforce/apex/ProductController.getPriceBookEntry';
import addedProductFunction1 from '@salesforce/apex/ProductController.addedProductFunction1';

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'List Price', fieldName: 'UnitPrice' },
    { label: 'ProductCode', fieldName: 'ProductCode' },
    { label: 'Description', fieldName: 'Description' },
    { label: 'Family', fieldName: 'Family' }
];

const columnsModal2 = [

    { label: 'Product', fieldName: 'Name' },
    { label: 'Quantity', fieldName: 'Quantity', editable: true, required: true },
    { label: 'Sales Price', fieldName: 'SalesPrice' },
    { label: 'Date', fieldName: 'ServiceDate', editable: true },
    { label: 'Line Description', fieldName: 'Description', editable: true },
];

export default class AddOpportunityProducts extends LightningElement {
    @track isModalOpen = false;
    @track isModalOpen2 = false;
    @track isModalOpen3 = false;
    @track productData;
    @track productData2;
    @track data = [];
    @track dummyData = [];
    @track columns = columns;
    @track columnsModal2 = columnsModal2;
    @track nextFlag = false;
    @track rawCount = 0;
    @api recordId;
    @track selectedData;
    @track salesListInstance = [];
    @track quantityInstance = [];
    @track pbeList = [];
    openModal() {
        this.isModalOpen = true;
    }
    closeModal() {
        this.isModalOpen = false;
    }
    connectedCallback() {
        let currentData = [];
        getPriceBookEntry({
        }).then(data => {
            data.forEach((row) => {
                let rowData = {};
                rowData.UnitPrice = row.UnitPrice;
                rowData.Id = row.Id;
                // Account related data
                if (row.Product2) {
                    rowData.Name = row.Product2.Name;
                    rowData.ProductCode = row.Product2.ProductCode;
                    rowData.Description = row.Product2.Description;
                    rowData.Family = row.Product2.Family;
                }
                currentData.push(rowData);
            });
            this.data = currentData;
            this.dummyData = currentData;
            this.productData = this.data;
            console.log("this.productData-->" + this.productData);
        })
    }
    handleKeyChange(event) {
        const proName = event.target.value;
        console.log('proName--->' + proName);
        if (proName === '') {
            //this.connectedCallback();
            console.log("this.data-->" + this.data);
            this.productData = this.dummyData;
        }
        if (proName) {
            let currentData = [];
            getProducts({ proName }).then(data => {
                data.forEach((row) => {
                    let rowData = {};
                    rowData.UnitPrice = row.UnitPrice;
                    rowData.Id = row.Id;
                    // Account related data
                    if (row.Product2) {
                        rowData.Name = row.Product2.Name;
                        rowData.ProductCode = row.Product2.ProductCode;
                        rowData.Description = row.Product2.Description;
                        rowData.Family = row.Product2.Family;
                    }
                    currentData.push(rowData);
                });

                this.data = currentData;
                this.productData = this.data;
            })
        }
    }
    visibleNext() {
        var a = this.template.querySelector("lightning-datatable").getSelectedRows();
        this.rawCount = a.length;
        if (this.rawCount === 0)
            this.nextFlag = false;
        else
            this.nextFlag = true;
    }
    getSelectedRec() {
        this.isModalOpen = false;
        this.isModalOpen2 = true;
        this.isModalOpen3 = false;
        let selectedRecords = this.template.querySelector("lightning-datatable").getSelectedRows();
        console.log('selectedRecordswithnotselect-->' + this.template.querySelector("lightning-datatable"));
        let lstSelectedLeads;
        console.log('selectedRecords are ', selectedRecords);
        let count = 0;
        lstSelectedLeads = selectedRecords;

        let proNameListId = [];
        let salesPriceList = [];
        let productNameList = [];
        let currentDataForAdded = [];
        for (let x = 0; x < lstSelectedLeads.length; x++) {
            proNameListId.push(lstSelectedLeads[x].Id);
            salesPriceList.push(lstSelectedLeads[x].UnitPrice);
            productNameList.push(lstSelectedLeads[x].Name);
            console.log('lstSelectedLeadsId------>' + lstSelectedLeads[x].Id);
            console.log('lstSelectedLeadsName------>' + lstSelectedLeads[x].Name);
            console.log('lstSelectedLeadsUnitPrice------>' + lstSelectedLeads[x].UnitPrice);
            console.log('lstSelectedLeadsProductCode------>' + lstSelectedLeads[x].ProductCode);
            console.log('lstSelectedLeadsDescription------>' + lstSelectedLeads[x].Description);
            console.log('count-->' + count);
            console.log('lstSelectedLeads------>' + lstSelectedLeads[x].Id);
            count++;

            let rowData = {};

            // rowData.Name = row.Name;
            rowData.Id = lstSelectedLeads[x].Id;
            rowData.SalesPrice = lstSelectedLeads[x].UnitPrice;
            rowData.Quantity = '';
            rowData.ServiceDate = '';
            rowData.Description = '';

            rowData.Name = lstSelectedLeads[x].Name;

            currentDataForAdded.push(rowData);


            this.data = currentDataForAdded;
            this.productData2 = this.data;
            this.selectedData = this.data;

            console.log("this.productData2-->" + JSON.stringify(this.productData2));
        }
        console.log(count);
        /*  let currentDataForAdded = [];
          addedProductFunction({ proNameListId: proNameListId,
                                  salesPriceList : salesPriceList,
                                  productNameList : productNameList,
                                  oppId : recordId
                              }).then(data => {
              data.forEach((row) => {
                  let rowData = {};
  
                 // rowData.Name = row.Name;
                  rowData.Id = row.Id;
                  rowData.SalesPrice = row.UnitPrice;
                  rowData.Quantity = row.Quantity;
                  rowData.ServiceDate = row.ServiceDate;
                  rowData.Description = row.Description;
                  // Account related data
                  if (row.Product2) {
                      rowData.Name = row.Product2.Name;
                  }
                  currentDataForAdded.push(rowData);
              });
  
              this.data = currentDataForAdded;
              this.productData2 = this.data;
          }) */
    }
    backModal() {
        this.isModalOpen = true;
        this.isModalOpen2 = false;
        this.isModalOpen3 = false;
    }
    closeModal2() {
        this.isModalOpen = false;
        this.isModalOpen2 = false;
        this.isModalOpen3 = false;
    }
    tempSave(event) {


        var tempStore = this.template.querySelector("lightning-datatable");
        console.log('tempStore----->' + tempStore.data);
        let tempDataStore = tempStore.data;
        for (let x = 0; x < tempDataStore.length; x++) {
            console.log('tempStore[x].Quantity--->' + event.detail.draftValues[x].Quantity);
            // console.log('tempStore[x].SalesPrice--->' + event.detail.draftValues[x].SalesPrice);
            this.selectedData[x].Quantity = event.detail.draftValues[x].Quantity;
            this.selectedData[x].ServiceDate = event.detail.draftValues[x].ServiceDate;
            this.selectedData[x].Description = event.detail.draftValues[x].Description;

            // this.finalPriceBookEntryId.push(event.detail.draftValues[x].Id);
            // this.finalSalePrice.push(event.detail.draftValues[x].SalesPrice);
            // this.finalListPrice.push(event.detail.draftValues[x].UnitPrice);
            // this.finalQuantity.push(event.detail.draftValues[x].Quantity);
            // this.finalDiscount.push(event.detail.draftValues[x].Discount);
        }
        console.log(" this.selectedData-->" + JSON.stringify(this.selectedData));
let d1=[];
let d2=[];
let d3=[];
        for (let x = 0; x < this.selectedData.length; x++) {

             d1.push(this.selectedData[x].Quantity);
             d2.push(this.selectedData[x].SalesPrice);
             d3.push(this.selectedData[x].Id);
        }
        this.quantityInstance=d1;
             this.salesListInstance=d2;
             this.pbeList=d3;
        console.log("hnf"); 

    }
    insertOppLineItem() {
        console.log("ere");
        console.log("ere==>"+this.recordId);
        addedProductFunction1({
            quantityInstance: this.quantityInstance,
            salesListInstance: this.salesListInstance,
            oppId: this.recordId,
            pbeList: this.pbeList
        }) .then(result => {
                console.log('result::' + result);
                this.isModalOpen=false;
                this.isModalOpen2=false;
            })
            .catch(error => {
                console.log('error::' +JSON.stringify(error));
            });
        console.log('dgv');
    }
}