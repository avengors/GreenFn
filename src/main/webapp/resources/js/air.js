"use strict";

async function getDust(informCode) {
    const response = await axios.get(`/green/api/air/${informCode}`);
    return response.data.items;
}

function displayItems(items) { // JSON을 HTML에 표시
    for (const item of items) {
        for (const [city, grade] of Object.entries(item.informGrade)) {
            const tr = document.getElementById(city);

            const th = tr.querySelector("th");
            if (!th) {
                const newTh = document.createElement("th");
                newTh.innerText = city;
                tr.append(newTh)
            }

            const td = document.createElement("td");
            td.innerText = grade;

            tr.append(td);
        }
    }
}

function refreshDustInfo(ev) {
    document.querySelectorAll("#dustTBody td").forEach(elem => elem.remove());
    getDust(ev.target.value).then(displayItems);
}

document.querySelectorAll(".dustButton")
    .forEach(elem => elem.addEventListener("click", refreshDustInfo));

getDust("pm10").then(displayItems);