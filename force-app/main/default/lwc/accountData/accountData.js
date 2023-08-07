import { LightningElement, track ,wire} from 'lwc';
import getAccountDetails from '@salesforce/apex/AccountData.getAccountDetails';

export default class AccountData extends LightningElement {
    @track columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Id', fieldName: 'Id'}
    ];
   @track accountList;

   //Method 2
   @wire (getAccountDetails) wiredAccounts({data,error}){
        if (data) {
             this.accountList = data;
        console.log(data); 
        } else if (error) {
        console.log(error);
        }
   }
}