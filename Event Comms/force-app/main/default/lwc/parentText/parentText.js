import { LightningElement } from 'lwc';

export default class ParentText extends LightningElement {
    nameText = '';

    handleChange(event) {
        this.nameText = event.target.value; 
    }

    submitText() {
        // todo: send message to other control.
    }
}