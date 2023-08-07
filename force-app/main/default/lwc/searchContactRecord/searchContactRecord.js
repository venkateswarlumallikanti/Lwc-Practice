import { LightningElement, track } from 'lwc';
import getContactData from '@salesforce/apex/ContactSearch.getContactData';

export default class SearchContactRecord extends LightningElement {

    searchKey;
    @track contacts;

    // THis function will vet the value from the input
    handleSearch(event){
        this.searchKey = event.target.value;
    }


    searchContactHandler(){
        
        getContactData({textKey : this.searchKey})
            .then(result =>{
        this.contacts = result;
        })
        .catch(error =>{
            this.contacts = null;
        });
    }

    cols = [
        {label: 'Name',fieldName:'Name',type:'text'},
        {label: 'Phone',fieldName:'Phone',type:'Phone'},
        {label: 'Account Name',fieldName:'AccountId',type:'lookup'}
    ]
}