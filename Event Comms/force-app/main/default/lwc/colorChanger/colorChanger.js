import { LightningElement } from 'lwc';

export default class ColorChanger extends LightningElement {
    currentColor = "blue";

    handleChange(event) {
        this.currentColor = event.target.value;
    }
    
    handleColorChange() {
        this.dispatchEvent(new CustomEvent('colorchange', {
            detail: this.currentColor
        }));
    }
}