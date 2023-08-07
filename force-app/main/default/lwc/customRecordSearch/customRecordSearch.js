import { LightningElement, track } from 'lwc';
import getAccountData from '@salesforce/apex/AccountSearch.getAccountData';

export default class CustomRecordSearch extends LightningElement {

searchKey;
@track accounts;


// This Function will get the value from the input
handleSearch(event){
    this.searchKey = event.target.value;
}

//
searchAccountHandler(){

    getAccountData({textKey : this.searchKey})
    .then(result => {
        this.accounts = result;
    })
    .catch(error =>{
        this.accounts = null;
    });
}

cols = [
    {label:'Account Name',fieldName:'Name', type:'text'},
    {label:'Phone',fieldName:'Phone', type:'Phone'},
    {label:'Industry',fieldName:'Industry', type:'text'}
    
]

}