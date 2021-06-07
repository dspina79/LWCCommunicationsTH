import { api, LightningElement } from 'lwc';

export default class ChildText extends LightningElement {
    _sampleText = 'Nobody';

    @api
    get sampleText() {
        return this._sampleText;
    }
    set sampleText(value) {
        this._sampleText = value;
    }
}