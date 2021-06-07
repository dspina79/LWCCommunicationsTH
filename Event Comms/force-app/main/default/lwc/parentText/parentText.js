import { LightningElement } from 'lwc';

export default class ParentText extends LightningElement {
    nameText = '';

    handleChange(event) {
        this.nameText = event.target.value; 
        this.template.querySelector('c-child-text').sampleText = this.nameText;
    }

    submitText() {
        // todo: send message to other control.
    }
}