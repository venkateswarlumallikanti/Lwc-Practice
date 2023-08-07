import { LightningElement } from 'lwc';

export default class Mortgage_Calculator extends LightningElement {
    principal = 2000;
    term = 30;
    rate = 4;
    insurance = 10;
    monthlyPayment = '';
    numerator = 0;
    denominator = 0;

    //api termOptions
    getTermOptions = () =>{
        return[
            {label:'20 Years', value:20},
            {label:'25 Years', value:25},
            {label:'30 Years', value:30},
            {label:'35 Years', value:35},
            {label:'40 Years', value:40},

        ];
    };
    termOptions = this.getTermOptions();

    principalChange(event){
        console.log('event.target.value'+event.target.value)
        console.log('Before '+this.principal);
        this.principal = event.target.value;
        console.log('After 4 '+this.term)
    }

    termChange(event){
        this.term = parseInt(event.target.value, 10);
        console.log('After 3 '+this.term);
    }

    rateChange(event)
    {
        this.term = parseInt(event.target.value,10);
        console.log('After 4'+this.term)
    }

    InsuranceChange(event){
        this.insurance = event.target.value;
        console.log('After 1 '+this.insurance)
    }

    calculateMonthlyPayment = (event) => {
        console.log('Inside calculate monthly');

        if(this.principal && this.term && this.rate && this.insurance > 0){
            this.numerator = this.principal + this.insurance + this.rate;
            this.denominator = this.term*12;
            this.monthlyPayment = this.numerator/this.denominator;
            console.log('Sucessfully calculated value is : ' + this.monthlyPayment);

            console.log('monthly payment '+this.monthlyPayment);
            return this.monthlyPayment;
        }
    };

}