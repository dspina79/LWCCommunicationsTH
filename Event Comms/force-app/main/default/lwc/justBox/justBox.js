import { LightningElement } from 'lwc';

export default class JustBox extends LightningElement {
    currentBackgroundColor = "yellow";
    changeColor(event) {
        this.currentBackgroundColor = event.detail;
    }
}