document.getElementById("menu1").onclick = function () {
    toggleMenuActive("menu1");
    fetch('listSubjectsJson')
            .then(status)
            .then(json)
            .then(function (data) {
                printListSubjects(data);
                console.log('Request succeeded with JSON response', data);
            })
            .catch(function (error) {
                console.log('Request failed', error);
            });
};

document.getElementById("menu2").onclick = function () {
    toggleMenuActive("menu2");
    fetch('listPersonsJson')
            .then(status)
            .then(json)
            .then(function (data) {
                printListPersons(data);
                console.log('Request succeeded with JSON response', data);
            })
            .catch(function (error) {
                console.log('Request failed', error);
            });
};

document.getElementById("menu3").onclick = function () {
    toggleMenuActive("menu3");
};

document.getElementById("menu4").onclick = function () {
    toggleMenuActive("menu4");
};

function toggleMenuActive(elementId) {
    let activeElement = document.getElementById(elementId);
    let passiveElements = document.getElementsByClassName("nav-item");
    for (let i = 0; i < passiveElements.length; i++) {
        if (activeElement === passiveElements[i]) {
            passiveElements[i].classList.add("active");
        } else {
            if (passiveElements[i].classList.contains("active")) {
                passiveElements[i].classList.remove("active");
            }
        }
    }
}

function status(response) {
    if (response.status >= 200 && response.status < 300) {
        return Promise.resolve(response)
    } else {
        return Promise.reject(new Error(response.statusText))
    }
}

function json(response) {
    return response.json()
}

function printListSubjects(data) {
    let cards = '';
    for (let i = 0; i < data.length; i++) {
        cards +=
                `<div class="card border-primary mb-3" style="max-width: 12rem;">
                <div class="card-header">${data[i].id}</div>
                <div class="card-body">
                  <h4 class="card-title">${data[i].name}</h4>
                  <p class="card-text">${data[i].teacher}</p>
                </div>
                </div>`;
    }
    document.getElementById('content').innerHTML = cards;
}

function printListPersons(data) {
    let cards = '';
    for (let i = 0; i < data.length; i++) {
        cards +=
                `<div class="card border-primary mb-3" style="max-width: 12rem;">
                <div class="card-header">${data[i].id}</div>
                <div class="card-body">
                  <h4 class="card-title">${data[i].name}</h4>
                  <p class="card-text">${data[i].name}</p>
                </div>
                </div>`;
    }
    document.getElementById('content').innerHTML = cards;
}
