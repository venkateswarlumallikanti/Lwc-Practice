import { LightningElement, api } from 'lwc';

export default class AccountLwc extends LightningElement {
    greeting = 'welcome to salesforce';
    inputText= '';
    @api message = 'this is sample message';


    handleClick(event){
        this.inputText = event.target.value;
        window.console.log('event.target ',event.target);

    }

    handleSubmit(){
        alert('button clicked');
    }
}