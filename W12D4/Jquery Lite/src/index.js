const DOMNodeCollection = require("./dom_node_collection");

const $l = function (e) {
    if ((typeof e) === "string") {
        debugger
        const nodeCollention = document.querySelectorAll(e);
        return Array.from(nodeCollention);
    } else if ((typeof e) === HTMLElement) {
        const arr =[e];
        return new DOMNodeCollection(arr);
    }
}

window.$l = $l;


//TEST TIPS

//inheritance
//surrogate
//curry
//bind