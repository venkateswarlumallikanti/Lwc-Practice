import { LightningElement, track } from 'lwc';
import addressData from '@salesforce/apex/LatLong2Address.addressData';
import weatherData from '@salesforce/apex/WeatherClass.weatherData';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class AddressCustom extends LightningElement {
    @track latVar = "";
    @track longVar = "";
    @track countryVar = "";
    @track mapVisible = false;
    @track addressInstance = "";
    @track tempC = "";
    @track tempF = "";
    @track windKph = "";
    @track tempText = "";
    @track iconVar = "";
    mapMarkers = [
        {
            location: {
                // Location Information
                Latitude: '37.790197',
                Longitude: '-122.396879'
            },

            // For onmarkerselect
            value: 'SF1',

            // Extra info for tile in list & info window
            icon: 'standard:account',
            title: 'Julies Kitchen', // e.g. Account.Name
            description: 'This is a long description',
        },
    ];

    selectedMarkerValue = 'SF1';
    handleMarkerSelect(event) {
        this.selectedMarkerValue = event.target.selectedMarkerValue;
    }

    handleChange(event) {
        if (event.target.name === "latitudeName") {
            this.latVar = event.target.value;
        }
        else {
            this.longVar = event.target.value;
        }
    }

    handleClick() {
        if (this.latVar === "" || this.longVar === "") {
            this.showErrorToast();
        }
        else {
            addressData({
                lat: this.latVar,
                longg: this.longVar
            }).then(result => {
                console.log("result==>" + result);
                if (result !== "someting went wrong") {
                    this.addressInstance = result;
                }
                else {
                    this.showErrorToast();
                    return;
                }

            })
            weatherData({
                latlongg: this.latVar + "," + this.longVar
            }).then(result => {
                console.log("result==>" + result);
                console.log("result-->" + JSON.stringify(result));
                this.tempC = result.current.temp_c;
                this.tempF = result.current.temp_f;
                this.tempText = result.current.condition.text;
                this.iconVar = result.current.condition.icon;
                this.windKph = result.current.condition.wind_kph;
                if (result !== null) {

                }
                else {
                    this.showErrorToast();
                    return;
                }

            })
            var a = this.addressInstance.toString();
            this.mapVisible = true;

            let tempMarkers = [];

            let marker = {
                location: {
                    Latitude: this.latVar,
                    Longitude: this.longVar
                },
                title: a,
                description: '',
                icon:'utility:salesforce1'
            };
            tempMarkers.push(marker);
            this.mapMarkers = tempMarkers;
        }

    }

    showErrorToast() {
        const evt = new ShowToastEvent({
            title: 'Toast Error',
            message: 'someting went wrong',
            variant: 'error',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }

}