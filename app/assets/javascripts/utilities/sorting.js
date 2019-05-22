document.addEventListener('turbolinks:load', () => {
    let control = document.querySelector('.sort-by-title');

    if (control) control.addEventListener('click', sortRowsByTitle);
});

function sortRowsByTitle() {
    let testDivs = document.getElementsByClassName('test');
    let contentBlock = document.querySelector('.tests');

    let sortedItems = [];

    for (let i = 0; i < testDivs.length; i++) {
        sortedItems.push(testDivs[i]);
    }

    let arrowUp = this.querySelector('.octicon-arrow-up');
    let arrowDown = this.querySelector('.octicon-arrow-down');

    if (arrowUp.classList.contains('hide')) {
        sortedItems.sort(compareRowsAsc);
        arrowUp.classList.remove('hide');
        arrowDown.classList.add('hide');
    } else {
        sortedItems.sort(compareRowsDesc);
        arrowDown.classList.remove('hide');
        arrowUp.classList.add('hide');
    }

    const sortedDiv = document.createElement('div');

    sortedDiv.classList.add('row', 'tests');

    for (let i = 0; i < sortedItems.length; i++) {
        sortedDiv.appendChild(sortedItems[i]);
    }

    contentBlock.parentNode.replaceChild(sortedDiv, contentBlock);


}

function compareRowsAsc(firstTest, secondTest) {
    let firstTitle = firstTest.querySelector('.card-header').textContent;
    let secondTitle = secondTest.querySelector('.card-header').textContent;

    if (firstTitle < secondTitle) return -1;
    if (firstTitle > secondTitle) return 1;
    return 0
}

function compareRowsDesc(firstTest, secondTest) {
    let firstTitle = firstTest.querySelector('.card-header').textContent;
    let secondTitle = secondTest.querySelector('.card-header').textContent;

    if (firstTitle > secondTitle) { return -1}
    if (firstTitle < secondTitle) { return 1 }
    return 0
}
