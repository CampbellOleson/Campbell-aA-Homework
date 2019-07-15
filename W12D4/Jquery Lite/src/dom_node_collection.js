class DOMNodeCollection {
    constructor (elements) {
        this.elements = elements;
    }

    html ([str]) {
        if (str) {
            for (let i = 0; i < this.elements.length; i++) {
                const node = this.elements[i];
                node.innerHTML = str;
            }
        } else {
            return this.elements[0].innerHTML;
        }
    }

    empty() {
        for (let i = 0; i < this.elements.length; i++) {
            const node = this.elements[i];
            node.innerHTML = "";
            node.outerHTML = "";
        }
    }

    append(arg) {
        if ((typeof arg) === DOMNodeCollection) {
            for (let i = 0; i < this.elements.length; i++) {
                const thisNode = this.elements[i];
                const argNode = arg[i];
                thisNode.innerHTML.appendChild(argNode.outerHTML);
            }
        } else if ((typeof arg) === HTMLElement || (typeof arg) === String) {
            for (let i = 0; i < this.elements.length; i++) {
                const node = this.elements[i];
                node.innerHTML.appendChild(arg);
            }
        }
    }

    attr( key [,value] ) {
        if (typeof value === string) {
            for (let i = 0; i < this.elements.length; i++) {
                const node = this.elements[i];
                node.setAttribute(key,value);
            }
        } else {
                const node = this.elements[0];
                node.getAttribute(key);
        }
    }

    addClass(key) {
        for (let i = 0; i < this.elements.length; i++) {
            const node = this.elements[i];
            node.classList.add(key);
        }
    }

    removeClass(key) {
        for (let i = 0; i < this.elements.length; i++) {
            let node = this.elements[i];
            node.classList.remove(key);
        }
    }
}

module.exports = DOMNodeCollection;