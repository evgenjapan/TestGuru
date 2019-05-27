document.addEventListener('turbolinks:load', function() {
    let controlConf = document.querySelector('.passwords');

    if (controlConf) {
        controlConf.addEventListener('input', comparePasswdFields);
    }
});

function comparePasswdFields() {
    let passwordVal = document.getElementById("password").value;
    let passwordRepeatVal = document.getElementById("password-repeat").value;

    if (passwordRepeatVal === '') hideIcons();
    if (passwordRepeatVal) statusSwitcher(passwordVal, passwordRepeatVal);
}

function statusSwitcher (val1, val2) {
    let matchingStatus = document.querySelector('.match');
    let mismatchingStatus = document.querySelector('.mismatch');

    if (val1 !== val2) {
        mismatchingStatus.classList.remove('hide');
        matchingStatus.classList.add('hide');
    }
    else {
        matchingStatus.classList.remove('hide');
        mismatchingStatus.classList.add('hide');
    }
}

function hideIcons() {
    document.querySelector('.help-block').classList.add('hide');
}
